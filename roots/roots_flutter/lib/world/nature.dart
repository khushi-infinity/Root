import 'dart:math' as math;

import 'package:flutter_scene/scene.dart';
import 'package:vector_math/vector_math.dart' as vm;

import 'terrain.dart';

/// Nature props for the ROOTS farm, all instanced so nature across the whole
/// valley costs a handful of draw calls.
class Nature {
  static const _treeCount = 46;
  static const _rockCount = 18;
  static const _bushCount = 34;
  static const _tuftCount = 220;
  static const _reedCount = 90;

  static const _trunkRadius = 0.16;
  static const _canopyRadius = 1.15;
  static const _trunkHeight = 3.0;

  /// Instanced leaf classes and placement.
  ///
  /// [scene] gets a single [Node] holding all instanced batches.
  static Node build({required math.Random? rng}) {
    final random = rng ?? math.Random(7);
    final world = Node()..name = 'nature';

    final trunk = InstancedMesh(
      geometry: CylinderGeometry(
        bottomRadius: _trunkRadius * 1.7,
        topRadius: _trunkRadius,
        height: _trunkHeight,
        radialSegments: 10,
      ),
      material: PhysicallyBasedMaterial()
        ..baseColorFactor = vm.Vector4(0.30, 0.22, 0.14, 1)
        ..roughnessFactor = 0.85,
    );

    final canopy = InstancedMesh(
      geometry: IcosphereGeometry(radius: _canopyRadius, subdivisions: 1),
      material: PhysicallyBasedMaterial()
        ..baseColorFactor = vm.Vector4(0.85, 1.05, 0.60, 1)
        ..roughnessFactor = 0.92
        ..metallicFactor = 0.0,
    );

    var placed = 0;
    var tries = 0;
    while (placed < _treeCount && tries < 2000) {
      tries++;
      final a = random.nextDouble() * math.pi * 2;
      final r = 10.0 + random.nextDouble() * 34.0;
      final x = math.cos(a) * r;
      final z = math.sin(a) * r;

      if (_blocked(x, z)) continue;

      final h = TerrainModel.height(x, z);
      if (h < TerrainModel.waterLevel + 0.9) continue;

      final scale = 0.75 + random.nextDouble() * 0.75;

      final trunkMatrix = vm.Matrix4.identity()
        ..translateByVector3(vm.Vector3(x, h, z))
        ..rotateY(random.nextDouble() * math.pi * 2)
        ..scaleByVector3(vm.Vector3(scale, scale, scale));
      trunk.addInstance(trunkMatrix);

      // Canopy is a stack of two deformed spheres.
      final canopyColorR = 0.55 + random.nextDouble() * 0.4;
      final canopyColorG = 0.75 + random.nextDouble() * 0.45;
      final canopyColorB = 0.30 + random.nextDouble() * 0.25;

      final canopyMatrix = vm.Matrix4.identity()
        ..translateByVector3(vm.Vector3(x, h + _trunkHeight * scale, z))
        ..rotateY(random.nextDouble() * math.pi * 2)
        ..scaleByVector3(
          vm.Vector3(scale * 1.05, scale * 0.95, scale * 1.05),
        );
      canopy.addInstance(
        canopyMatrix,
        color: vm.Vector4(canopyColorR, canopyColorG, canopyColorB, 1),
      );
      placed++;
    }

    // Small side branches as second canopy layer for nicer silhouettes.
    final rocks = InstancedMesh(
      geometry: IcosphereGeometry(radius: 0.5, subdivisions: 1),
      material: PhysicallyBasedMaterial()
        ..baseColorFactor = vm.Vector4(0.48, 0.48, 0.46, 1)
        ..roughnessFactor = 0.9
        ..metallicFactor = 0.02,
    );

    for (var i = 0; i < _rockCount; i++) {
      final a = random.nextDouble() * math.pi * 2;
      final r = 8 + random.nextDouble() * 36;
      final x = math.cos(a) * r;
      final z = math.sin(a) * r;
      if (_blocked(x, z)) continue;
      final h = TerrainModel.height(x, z);
      if (h < TerrainModel.waterLevel + 0.5) continue;

      final s = 0.4 + random.nextDouble() * 1.2;
      final matrix = vm.Matrix4.identity()
        ..translateByVector3(vm.Vector3(x, h + s * 0.45, z))
        ..rotateY(random.nextDouble() * math.pi * 2)
        ..rotateX(random.nextDouble() * 0.25 - 0.12)
        ..scaleByVector3(vm.Vector3(s, s * 0.75, s * (0.7 + random.nextDouble() * 0.6)));
      final gray = 0.55 + random.nextDouble() * 0.35;
      rocks.addInstance(matrix, color: vm.Vector4(gray, gray, gray * 0.96, 1));
    }

    // Bushes: squashed green blobs near treeline.
    final bushes = InstancedMesh(
      geometry: IcosphereGeometry(radius: 0.62, subdivisions: 1),
      material: PhysicallyBasedMaterial()
        ..baseColorFactor = vm.Vector4(0.90, 1.10, 0.55, 1)
        ..roughnessFactor = 0.95,
    );
    for (var i = 0; i < _bushCount; i++) {
      final a = random.nextDouble() * math.pi * 2;
      final r = 6 + random.nextDouble() * 38;
      final x = math.cos(a) * r;
      final z = math.sin(a) * r;
      if (_blocked(x, z)) continue;
      final h = TerrainModel.height(x, z);
      if (h < TerrainModel.waterLevel + 0.7) continue;
      final s = 0.5 + random.nextDouble() * 0.6;
      final matrix = vm.Matrix4.identity()
        ..translateByVector3(vm.Vector3(x, h + s * 0.55, z))
        ..rotateY(random.nextDouble() * math.pi * 2)
        ..rotateX(random.nextDouble() * 0.2)
        ..scaleByVector3(vm.Vector3(s, s * 0.7, s));
      final cr = 0.70 + random.nextDouble() * 0.35;
      final cg = 0.85 + random.nextDouble() * 0.40;
      final cb = 0.35 + random.nextDouble() * 0.20;
      bushes.addInstance(matrix, color: vm.Vector4(cr, cg, cb, 1));
    }

    // Grass tufts: tiny cones of lighter green dotting the meadow.
    final tufts = InstancedMesh(
      geometry: CylinderGeometry(
        bottomRadius: 0.30,
        topRadius: 0.02,
        height: 0.85,
        radialSegments: 5,
      ),
      material: PhysicallyBasedMaterial()
        ..baseColorFactor = vm.Vector4(0.95, 1.25, 0.55, 1)
        ..roughnessFactor = 1.0,
    );
    for (var i = 0; i < _tuftCount; i++) {
      final a = random.nextDouble() * math.pi * 2;
      final r = 4 + random.nextDouble() * 40;
      final x = math.cos(a) * r;
      final z = math.sin(a) * r;
      if (_blocked(x, z)) continue;
      final h = TerrainModel.height(x, z);
      if (h < TerrainModel.waterLevel + 0.6) continue;
      final s = 0.6 + random.nextDouble() * 0.7;
      final matrix = vm.Matrix4.identity()
        ..translateByVector3(vm.Vector3(x, h + s * 0.3, z))
        ..rotateY(random.nextDouble() * math.pi)
        ..scaleByVector3(vm.Vector3(s, s, s));
      final cg = 0.9 + random.nextDouble() * 0.5;
      tufts.addInstance(matrix, color: vm.Vector4(0.85, cg, 0.45, 1));
    }

    // Reeds along the pond shoreline.
    final reeds = InstancedMesh(
      geometry: CylinderGeometry(
        bottomRadius: 0.05,
        topRadius: 0.015,
        height: 1.5,
        radialSegments: 4,
      ),
      material: PhysicallyBasedMaterial()
        ..baseColorFactor = vm.Vector4(0.62, 0.72, 0.40, 1)
        ..roughnessFactor = 1.0,
    );
    for (var i = 0; i < _reedCount; i++) {
      final a = random.nextDouble() * math.pi * 2;
      final rr = TerrainModel.pondRadius + 0.9 + random.nextDouble() * 1.8;
      final x = TerrainModel.pondCenter.x + math.cos(a) * rr;
      final z = TerrainModel.pondCenter.y + math.sin(a) * rr;
      final h = TerrainModel.height(x, z);
      if (h < TerrainModel.waterLevel - 0.2) continue;
      final s = 0.8 + random.nextDouble() * 0.5;
      final matrix = vm.Matrix4.identity()
        ..translateByVector3(vm.Vector3(x, h + s * 0.55, z))
        ..rotateY(random.nextDouble() * math.pi)
        ..rotateX(random.nextDouble() * 0.25)
        ..scaleByVector3(vm.Vector3(s, s, s));
      reeds.addInstance(matrix, color: vm.Vector4(0.7, 0.85, 0.4, 1));
    }

    // A couple of extra rocks resting in the shallows, for depth.
    world
      ..add(Node()..addComponent(InstancedMeshComponent(trunk)))
      ..add(Node()..addComponent(InstancedMeshComponent(canopy)))
      ..add(Node()..addComponent(InstancedMeshComponent(rocks)))
      ..add(Node()..addComponent(InstancedMeshComponent(bushes)))
      ..add(Node()..addComponent(InstancedMeshComponent(tufts)))
      ..add(Node()..addComponent(InstancedMeshComponent(reeds)));

    return world;
  }

  /// Area reserved for the farm (field, farmhouse, plaza): no trees or rocks.
  static bool _blocked(double x, double z) {
    // Farm plaza and field plots: keep a generous clear core.
    if (x > -13 && x < 13 && z > -10 && z < 16) return true;
    // Pond footprint minus shoreline fringe.
    final pd = vm.Vector2(
      x - TerrainModel.pondCenter.x,
      z - TerrainModel.pondCenter.y,
    ).length;
    if (pd < TerrainModel.pondRadius + 2.0) return true;
    // Paths.
    if (TerrainModel.distanceToPaths(x, z) < 2.6) return true;
    return false;
  }
}
