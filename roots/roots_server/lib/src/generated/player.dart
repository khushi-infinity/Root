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

abstract class Player
    implements _is.SerializableModel, _is.ProtocolSerialization {
  Player._({
    required this.id,
    required this.worldId,
    required this.displayName,
    required this.x,
    required this.y,
    required this.z,
    required this.lastSeenAt,
  });

  factory Player({
    required String id,
    required String worldId,
    required String displayName,
    required double x,
    required double y,
    required double z,
    required DateTime lastSeenAt,
  }) = _PlayerImpl;

  factory Player.fromJson(Map<String, dynamic> jsonSerialization) {
    return Player(
      id: jsonSerialization['id'] as String,
      worldId: jsonSerialization['worldId'] as String,
      displayName: jsonSerialization['displayName'] as String,
      x: (jsonSerialization['x'] as num).toDouble(),
      y: (jsonSerialization['y'] as num).toDouble(),
      z: (jsonSerialization['z'] as num).toDouble(),
      lastSeenAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastSeenAt'],
      ),
    );
  }

  /// Unique identifier for the player.
  String id;

  /// The world this player belongs to.
  String worldId;

  /// Display name of the player.
  String displayName;

  /// X position in the world.
  double x;

  /// Y position in the world.
  double y;

  /// Z position in the world.
  double z;

  /// When the player was last seen.
  DateTime lastSeenAt;

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Player copyWith({
    String? id,
    String? worldId,
    String? displayName,
    double? x,
    double? y,
    double? z,
    DateTime? lastSeenAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Player',
      'id': id,
      'worldId': worldId,
      'displayName': displayName,
      'x': x,
      'y': y,
      'z': z,
      'lastSeenAt': lastSeenAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Player',
      'id': id,
      'worldId': worldId,
      'displayName': displayName,
      'x': x,
      'y': y,
      'z': z,
      'lastSeenAt': lastSeenAt.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _PlayerImpl extends Player {
  _PlayerImpl({
    required String id,
    required String worldId,
    required String displayName,
    required double x,
    required double y,
    required double z,
    required DateTime lastSeenAt,
  }) : super._(
         id: id,
         worldId: worldId,
         displayName: displayName,
         x: x,
         y: y,
         z: z,
         lastSeenAt: lastSeenAt,
       );

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Player copyWith({
    String? id,
    String? worldId,
    String? displayName,
    double? x,
    double? y,
    double? z,
    DateTime? lastSeenAt,
  }) {
    return Player(
      id: id ?? this.id,
      worldId: worldId ?? this.worldId,
      displayName: displayName ?? this.displayName,
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
    );
  }
}
