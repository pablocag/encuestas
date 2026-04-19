// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RespuestaLibreUsuariosStruct extends FFFirebaseStruct {
  RespuestaLibreUsuariosStruct({
    DocumentReference? usuario,
    String? respuesta,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _usuario = usuario,
        _respuesta = respuesta,
        super(firestoreUtilData);

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  set usuario(DocumentReference? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "respuesta" field.
  String? _respuesta;
  String get respuesta => _respuesta ?? '';
  set respuesta(String? val) => _respuesta = val;

  bool hasRespuesta() => _respuesta != null;

  static RespuestaLibreUsuariosStruct fromMap(Map<String, dynamic> data) =>
      RespuestaLibreUsuariosStruct(
        usuario: data['usuario'] as DocumentReference?,
        respuesta: data['respuesta'] as String?,
      );

  static RespuestaLibreUsuariosStruct? maybeFromMap(dynamic data) => data is Map
      ? RespuestaLibreUsuariosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'usuario': _usuario,
        'respuesta': _respuesta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'usuario': serializeParam(
          _usuario,
          ParamType.DocumentReference,
        ),
        'respuesta': serializeParam(
          _respuesta,
          ParamType.String,
        ),
      }.withoutNulls;

  static RespuestaLibreUsuariosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RespuestaLibreUsuariosStruct(
        usuario: deserializeParam(
          data['usuario'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        respuesta: deserializeParam(
          data['respuesta'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RespuestaLibreUsuariosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RespuestaLibreUsuariosStruct &&
        usuario == other.usuario &&
        respuesta == other.respuesta;
  }

  @override
  int get hashCode => const ListEquality().hash([usuario, respuesta]);
}

RespuestaLibreUsuariosStruct createRespuestaLibreUsuariosStruct({
  DocumentReference? usuario,
  String? respuesta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RespuestaLibreUsuariosStruct(
      usuario: usuario,
      respuesta: respuesta,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RespuestaLibreUsuariosStruct? updateRespuestaLibreUsuariosStruct(
  RespuestaLibreUsuariosStruct? respuestaLibreUsuarios, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    respuestaLibreUsuarios
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRespuestaLibreUsuariosStructData(
  Map<String, dynamic> firestoreData,
  RespuestaLibreUsuariosStruct? respuestaLibreUsuarios,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (respuestaLibreUsuarios == null) {
    return;
  }
  if (respuestaLibreUsuarios.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      respuestaLibreUsuarios.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final respuestaLibreUsuariosData = getRespuestaLibreUsuariosFirestoreData(
      respuestaLibreUsuarios, forFieldValue);
  final nestedData =
      respuestaLibreUsuariosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      respuestaLibreUsuarios.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRespuestaLibreUsuariosFirestoreData(
  RespuestaLibreUsuariosStruct? respuestaLibreUsuarios, [
  bool forFieldValue = false,
]) {
  if (respuestaLibreUsuarios == null) {
    return {};
  }
  final firestoreData = mapToFirestore(respuestaLibreUsuarios.toMap());

  // Add any Firestore field values
  mapToFirestore(respuestaLibreUsuarios.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRespuestaLibreUsuariosListFirestoreData(
  List<RespuestaLibreUsuariosStruct>? respuestaLibreUsuarioss,
) =>
    respuestaLibreUsuarioss
        ?.map((e) => getRespuestaLibreUsuariosFirestoreData(e, true))
        .toList() ??
    [];
