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

abstract class WorldEvent
    implements _is.SerializableModel, _is.ProtocolSerialization {
  WorldEvent._({
    required this.eventKind,
    required this.worldId,
    required this.data,
    required this.createdAt,
  });

  factory WorldEvent({
    required String eventKind,
    required String worldId,
    required String data,
    required DateTime createdAt,
  }) = _WorldEventImpl;

  factory WorldEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return WorldEvent(
      eventKind: jsonSerialization['eventKind'] as String,
      worldId: jsonSerialization['worldId'] as String,
      data: jsonSerialization['data'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The type of event.
  String eventKind;

  /// The world this event belongs to.
  String worldId;

  /// Additional event data.
  String data;

  /// When the event was created.
  DateTime createdAt;

  /// Returns a shallow copy of this [WorldEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  WorldEvent copyWith({
    String? eventKind,
    String? worldId,
    String? data,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorldEvent',
      'eventKind': eventKind,
      'worldId': worldId,
      'data': data,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WorldEvent',
      'eventKind': eventKind,
      'worldId': worldId,
      'data': data,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _WorldEventImpl extends WorldEvent {
  _WorldEventImpl({
    required String eventKind,
    required String worldId,
    required String data,
    required DateTime createdAt,
  }) : super._(
         eventKind: eventKind,
         worldId: worldId,
         data: data,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [WorldEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  WorldEvent copyWith({
    String? eventKind,
    String? worldId,
    String? data,
    DateTime? createdAt,
  }) {
    return WorldEvent(
      eventKind: eventKind ?? this.eventKind,
      worldId: worldId ?? this.worldId,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
