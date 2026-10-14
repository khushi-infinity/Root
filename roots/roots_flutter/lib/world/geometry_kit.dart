import 'dart:math' as math;

import 'package:flutter_scene/scene.dart';
import 'package:vector_math/vector_math.dart' as vm;

/// Authoring helpers on top of [GeometryBuilder] with explicit, correctly
/// wound faces and authored normals.
///
/// Use `GeometryBuilder(deduplicate: false)` for these helpers: shared
/// corners between two faces carry different normals, so deduplicating by
/// position would merge them away.
class GeometryKit {
  /// Adds an axis-aligned box centered at [center] with full extents [size].
  static void addBox(
    GeometryBuilder b,
    vm.Vector3 center,
    vm.Vector3 size, {
    vm.Vector4? color,
  }) {
    final hx = size.x / 2;
    final hy = size.y / 2;
    final hz = size.z / 2;
    final c = center;

    void face(
      vm.Vector3 v1,
      vm.Vector3 v2,
      vm.Vector3 v3,
      vm.Vector3 v4,
      vm.Vector3 normal,
    ) {
      b.normal(normal);
      if (color != null) b.color(color);
      final i1 = b.addVertex(v1);
      final i2 = b.addVertex(v2);
      final i3 = b.addVertex(v3);
      final i4 = b.addVertex(v4);
      b
        ..addTriangle(i1, i2, i3)
        ..addTriangle(i1, i3, i4);
    }

    // +X, -X, +Z, -Z, +Y, -Y faces (outward normals, CCW winding).
    face(
      vm.Vector3(c.x + hx, c.y - hy, c.z + hz),
      vm.Vector3(c.x + hx, c.y - hy, c.z - hz),
      vm.Vector3(c.x + hx, c.y + hy, c.z - hz),
      vm.Vector3(c.x + hx, c.y + hy, c.z + hz),
      vm.Vector3(1, 0, 0),
    );
    face(
      vm.Vector3(c.x - hx, c.y - hy, c.z - hz),
      vm.Vector3(c.x - hx, c.y - hy, c.z + hz),
      vm.Vector3(c.x - hx, c.y + hy, c.z + hz),
      vm.Vector3(c.x - hx, c.y + hy, c.z - hz),
      vm.Vector3(-1, 0, 0),
    );
    face(
      vm.Vector3(c.x - hx, c.y - hy, c.z + hz),
      vm.Vector3(c.x + hx, c.y - hy, c.z + hz),
      vm.Vector3(c.x + hx, c.y + hy, c.z + hz),
      vm.Vector3(c.x - hx, c.y + hy, c.z + hz),
      vm.Vector3(0, 0, 1),
    );
    face(
      vm.Vector3(c.x + hx, c.y - hy, c.z - hz),
      vm.Vector3(c.x - hx, c.y - hy, c.z - hz),
      vm.Vector3(c.x - hx, c.y + hy, c.z - hz),
      vm.Vector3(c.x + hx, c.y + hy, c.z - hz),
      vm.Vector3(0, 0, -1),
    );
    face(
      vm.Vector3(c.x - hx, c.y + hy, c.z + hz),
      vm.Vector3(c.x + hx, c.y + hy, c.z + hz),
      vm.Vector3(c.x + hx, c.y + hy, c.z - hz),
      vm.Vector3(c.x - hx, c.y + hy, c.z - hz),
      vm.Vector3(0, 1, 0),
    );
    face(
      vm.Vector3(c.x - hx, c.y - hy, c.z - hz),
      vm.Vector3(c.x + hx, c.y - hy, c.z - hz),
      vm.Vector3(c.x + hx, c.y - hy, c.z + hz),
      vm.Vector3(c.x - hx, c.y - hy, c.z + hz),
      vm.Vector3(0, -1, 0),
    );
  }

  /// Adds a two-sided vertical quad (a billboard blade) standing at [base]
  /// pointing up, sized [width] x [height], rotated [yaw] around +Y.
  static void addBlade(
    GeometryBuilder b,
    vm.Vector3 base,
    double width,
    double height,
    double yaw, {
    vm.Vector4? color,
  }) {
    final dir = vm.Vector3(math.cos(yaw), 0, math.sin(yaw));
    final side = vm.Vector3(-dir.z, 0, dir.x) * (width / 2);
    final a = base - side;
    final d = base + side;
    final c = d + vm.Vector3(0, height, 0);
    final e = a + vm.Vector3(0, height, 0);

    b.normal(dir);
    if (color != null) b.color(color);
    b
      ..addTriangle(
        b.addVertex(a),
        b.addVertex(d),
        b.addVertex(c),
      )
      ..addTriangle(b.vertexCount - 3, b.vertexCount - 2, b.addVertex(e));
  }
}
