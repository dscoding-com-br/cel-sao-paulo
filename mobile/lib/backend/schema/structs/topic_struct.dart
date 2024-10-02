// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicStruct extends BaseStruct {
  TopicStruct({
    String? name,
    int? id,
    String? description,
    int? adminId,
  })  : _name = name,
        _id = id,
        _description = description,
        _adminId = adminId;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "adminId" field.
  int? _adminId;
  int get adminId => _adminId ?? 0;
  set adminId(int? val) => _adminId = val;

  void incrementAdminId(int amount) => adminId = adminId + amount;

  bool hasAdminId() => _adminId != null;

  static TopicStruct fromMap(Map<String, dynamic> data) => TopicStruct(
        name: data['name'] as String?,
        id: castToType<int>(data['id']),
        description: data['description'] as String?,
        adminId: castToType<int>(data['adminId']),
      );

  static TopicStruct? maybeFromMap(dynamic data) =>
      data is Map ? TopicStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'description': _description,
        'adminId': _adminId,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'adminId': serializeParam(
          _adminId,
          ParamType.int,
        ),
      }.withoutNulls;

  static TopicStruct fromSerializableMap(Map<String, dynamic> data) =>
      TopicStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        adminId: deserializeParam(
          data['adminId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TopicStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TopicStruct &&
        name == other.name &&
        id == other.id &&
        description == other.description &&
        adminId == other.adminId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, id, description, adminId]);
}

TopicStruct createTopicStruct({
  String? name,
  int? id,
  String? description,
  int? adminId,
}) =>
    TopicStruct(
      name: name,
      id: id,
      description: description,
      adminId: adminId,
    );
