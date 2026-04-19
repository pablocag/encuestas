// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuariosOnLineStruct extends FFFirebaseStruct {
  UsuariosOnLineStruct({
    List<String>? mails,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mails = mails,
        super(firestoreUtilData);

  // "mails" field.
  List<String>? _mails;
  List<String> get mails => _mails ?? const [];
  set mails(List<String>? val) => _mails = val;

  void updateMails(Function(List<String>) updateFn) {
    updateFn(_mails ??= []);
  }

  bool hasMails() => _mails != null;

  static UsuariosOnLineStruct fromMap(Map<String, dynamic> data) =>
      UsuariosOnLineStruct(
        mails: getDataList(data['mails']),
      );

  static UsuariosOnLineStruct? maybeFromMap(dynamic data) => data is Map
      ? UsuariosOnLineStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mails': _mails,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mails': serializeParam(
          _mails,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static UsuariosOnLineStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsuariosOnLineStruct(
        mails: deserializeParam<String>(
          data['mails'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'UsuariosOnLineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UsuariosOnLineStruct &&
        listEquality.equals(mails, other.mails);
  }

  @override
  int get hashCode => const ListEquality().hash([mails]);
}

UsuariosOnLineStruct createUsuariosOnLineStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsuariosOnLineStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsuariosOnLineStruct? updateUsuariosOnLineStruct(
  UsuariosOnLineStruct? usuariosOnLine, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usuariosOnLine
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsuariosOnLineStructData(
  Map<String, dynamic> firestoreData,
  UsuariosOnLineStruct? usuariosOnLine,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usuariosOnLine == null) {
    return;
  }
  if (usuariosOnLine.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usuariosOnLine.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usuariosOnLineData =
      getUsuariosOnLineFirestoreData(usuariosOnLine, forFieldValue);
  final nestedData =
      usuariosOnLineData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usuariosOnLine.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsuariosOnLineFirestoreData(
  UsuariosOnLineStruct? usuariosOnLine, [
  bool forFieldValue = false,
]) {
  if (usuariosOnLine == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usuariosOnLine.toMap());

  // Add any Firestore field values
  mapToFirestore(usuariosOnLine.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsuariosOnLineListFirestoreData(
  List<UsuariosOnLineStruct>? usuariosOnLines,
) =>
    usuariosOnLines
        ?.map((e) => getUsuariosOnLineFirestoreData(e, true))
        .toList() ??
    [];
