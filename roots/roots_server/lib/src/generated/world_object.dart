/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _is;

abstract class WorldObject
    implements _is.SerializableModel, _is.ProtocolSerialization {
  WorldObject._({
    required this.id,
    required this.worldId,
    required this.ownerId,
    required this.type,
    required this.positionX,
    required this.positionY,
    required this.z,
    required this.rotationY,
    required this.scaleX,
    required this.scaleY,
    required this.scaleZ,
    required this.state,
    required this.cropStage,
    required this.misWatered,
    required this.plantedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorldObject({
    required String id,
    required String worldId,
    required String ownerId,
    required String type,
    required double positionX,
    required double positionY,
    required double z,
    required double rotationY,
    required double scaleX,
    required double scaleY,
    required double scaleZ,
    required String state,
    required int cropStage,
    required bool misWatered,
    required DateTime plantedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WorldObjectImpl;

  factory WorldObject.fromJson(Map<String, dynamic> jsonSerialization) {
    return WorldObject(
      id: jsonSerialization['id'] as String,
      worldId: jsonSerialization['worldId'] as String,
      ownerId: jsonSerialization['ownerId'] as String,
      type: jsonSerialization['type'] as String,
      positionX: (jsonSerialization['positionX'] as num).toDouble(),
      positionY: (jsonSerialization['positionY'] as num).toDouble(),
      z: (jsonSerialization['z'] as num).toDouble(),
      rotationY: (jsonSerialization['rotationY'] as num).toDouble(),
      scaleX: (jsonSerialization['scaleX'] as num).toDouble(),
      scaleY: (jsonSerialization['scaleY'] as num).toDouble(),
      scaleZ: (jsonSerialization['scaleZ'] as num).toDouble(),
      state: jsonSerialization['state'] as String,
      cropStage: jsonSerialization['cropStage'] as int,
      misWatered: _is.BoolJsonExtension.fromJson(
        jsonSerialization['misWatered'],
      ),
      plantedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['plantedAt'],
      ),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// Unique identifier for the world object.
  String id;

  /// The world this object belongs to.
  String worldId;

  /// The owner of this object, if any.
  String ownerId;

  /// Type of object (farmhouse, field, fence, path, well, crop, etc.).
  String type;

  /// X position in the world.
  double positionX;

  /// Y position in the world.
  double positionY;

  /// Z position in the world.
  double z;

  /// Rotation around Y axis.
  double rotationY;

  /// X scale.
  double scaleX;

  /// Y scale.
  double scaleY;

  /// Z scale.
  double scaleZ;

  /// Additional state for the object (e.g., crop stage).
  String state;

  /// Crop growth stage (for crops).
  int cropStage;

  /// Whether the crop has been watered this cycle.
  bool misWatered;

  /// When the crop was planted.
  DateTime plantedAt;

  /// When the object was created.
  DateTime createdAt;

  /// When the object was last updated.
  DateTime updatedAt;

  /// Returns a shallow copy of this [WorldObject]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  WorldObject copyWith({
    String? id,
    String? worldId,
    String? ownerId,
    String? type,
    double? positionX,
    double? positionY,
    double? z,
    double? rotationY,
    double? scaleX,
    double? scaleY,
    double? scaleZ,
    String? state,
    int? cropStage,
    bool? misWatered,
    DateTime? plantedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorldObject',
      'id': id,
      'worldId': worldId,
      'ownerId': ownerId,
      'type': type,
      'positionX': positionX,
      'positionY': positionY,
      'z': z,
      'rotationY': rotationY,
      'scaleX': scaleX,
      'scaleY': scaleY,
      'scaleZ': scaleZ,
      'state': state,
      'cropStage': cropStage,
      'misWatered': misWatered,
      'plantedAt': plantedAt.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WorldObject',
      'id': id,
      'worldId': worldId,
      'ownerId': ownerId,
      'type': type,
      'positionX': positionX,
      'positionY': positionY,
      'z': z,
      'rotationY': rotationY,
      'scaleX': scaleX,
      'scaleY': scaleY,
      'scaleZ': scaleZ,
      'state': state,
      'cropStage': cropStage,
      'misWatered': misWatered,
      'plantedAt': plantedAt.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _WorldObjectImpl extends WorldObject {
  _WorldObjectImpl({
    required String id,
    required String worldId,
    required String ownerId,
    required String type,
    required double positionX,
    required double positionY,
    required double z,
    required double rotationY,
    required double scaleX,
    required double scaleY,
    required double scaleZ,
    required String state,
    required int cropStage,
    required bool misWatered,
    required DateTime plantedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         worldId: worldId,
         ownerId: ownerId,
         type: type,
         positionX: positionX,
         positionY: positionY,
         z: z,
         rotationY: rotationY,
         scaleX: scaleX,
         scaleY: scaleY,
         scaleZ: scaleZ,
         state: state,
         cropStage: cropStage,
         misWatered: misWatered,
         plantedAt: plantedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [WorldObject]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  WorldObject copyWith({
    String? id,
    String? worldId,
    String? ownerId,
    String? type,
    double? positionX,
    double? positionY,
    double? z,
    double? rotationY,
    double? scaleX,
    double? scaleY,
    double? scaleZ,
    String? state,
    int? cropStage,
    bool? misWatered,
    DateTime? plantedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WorldObject(
      id: id ?? this.id,
      worldId: worldId ?? this.worldId,
      ownerId: ownerId ?? this.ownerId,
      type: type ?? this.type,
      positionX: positionX ?? this.positionX,
      positionY: positionY ?? this.positionY,
      z: z ?? this.z,
      rotationY: rotationY ?? this.rotationY,
      scaleX: scaleX ?? this.scaleX,
      scaleY: scaleY ?? this.scaleY,
      scaleZ: scaleZ ?? this.scaleZ,
      state: state ?? this.state,
      cropStage: cropStage ?? this.cropStage,
      misWatered: misWatered ?? this.misWatered,
      plantedAt: plantedAt ?? this.plantedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
