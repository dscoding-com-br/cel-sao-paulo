// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionStruct extends BaseStruct {
  SubscriptionStruct({
    String? name,
    int? id,
    MessageStruct? message,
    String? description,
    bool? isAdmin,
  })  : _name = name,
        _id = id,
        _message = message,
        _description = description,
        _isAdmin = isAdmin;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "message" field.
  MessageStruct? _message;
  MessageStruct get message => _message ?? MessageStruct();
  set message(MessageStruct? val) => _message = val;

  void updateMessage(Function(MessageStruct) updateFn) {
    updateFn(_message ??= MessageStruct());
  }

  bool hasMessage() => _message != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  set isAdmin(bool? val) => _isAdmin = val;

  bool hasIsAdmin() => _isAdmin != null;

  static SubscriptionStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionStruct(
        name: data['name'] as String?,
        id: castToType<int>(data['id']),
        message: MessageStruct.maybeFromMap(data['message']),
        description: data['description'] as String?,
        isAdmin: data['isAdmin'] as bool?,
      );

  static SubscriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'message': _message?.toMap(),
        'description': _description,
        'isAdmin': _isAdmin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'message': serializeParam(
          _message,
          ParamType.DataStruct,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'isAdmin': serializeParam(
          _isAdmin,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SubscriptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubscriptionStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        message: deserializeStructParam(
          data['message'],
          ParamType.DataStruct,
          false,
          structBuilder: MessageStruct.fromSerializableMap,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        isAdmin: deserializeParam(
          data['isAdmin'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SubscriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionStruct &&
        name == other.name &&
        id == other.id &&
        message == other.message &&
        description == other.description &&
        isAdmin == other.isAdmin;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, id, message, description, isAdmin]);
}

SubscriptionStruct createSubscriptionStruct({
  String? name,
  int? id,
  MessageStruct? message,
  String? description,
  bool? isAdmin,
}) =>
    SubscriptionStruct(
      name: name,
      id: id,
      message: message ?? MessageStruct(),
      description: description,
      isAdmin: isAdmin,
    );
