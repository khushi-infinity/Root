import 'package:flutter_scene/scene.dart';
import 'package:vector_math/vector_math.dart' as vm;

import 'geometry_kit.dart';

/// Material palette shared by all builders so everything belongs to one
/// visual world.
class FarmMaterials {
  static PhysicallyBasedMaterial soil({double shade = 1.0}) =>
      PhysicallyBasedMaterial()
        ..baseColorFactor =
            vm.Vector4(0.26 * shade, 0.18 * shade, 0.12 * shade, 1)
        ..roughnessFactor = 0.95;

  static PhysicallyBasedMaterial wood({double shade = 1.0}) =>
      PhysicallyBasedMaterial()
        ..baseColorFactor =
            vm.Vector4(0.52 * shade, 0.36 * shade, 0.22 * shade, 1)
        ..roughnessFactor = 0.75;

  static PhysicallyBasedMaterial darkWood() => PhysicallyBasedMaterial()
    ..baseColorFactor = vm.Vector4(0.32, 0.22, 0.13, 1)
    ..roughnessFactor = 0.8;

  static PhysicallyBasedMaterial stone({double shade = 1.0}) =>
      PhysicallyBasedMaterial()
        ..baseColorFactor =
            vm.Vector4(0.50 * shade, 0.49 * shade, 0.46 * shade, 1)
        ..roughnessFactor = 0.9;

  static PhysicallyBasedMaterial roof() => PhysicallyBasedMaterial()
    ..baseColorFactor = vm.Vector4(0.48, 0.26, 0.18, 1)
    ..roughnessFactor = 0.85;

  /// Windows: near-dark glass that we light up at night via emissive.
  static PhysicallyBasedMaterial windowGlow() => PhysicallyBasedMaterial()
    ..baseColorFactor = vm.Vector4(0.10, 0.12, 0.10, 1)
    ..roughnessFactor = 0.35
    ..metallicFactor = 0.1;

  static PhysicallyBasedMaterial metal() => PhysicallyBasedMaterial()
    ..baseColorFactor = vm.Vector4(0.55, 0.52, 0.50, 1)
    ..roughnessFactor = 0.4
    ..metallicFactor = 0.9;

  static PhysicallyBasedMaterial ghostValid() => PhysicallyBasedMaterial()
    ..baseColorFactor = vm.Vector4(0.55, 0.95, 0.45, 0.45)
    ..roughnessFactor = 0.9;

  static PhysicallyBasedMaterial ghostInvalid() => PhysicallyBasedMaterial()
    ..baseColorFactor = vm.Vector4(0.95, 0.30, 0.25, 0.45)
    ..roughnessFactor = 0.9;
}

/// Builders for farm plots, farmhouse, well, fences and crops.
///
/// Every builder returns a [Node] whose origin sits at ground level so
/// placement code can translate the node to a terrain point.
class FarmStructures {
  /// Field (plot) placeable by the player: a tilled soil bed with furrows.
  static Node buildPlot() {
    final node = Node(name: 'fieldPlot');

    node.add(
      Node(
        mesh: Mesh(
          CuboidGeometry(vm.Vector3(3.8, 0.24, 3.0)),
          FarmMaterials.soil(),
        ),
      )..position = vm.Vector3(0, 0.10, 0),
    );

    node.add(
      Node(
        mesh: Mesh(_furrowGeometry(), FarmMaterials.soil(shade: 0.68)),
      ),
    );

    return node;
  }

  static MeshGeometry _furrowGeometry() {
    final b = GeometryBuilder();
    for (var i = 0; i < 4; i++) {
      GeometryKit.addBox(
        b,
        vm.Vector3(0, 0.21, -1.05 + i * 0.7),
        vm.Vector3(3.55, 0.09, 0.24),
      );
    }
    return b.build();
  }

  /// Wheat crop geometry per growth stage.
  static MeshGeometry cropGeometry(int stage) {
    final b = GeometryBuilder();

    switch (stage) {
      case 0: // Freshly planted: soil mound.
        GeometryKit.addBox(
          b,
          vm.Vector3(0, 0.10, 0),
          vm.Vector3(0.55, 0.20, 0.55),
        );
        break;
      case 1: // Sprout: small blades around a center.
        for (var i = 0; i < 5; i++) {
          final a = i / 5 * 3.14159 * 2;
          GeometryKit.addBlade(
            b,
            vm.Vector3(
              0.14 * (i.isEven ? 0.6 : -0.6) + (i / 2 - 1) * 0.1,
              0.06,
              (i - 2) * 0.12,
            ),
            0.09,
            0.42,
            a,
          );
        }
        break;
      case 2: // Young wheat: taller cross-blades.
        for (var i = 0; i < 7; i++) {
          final a = i / 7 * 3.14159 * 2;
          GeometryKit.addBlade(
            b,
            vm.Vector3((i / 2 - 1.5) * 0.14, 0.04, (i - 3) * 0.09),
            0.10,
            0.95,
            a,
          );
        }
        break;
      case 3: // Mature wheat: golden stalks with heads.
        for (var i = 0; i < 9; i++) {
          final a = i / 9 * 3.14159 * 2;
          final x = (i / 2 - 2) * 0.16;
          final z = (i - 4) * 0.12;
          GeometryKit.addBlade(b, vm.Vector3(x, 0.03, z), 0.10, 1.25, a);
          // Head: tiny golden box near the stem's top.
          GeometryKit.addBox(
            b,
            vm.Vector3(x, 1.22, z),
            vm.Vector3(0.10, 0.30, 0.10),
          );
        }
        break;
    }
    return b.build();
  }

  static PhysicallyBasedMaterial cropMaterial(int stage) {
    if (stage >= 3) {
      return PhysicallyBasedMaterial()
        ..baseColorFactor = vm.Vector4(0.95, 0.80, 0.34, 1)
        ..roughnessFactor = 0.9
        // Golden blades need to be visible from both sides.
        ..doubleSided = true;
    }
    if (stage == 0) return FarmMaterials.soil(shade: 1.15);
    if (stage == 1) {
      return PhysicallyBasedMaterial()
        ..baseColorFactor = vm.Vector4(0.62, 0.95, 0.38, 1)
        ..roughnessFactor = 0.9
        ..doubleSided = true;
    }
    return PhysicallyBasedMaterial()
      ..baseColorFactor = vm.Vector4(0.56, 0.85, 0.34, 1)
      ..roughnessFactor = 0.9
      ..doubleSided = true;
  }

  /// Farmhouse — the centerpiece of the scene.
  static Node buildFarmhouse() {
    final node = Node(name: 'farmhouse');

    Node part(MeshGeometry geometry, vm.Vector3 position, Material material) =>
        Node(mesh: Mesh(geometry, material))..position = position;

    // Stone foundation.
    node.add(
      part(
        CuboidGeometry(vm.Vector3(5.6, 0.55, 4.6)),
        vm.Vector3(0, 0.26, 0),
        FarmMaterials.stone(shade: 0.85),
      ),
    );

    // Timber walls.
    node.add(
      part(
        CuboidGeometry(vm.Vector3(5.0, 2.5, 4.0)),
        vm.Vector3(0, 1.75, 0),
        FarmMaterials.wood(),
      ),
    );

    // Timber frame corner posts.
    final posts = [
      vm.Vector3(-2.4, 1.9, -1.9),
      vm.Vector3(2.4, 1.9, -1.9),
      vm.Vector3(-2.4, 1.9, 1.9),
      vm.Vector3(2.4, 1.9, 1.9),
    ];
    for (final p in posts) {
      node.add(
        part(
          CuboidGeometry(vm.Vector3(0.3, 2.7, 0.3)),
          p,
          FarmMaterials.darkWood(),
        ),
      );
    }

    // Gabled roof: two wedges with ridge along X at z = 0, overhang.
    // WedgeGeometry rises toward +Z, so the south half is placed as-is
    // centered at z = -1.0 and the north half is rotated 180°.
    node.add(
      part(
        WedgeGeometry(vm.Vector3(5.8, 1.6, 2.1)),
        vm.Vector3(0, 2.95, -1.05),
        FarmMaterials.roof(),
      ),
    );
    final north = part(
      WedgeGeometry(vm.Vector3(5.8, 1.6, 2.1)),
      vm.Vector3(0, 2.95, 1.05),
      FarmMaterials.roof(),
    );
    north.rotation = vm.Quaternion.axisAngle(vm.Vector3(0, 1, 0), 3.14159);
    node.add(north);

    // Ridge beam.
    node.add(
      part(
        CuboidGeometry(vm.Vector3(5.9, 0.14, 0.2)),
        vm.Vector3(0, 4.55, 0),
        FarmMaterials.darkWood(),
      ),
    );

    // Door on the east (+X) face.
    node.add(
      part(
        CuboidGeometry(vm.Vector3(0.1, 1.85, 0.95)),
        vm.Vector3(2.55, 1.0, 0),
        FarmMaterials.darkWood(),
      ),
    );

    // Windows.
    final windowPositions = [
      vm.Vector3(2.55, 1.9, -1.2),
      vm.Vector3(2.55, 1.9, 1.2),
      vm.Vector3(-2.55, 1.9, 1.2),
      vm.Vector3(-2.55, 1.9, -1.2),
      vm.Vector3(1.3, 1.9, 2.05),
      vm.Vector3(-1.3, 1.9, 2.05),
    ];
    for (final p in windowPositions) {
      node.add(
        part(
          CuboidGeometry(vm.Vector3(0.09, 0.85, 0.85)),
          p,
          FarmMaterials.windowGlow(),
        ),
      );
    }

    // Chimney.
    node.add(
      part(
        CuboidGeometry(vm.Vector3(0.65, 1.8, 0.65)),
        vm.Vector3(-1.4, 4.15, -0.9),
        FarmMaterials.stone(),
      ),
    );

    // Small porch slab in front of the door.
    node.add(
      part(
        CuboidGeometry(vm.Vector3(1.6, 0.2, 2.0)),
        vm.Vector3(2.95, 0.35, 0),
        FarmMaterials.stone(shade: 1.05),
      ),
    );

    return node;
  }

  /// Well.
  static Node buildWell() {
    final node = Node(name: 'well');

    Node part(MeshGeometry geometry, vm.Vector3 position, Material material,
            {vm.Quaternion? rotation}) =>
        Node(mesh: Mesh(geometry, material))
          ..position = position
          ..rotation = (rotation ?? vm.Quaternion.identity());

    node.add(
      part(
        CylinderGeometry(
          bottomRadius: 0.95,
          topRadius: 0.85,
          height: 0.9,
          radialSegments: 16,
        ),
        vm.Vector3(0, 0.45, 0),
        FarmMaterials.stone(),
      ),
    );
    // Dark water hole.
    node.add(
      part(
        DiscGeometry(radius: 0.62, segments: 16),
        vm.Vector3(-0, 0.92, -0.0),
        PhysicallyBasedMaterial()
          ..baseColorFactor = vm.Vector4(0.05, 0.10, 0.12, 1)
          ..roughnessFactor = 0.1,
      ),
    );
    // Posts.
    node.add(
      part(
        CuboidGeometry(vm.Vector3(0.15, 1.5, 0.15)),
        vm.Vector3(0.75, 1.35, 0),
        FarmMaterials.darkWood(),
      ),
    );
    node.add(
      part(
        CuboidGeometry(vm.Vector3(0.15, 1.5, 0.15)),
        vm.Vector3(-0.75, 1.35, 0),
        FarmMaterials.darkWood(),
      ),
    );
    // Roof, two wedges meeting at the ridge along X.
    node.add(
      part(
        WedgeGeometry(vm.Vector3(2.4, 0.6, 0.8)),
        vm.Vector3(-0.6, 2.35, -0.4),
        FarmMaterials.roof(),
      ),
    );
    node.add(
      part(
        WedgeGeometry(vm.Vector3(2.4, 0.6, 0.8)),
        vm.Vector3(0.6, 2.35, 0.4),
        FarmMaterials.roof(),
        rotation: vm.Quaternion.axisAngle(vm.Vector3(0, 1, 0), 3.14159),
      ),
    );
    // Cross beam.
    node.add(
      part(
        CylinderGeometry(
          bottomRadius: 0.05,
          topRadius: 0.05,
          height: 1.2,
          radialSegments: 6,
        ),
        vm.Vector3(0, 2.1, 0),
        FarmMaterials.darkWood(),
        rotation: vm.Quaternion.axisAngle(vm.Vector3(0, 0, 1), 1.5708),
      ),
    );
    // Bucket.
    node.add(
      part(
        CylinderGeometry(
          bottomRadius: 0.16,
          topRadius: 0.2,
          height: 0.3,
          radialSegments: 8,
        ),
        vm.Vector3(0, 1.6, 0),
        FarmMaterials.wood(shade: 0.8),
      ),
    );
    return node;
  }

  /// One fence segment running along X from (-1, 0, 0) to (+1, 0, 0).
  static Node buildFence() {
    final node = Node(name: 'fence');
    for (final dx in [-0.95, 0.95]) {
      node.add(
        Node(
          mesh: Mesh(
            CylinderGeometry(
              bottomRadius: 0.07,
              topRadius: 0.055,
              height: 1.05,
              radialSegments: 6,
            ),
            FarmMaterials.darkWood(),
          ),
        )..position = vm.Vector3(dx, 0.5, 0),
      );
    }
    for (final y in [0.82, 0.48]) {
      node.add(
        Node(
          mesh: Mesh(
            CuboidGeometry(vm.Vector3(2.0, 0.09, 0.07)),
            FarmMaterials.wood(shade: 0.9),
          ),
        )..position = vm.Vector3(0, y, 0),
      );
    }
    return node;
  }

  /// A short dirt path tile (player placeable).
  static Node buildPathTile() {
    return Node(
      mesh: Mesh(
        CuboidGeometry(vm.Vector3(2.6, 0.14, 2.2)),
        PhysicallyBasedMaterial()
          ..baseColorFactor = vm.Vector4(0.36, 0.27, 0.19, 1)
          ..roughnessFactor = 1.0,
      ),
      name: 'pathTile',
    )..position = vm.Vector3(0, 0.07, 0);
  }
}
