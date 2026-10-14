/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'player.dart' as _imuqra0a;
import 'resource_state.dart' as _ibu6w1bz;
import 'test_minimal.dart' as _isuqr7vx;
import 'world.dart' as _iiukqn9r;
import 'world_event.dart' as _ig3hr6nw;
import 'world_object.dart' as _iqvgq0fl;
export 'greetings/greeting.dart';
export 'player.dart';
export 'resource_state.dart';
export 'test_minimal.dart';
export 'world.dart';
export 'world_event.dart';
export 'world_object.dart';

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _is.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _imuqra0a.Player) {
      return _imuqra0a.Player.fromJson(data) as T;
    }
    if (t == _ibu6w1bz.ResourceState) {
      return _ibu6w1bz.ResourceState.fromJson(data) as T;
    }
    if (t == _isuqr7vx.TestMinimal) {
      return _isuqr7vx.TestMinimal.fromJson(data) as T;
    }
    if (t == _iiukqn9r.World) {
      return _iiukqn9r.World.fromJson(data) as T;
    }
    if (t == _ig3hr6nw.WorldEvent) {
      return _ig3hr6nw.WorldEvent.fromJson(data) as T;
    }
    if (t == _iqvgq0fl.WorldObject) {
      return _iqvgq0fl.WorldObject.fromJson(data) as T;
    }
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_imuqra0a.Player?>()) {
      return (data != null ? _imuqra0a.Player.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ibu6w1bz.ResourceState?>()) {
      return (data != null ? _ibu6w1bz.ResourceState.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_isuqr7vx.TestMinimal?>()) {
      return (data != null ? _isuqr7vx.TestMinimal.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iiukqn9r.World?>()) {
      return (data != null ? _iiukqn9r.World.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ig3hr6nw.WorldEvent?>()) {
      return (data != null ? _ig3hr6nw.WorldEvent.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iqvgq0fl.WorldObject?>()) {
      return (data != null ? _iqvgq0fl.WorldObject.fromJson(data) : null) as T;
    }
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _izw8z7ou.Greeting => 'Greeting',
      _imuqra0a.Player => 'Player',
      _ibu6w1bz.ResourceState => 'ResourceState',
      _isuqr7vx.TestMinimal => 'TestMinimal',
      _iiukqn9r.World => 'World',
      _ig3hr6nw.WorldEvent => 'WorldEvent',
      _iqvgq0fl.WorldObject => 'WorldObject',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('roots.', '');
    }

    switch (data) {
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _imuqra0a.Player():
        return 'Player';
      case _ibu6w1bz.ResourceState():
        return 'ResourceState';
      case _isuqr7vx.TestMinimal():
        return 'TestMinimal';
      case _iiukqn9r.World():
        return 'World';
      case _ig3hr6nw.WorldEvent():
        return 'WorldEvent';
      case _iqvgq0fl.WorldObject():
        return 'WorldObject';
    }
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Player') {
      return deserialize<_imuqra0a.Player>(data['data']);
    }
    if (dataClassName == 'ResourceState') {
      return deserialize<_ibu6w1bz.ResourceState>(data['data']);
    }
    if (dataClassName == 'TestMinimal') {
      return deserialize<_isuqr7vx.TestMinimal>(data['data']);
    }
    if (dataClassName == 'World') {
      return deserialize<_iiukqn9r.World>(data['data']);
    }
    if (dataClassName == 'WorldEvent') {
      return deserialize<_ig3hr6nw.WorldEvent>(data['data']);
    }
    if (dataClassName == 'WorldObject') {
      return deserialize<_iqvgq0fl.WorldObject>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('roots', this);
    _iacs.Protocol().registerHostProtocol('roots', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'roots';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
