import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Crop endpoints for planting, watering, and harvesting wheat.
class CropEndpoint extends Endpoint {
  /// Plants wheat in a field plot.
  Future<WorldObject> plantCrop(
    Session session, {
    required String worldId,
    required double positionX,
    required double positionY,
    required double z,
    required String ownerId,
  }) async {
    // Implementation will create a planted crop in the database
    final crop = WorldObject(
      id: 'wheat-${DateTime.now().millisecondsSinceEpoch}',
      worldId: worldId,
      ownerId: ownerId,
      type: 'wheat',
      positionX: positionX,
      positionY: positionY,
      z: z,
      rotationY: 0.0,
      scaleX: 1.0,
      scaleY: 1.0,
      scaleZ: 1.0,
      state: 'planted',
      cropStage: 0,
      misWatered: false,
      plantedAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Schedule growth progression
    // TODO: Implement Serverpod scheduling for crop growth

    return crop;
  }

  /// Waters a crop, marking it as watered and potentially advancing growth.
  Future<WorldObject> waterCrop(
    Session session, {
    required String worldId,
    required String cropId,
    required String ownerId,
  }) async {
    // Implementation will update the crop's watered status
    return WorldObject(
      id: cropId,
      worldId: worldId,
      ownerId: ownerId,
      type: 'wheat',
      positionX: 0,
      positionY: 0,
      z: 0,
      rotationY: 0,
      scaleX: 1.0,
      scaleY: 1.0,
      scaleZ: 1.0,
      state: 'watered',
      cropStage: 1,
      misWatered: true,
      plantedAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Harvests a mature wheat crop.
  Future<WorldObject> harvestCrop(
    Session session, {
    required String worldId,
    required String cropId,
    required String ownerId,
  }) async {
    // Implementation will remove the crop and reward resources
    return WorldObject(
      id: cropId,
      worldId: worldId,
      ownerId: ownerId,
      type: 'wheat',
      positionX: 0,
      positionY: 0,
      z: 0,
      rotationY: 0,
      scaleX: 1.0,
      scaleY: 1.0,
      scaleZ: 1.0,
      state: 'harvested',
      cropStage: 4,
      misWatered: false,
      plantedAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Updates the crop stage (used by server-side scheduling).
  Future<WorldObject> updateCropStage(
    Session session, {
    required String worldId,
    required String cropId,
    required int newStage,
    required String ownerId,
  }) async {
    return WorldObject(
      id: cropId,
      worldId: worldId,
      ownerId: ownerId,
      type: 'wheat',
      positionX: 0,
      positionY: 0,
      z: 0,
      rotationY: 0,
      scaleX: 1.0,
      scaleY: 1.0,
      scaleZ: 1.0,
      state: 'growing',
      cropStage: newStage,
      misWatered: false,
      plantedAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}