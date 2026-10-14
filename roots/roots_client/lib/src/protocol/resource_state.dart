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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class ResourceState
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ResourceState._({
    required this.wood,
    required this.stone,
    required this.seeds,
    required this.wheat,
    required this.coins,
  });

  factory ResourceState({
    required int wood,
    required int stone,
    required int seeds,
    required int wheat,
    required int coins,
  }) = _ResourceStateImpl;

  factory ResourceState.fromJson(Map<String, dynamic> jsonSerialization) {
    return ResourceState(
      wood: jsonSerialization['wood'] as int,
      stone: jsonSerialization['stone'] as int,
      seeds: jsonSerialization['seeds'] as int,
      wheat: jsonSerialization['wheat'] as int,
      coins: jsonSerialization['coins'] as int,
    );
  }

  /// Amount of wood the player has.
  int wood;

  /// Amount of stone the player has.
  int stone;

  /// Amount of seeds the player has.
  int seeds;

  /// Amount of wheat the player has.
  int wheat;

  /// Amount of coins the player has.
  int coins;

  /// Returns a shallow copy of this [ResourceState]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ResourceState copyWith({
    int? wood,
    int? stone,
    int? seeds,
    int? wheat,
    int? coins,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ResourceState',
      'wood': wood,
      'stone': stone,
      'seeds': seeds,
      'wheat': wheat,
      'coins': coins,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ResourceState',
      'wood': wood,
      'stone': stone,
      'seeds': seeds,
      'wheat': wheat,
      'coins': coins,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _ResourceStateImpl extends ResourceState {
  _ResourceStateImpl({
    required int wood,
    required int stone,
    required int seeds,
    required int wheat,
    required int coins,
  }) : super._(
         wood: wood,
         stone: stone,
         seeds: seeds,
         wheat: wheat,
         coins: coins,
       );

  /// Returns a shallow copy of this [ResourceState]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ResourceState copyWith({
    int? wood,
    int? stone,
    int? seeds,
    int? wheat,
    int? coins,
  }) {
    return ResourceState(
      wood: wood ?? this.wood,
      stone: stone ?? this.stone,
      seeds: seeds ?? this.seeds,
      wheat: wheat ?? this.wheat,
      coins: coins ?? this.coins,
    );
  }
}
