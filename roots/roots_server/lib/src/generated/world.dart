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

abstract class World
    implements _is.SerializableModel, _is.ProtocolSerialization {
  World._({
    required this.id,
    required this.name,
    required this.life,
    required this.dayTime,
    required this.weather,
    required this.createdAt,
    required this.updatedAt,
  });

  factory World({
    required String id,
    required String name,
    required int life,
    required String dayTime,
    required String weather,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WorldImpl;

  factory World.fromJson(Map<String, dynamic> jsonSerialization) {
    return World(
      id: jsonSerialization['id'] as String,
      name: jsonSerialization['name'] as String,
      life: jsonSerialization['life'] as int,
      dayTime: jsonSerialization['dayTime'] as String,
      weather: jsonSerialization['weather'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// Unique identifier for the world.
  String id;

  /// Name of the world.
  String name;

  /// Life score representing world vitality.
  int life;

  /// Current day time.
  String dayTime;

  /// Current weather state.
  String weather;

  /// When the world was created.
  DateTime createdAt;

  /// When the world was last updated.
  DateTime updatedAt;

  /// Returns a shallow copy of this [World]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  World copyWith({
    String? id,
    String? name,
    int? life,
    String? dayTime,
    String? weather,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'World',
      'id': id,
      'name': name,
      'life': life,
      'dayTime': dayTime,
      'weather': weather,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'World',
      'id': id,
      'name': name,
      'life': life,
      'dayTime': dayTime,
      'weather': weather,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _WorldImpl extends World {
  _WorldImpl({
    required String id,
    required String name,
    required int life,
    required String dayTime,
    required String weather,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         life: life,
         dayTime: dayTime,
         weather: weather,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [World]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  World copyWith({
    String? id,
    String? name,
    int? life,
    String? dayTime,
    String? weather,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return World(
      id: id ?? this.id,
      name: name ?? this.name,
      life: life ?? this.life,
      dayTime: dayTime ?? this.dayTime,
      weather: weather ?? this.weather,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
