import 'dart:math' as math;

import 'package:flutter_scene/noise.dart';
import 'package:flutter_scene/scene.dart';
import 'package:vector_math/vector_math.dart' as vm;

/// The single height/color model of the ROOTS farm. Terrain mesh, tree
/// placement and structure placement all sample these same functions, so
/// props sit on the ground.
class TerrainModel {
  static final pondCenter = vm.Vector2(-17, 13);
  static const pondRadius = 6.6;
  static const waterLevel = -1.05;

  static final _macro = FastNoiseLite(seed: 1337)
    ..noiseType = NoiseType.openSimplex2
    ..fractalType = FractalType.fbm
    ..octaves = 4
    ..frequency = 0.02;

  static final _detail = FastNoiseLite(seed: 99)
    ..noiseType = NoiseType.openSimplex2
    ..fractalType = FractalType.fbm
    ..octaves = 3
    ..frequency = 0.11;

  static final _patch = FastNoiseLite(seed: 41)
    ..noiseType = NoiseType.openSimplex2
    ..fractalType = FractalType.fbm
    ..octaves = 2
    ..frequency = 0.035;

  /// Main dirt paths as polylines.
  static final paths = [
    // Farmhouse path (NE).
    [vm.Vector2(0.5, 0.5), vm.Vector2(5, -4), vm.Vector2(10.5, -8)],
    // Pond path (SW).
    [vm.Vector2(0, 0), vm.Vector2(-9, 6), vm.Vector2(-15, 10.4)],
    // Field path (SE).
    [vm.Vector2(0, 0), vm.Vector2(2, 5), vm.Vector2(2.5, 9.6)],
  ];

  static bool _isDry(double x, double z) =>
      _patch.getNoise2(x * 0.35 + 12, z * 0.35 - 4) > 0.28;

  static double _smoothstep(double edge0, double edge1, double x) {
    final t = ((x - edge0) / (edge1 - edge0)).clamp(0.0, 1.0);
    return t * t * (3 - 2 * t);
  }

  static double distanceToPaths(double x, double z) {
    var best = 999.0;
    for (final polyline in paths) {
      for (var i = 0; i < polyline.length - 1; i++) {
        best = math.min(
          best,
          _pointSegmentDistance(x, z, polyline[i], polyline[i + 1]),
        );
      }
    }
    return best;
  }

  static double _pointSegmentDistance(
    double px,
    double pz,
    vm.Vector2 a,
    vm.Vector2 b,
  ) {
    final abx = b.x - a.x;
    final abz = b.y - a.y;
    final apx = px - a.x;
    final apz = pz - a.y;
    final lenSq = abx * abx + abz * abz;
    var t = lenSq <= 0 ? 0.0 : (apx * abx + apz * abz) / lenSq;
    t = t.clamp(0.0, 1.0);
    final dx = apx - abx * t;
    final dz = apz - abz * t;
    return math.sqrt(dx * dx + dz * dz);
  }

  /// Height of the ground at world (x, z).
  static double height(double x, double z) {
    final d = math.sqrt(x * x + z * z);

    final macro = _macro.getNoise2(x, z) * 2.4;
    final detail = _detail.getNoise2(x + 31, z - 17) * 0.30;

    // Flat center, rolling around it, rising ring at the world edge to
    // hide the boundary in fog.
    final flat = 1.0 - _smoothstep(12, 34, d);
    final rise = _smoothstep(34, 44, d) * 4.5;

    var h = (macro + detail) * (0.12 + 0.88 * flat) + rise;

    // Pond basin.
    final pd = vm.Vector2(x - pondCenter.x, z - pondCenter.y).length;
    h -= 2.1 * _smoothstep(pondRadius + 1.6, pondRadius * 0.25, pd);
    // Sandy banks.
    h += 0.55 *
        math.exp(-math.pow(pd - pondRadius - 0.9, 2) / 2.2) *
        _smoothstep(pondRadius + 3.5, pondRadius * 0.5, pd);

    return h;
  }

  /// Linear vertex color for the ground at (x, z).
  static vm.Vector4 groundColor(double x, double z, double h) {
    // Base grass with subtle spatial variation.
    final v = _macro.getNoise2(x + 90, z + 90) * 0.5 + 0.5;
    var r = 0.24 + v * 0.10;
    var g = 0.40 + v * 0.10;
    var b = 0.14 + v * 0.05;

    if (_isDry(x, z)) {
      // Dry, warm grass patches.
      r = math.max(r, 0.36);
      g = math.max(g, 0.38);
      b = math.max(b, 0.20);
    }

    // Dirt path.
    final pathD = distanceToPaths(x, z);
    final pathMix = 1 - _smoothstep(1.35, 2.6, pathD);
    if (pathMix > 0) {
      final pn = _detail.getNoise2(x * 3 + 7, z * 3 - 2) * 0.5 + 0.5;
      final dirtR = 0.33 + pn * 0.09;
      final dirtG = 0.25 + pn * 0.07;
      final dirtB = 0.17 + pn * 0.045;
      r = r * (1 - pathMix) + dirtR * pathMix;
      g = g * (1 - pathMix) + dirtG * pathMix;
      b = b * (1 - pathMix) + dirtB * pathMix;
    }

    // Sandy ground near/at the pond basin.
    final water = vm.Vector2(x - pondCenter.x, z - pondCenter.y).length;
    final sandMix =
        (1 - _smoothstep(pondRadius - 1.2, pondRadius + 2.4, water)) *
            (1 - _smoothstep(0.8, -0.2, h));
    if (sandMix > 0) {
      r = r * (1 - sandMix) + 0.46 * sandMix;
      g = g * (1 - sandMix) + 0.40 * sandMix;
      b = b * (1 - sandMix) + 0.30 * sandMix;
    }

    return vm.Vector4(r, g, b, 1);
  }

  /// Builds the terrain and water. Returns (terrainNode, waterNode).
  static (Node, Node) build() {
    const cols = 96;
    const rows = 96;
    const spacing = 1.0;

    final b = GeometryBuilder();
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        final x = (c - (cols - 1) / 2) * spacing;
        final z = (r - (rows - 1) / 2) * spacing;
        final h = height(x, z);
        b.color(groundColor(x, z, h));
        b.addVertex(vm.Vector3(x, h, z));
      }
    }
    // CCW winding so the surface faces +Y.
    for (var r = 0; r < rows - 1; r++) {
      for (var c = 0; c < cols - 1; c++) {
        final v00 = r * cols + c;
        final v10 = v00 + 1;
        final v01 = v00 + cols;
        final v11 = v01 + 1;
        b
          ..addTriangle(v00, v01, v10)
          ..addTriangle(v10, v01, v11);
      }
    }

    final terrainMaterial = PhysicallyBasedMaterial()
      ..baseColorFactor = vm.Vector4(1, 1, 1, 1)
      ..roughnessFactor = 0.95
      ..metallicFactor = 0.0;

    final terrain = Node(mesh: Mesh(b.build(), terrainMaterial))
      ..name = 'terrain';

    final water = Node(
      mesh: Mesh(
        DiscGeometry(radius: pondRadius + 0.4, segments: 48),
        PhysicallyBasedMaterial()
          ..baseColorFactor = vm.Vector4(0.10, 0.32, 0.38, 0.86)
          ..roughnessFactor = 0.06
          ..metallicFactor = 0.0,
      ),
    )
      ..position = vm.Vector3(pondCenter.x, waterLevel, pondCenter.y)
      ..name = 'water';

    return (terrain, water);
  }
}
