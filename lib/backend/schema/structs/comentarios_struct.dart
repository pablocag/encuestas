// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ComentariosStruct extends FFFirebaseStruct {
  ComentariosStruct({
    DocumentReference? usuario,
    String? comentario,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _usuario = usuario,
        _comentario = comentario,
        super(firestoreUtilData);

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  set usuario(DocumentReference? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  set comentario(String? val) => _comentario = val;

  bool hasComentario() => _comentario != null;

  static ComentariosStruct fromMap(Map<String, dynamic> data) =>
      ComentariosStruct(
        usuario: data['usuario'] as DocumentReference?,
        comentario: data['comentario'] as String?,
      );

  static ComentariosStruct? maybeFromMap(dynamic data) => data is Map
      ? ComentariosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'usuario': _usuario,
        'comentario': _comentario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'usuario': serializeParam(
          _usuario,
          ParamType.DocumentReference,
        ),
        'comentario': serializeParam(
          _comentario,
          ParamType.String,
        ),
      }.withoutNulls;

  static ComentariosStruct fromSerializableMap(Map<String, dynamic> data) =>
      ComentariosStruct(
        usuario: deserializeParam(
          data['usuario'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        comentario: deserializeParam(
          data['comentario'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ComentariosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ComentariosStruct &&
        usuario == other.usuario &&
        comentario == other.comentario;
  }

  @override
  int get hashCode => const ListEquality().hash([usuario, comentario]);
}

ComentariosStruct createComentariosStruct({
  DocumentReference? usuario,
  String? comentario,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ComentariosStruct(
      usuario: usuario,
      comentario: comentario,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ComentariosStruct? updateComentariosStruct(
  ComentariosStruct? comentarios, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comentarios
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addComentariosStructData(
  Map<String, dynamic> firestoreData,
  ComentariosStruct? comentarios,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comentarios == null) {
    return;
  }
  if (comentarios.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comentarios.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final comentariosData =
      getComentariosFirestoreData(comentarios, forFieldValue);
  final nestedData =
      comentariosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = comentarios.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getComentariosFirestoreData(
  ComentariosStruct? comentarios, [
  bool forFieldValue = false,
]) {
  if (comentarios == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comentarios.toMap());

  // Add any Firestore field values
  mapToFirestore(comentarios.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getComentariosListFirestoreData(
  List<ComentariosStruct>? comentarioss,
) =>
    comentarioss?.map((e) => getComentariosFirestoreData(e, true)).toList() ??
    [];
