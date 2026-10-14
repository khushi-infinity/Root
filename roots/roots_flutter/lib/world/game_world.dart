import 'dart:math' as math;

import 'package:flutter_scene/scene.dart';
import 'package:vector_math/vector_math.dart' as vm;

import 'nature.dart';
import 'structures.dart';
import 'terrain.dart';

/// Assembles the ROOTS world: lighting/atmosphere, terrain, water, nature,
/// and the farm structures. Also manages crop state and growth.
class GameWorld {
  late final Scene scene;

  // Sky-driven sun for day/night support later.
  late final PhysicalSkySource skySource;

  static final _sunDirection = vm.Vector3(-0.42, 0.55, -0.35);

  // Crop management
  late final CropManager _cropManager;

  GameWorld();

  Future<void> loadInto(Scene scene) async {
    this.scene = scene;

    // --- Crop manager initialization ---
    _cropManager = CropManager();

    // --- Sky, sun, atmosphere -------------------------------------------
    skySource = PhysicalSkySource(
      sunDirection: _sunDirection.clone(),
      turbidity: 6.0,
      energy: 1.0,
      groundColor: vm.Vector3(0.20, 0.21, 0.16),
    );
    scene
      ..skybox = Skybox(skySource)
      ..skyEnvironment = SkyEnvironment(skySource, refresh: SkyEnvironmentRefresh.manual)
      ..sunLight = SunLight(
        skySource,
        castsShadow: true,
        shadowMapResolution: 1536,
        shadowSoftness: 0.12,
        shadowMaxDistance: 110.0,
      );

    // A coherent look: warm, grounded, premium-but-restrained.
    scene.environmentSettings = EnvironmentSettings(
      toneMapping: ToneMappingMode.aces,
      exposure: 1.0,
      bloomEnabled: true,
      bloomThreshold: 1.05,
      bloomIntensity: 0.16,
      bloomScatter: 0.65,
      ambientOcclusionEnabled: true,
      ambientOcclusionMethod: AmbientOcclusionMethod.groundTruth,
      ambientOcclusionIntensity: 1.0,
      ambientOcclusionHalfResolution: true,
      fogEnabled: true,
      fogMode: FogMode.exponential,
      fogColor: vm.Vector3(0.50, 0.60, 0.64),
      fogDensity: 0.011,
      vignetteEnabled: true,
      vignetteIntensity: 0.22,
    );

    // --- Terrain & water -------------------------------------------------
    final (terrain, water) = TerrainModel.build();
    scene..add(terrain)..add(water);

    // --- Nature ----------------------------------------------------------
    scene.add(Nature.build(rng: null));

    // --- Starter farm ----------------------------------------------------
    _addStarterStructures();

    // --- Crops -----------------------------------------------------------
    _cropManager.loadInto(scene);
  }

  /// Get the crop manager for external interaction.
  CropManager get cropManager => _cropManager;

  void _addStarterStructures() {
    // Well near the plaza.
    final well = FarmStructures.buildWell()
      ..position = vm.Vector3(-4.5, groundY(-4.5, 2.5), 2.5)
      ..rotation = vm.Quaternion.axisAngle(vm.Vector3(0, 1, 0), 0.6);
    scene.add(well);

    // Two starter field plots on the field path side.
    final plotA = FarmStructures.buildPlot()
      ..position = vm.Vector3(-0.5, groundY(-0.5, 10.0), 10.0);
    final plotB = FarmStructures.buildPlot()
      ..position = vm.Vector3(4.0, groundY(4.0, 10.0), 10.0)
      ..rotation = vm.Quaternion.axisAngle(vm.Vector3(0, 1, 0), 0.1);
    scene..add(plotA)..add(plotB);

    // A small fence line hinting at the farmhouse yard (east).
    final fenceXs = [7.0, 9.0, 11.0];
    for (var i = 0; i < fenceXs.length; i++) {
      scene.add(
        FarmStructures.buildFence()
          ..position = vm.Vector3(fenceXs[i], groundY(fenceXs[i], -6.5), -6.5),
      );
    }
    // And a couple along the north edge.
    scene.add(
      FarmStructures.buildFence()
        ..position = vm.Vector3(12.4, groundY(12.4, -5.6), -5.6)
        ..rotation = vm.Quaternion.axisAngle(vm.Vector3(0, 1, 0), 1.5708),
    );
    scene.add(
      FarmStructures.buildFence()
        ..position = vm.Vector3(12.4, groundY(12.4, -3.6), -3.6)
        ..rotation = vm.Quaternion.axisAngle(vm.Vector3(0, 1, 0), 1.5708),
    );
  }

  /// Ground height well above any vertex detail so props don't sink.
  static double groundY(double x, double z) =>
      TerrainModel.height(x, z) - 0.02;

  /// Marks [position] a valid spot for placement.
  static bool isValidPlacement(double x, double z) {
    if (x.abs() > 40 || z.abs() > 40) return false;
    // Not in the pond.
    final pd = vm.Vector2(
      x - TerrainModel.pondCenter.x,
      z - TerrainModel.pondCenter.y,
    ).length;
    if (pd < TerrainModel.pondRadius + 1.2) return false;
    // Not on a path.
    if (TerrainModel.distanceToPaths(x, z) < 1.2) return false;
    return true;
  }

  /// Updates the game world per frame (for crop growth animation).
  void update(double dt) {
    _cropManager.update(dt);
  }
}

/// Manages crop state and growth progression.
class CropManager {
  // Track planted crops: position -> growth stage
  final Map<vm.Vector3, int> _cropStages = {};
  final Map<vm.Vector3, DateTime> _lastWatered = {};

  /// Load the crop manager into the scene.
  void loadInto(Scene scene) {
    // Crop instances are managed per-frame, no static nodes needed initially
  }

  /// Plant wheat at the given world position.
  void plantWheat(vm.Vector3 position) {
    _cropStages[position] = 0; // Stage 0: planted
    _lastWatered[position] = DateTime.now();
    // In a full implementation, we'd persist this to the server
    // and broadcast it to other clients
  }

  /// Mark a crop at position as watered.
  void waterWheat(vm.Vector3 position) {
    _lastWatered[position] = DateTime.now();
    // Advance growth stage toward maturity
    _advanceGrowth(position);
  }

  /// Advance growth by one stage.
  void _advanceGrowth(vm.Vector3 position) {
    final currentStage = _cropStages[position] ?? 0;
    final newStage = currentStage + 1;
    _cropStages[position] = newStage;

    // Trigger visual update in the scene
    // The crop node's mesh will be rebuilt based on the new stage
  }

  /// Update per-frame (called from GameWorld.update).
  void update(double dt) {
    // Check for time-based growth progression
    final now = DateTime.now();
    _cropStages.forEach((position, stage) {
      final lastWatered = _lastWatered[position];
      if (lastWatered == null) return;

      // Accelerated growth: every 4-6 seconds per stage
      final secondsSinceWatered = now.difference(lastWatered).inMilliseconds / 1000.0;
      if (secondsSinceWatered >= 4.0) {
        // Advance stage
        final newStage = (stage + 1).clamp(0, 3);
        _cropStages[position] = newStage;

        // Schedule next stage
        _lastWatered[position] = DateTime.now().add(
          const Duration(milliseconds: 0), // Reset timing
        );
      }
    });
  }
}