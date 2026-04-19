import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RespuestasEncuestasRecord extends FirestoreRecord {
  RespuestasEncuestasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "encuesta" field.
  DocumentReference? _encuesta;
  DocumentReference? get encuesta => _encuesta;
  bool hasEncuesta() => _encuesta != null;

  // "pregunta" field.
  DocumentReference? _pregunta;
  DocumentReference? get pregunta => _pregunta;
  bool hasPregunta() => _pregunta != null;

  // "fechaCreacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "respuesta1" field.
  bool? _respuesta1;
  bool get respuesta1 => _respuesta1 ?? false;
  bool hasRespuesta1() => _respuesta1 != null;

  // "respuesta2" field.
  bool? _respuesta2;
  bool get respuesta2 => _respuesta2 ?? false;
  bool hasRespuesta2() => _respuesta2 != null;

  // "respuesta3" field.
  bool? _respuesta3;
  bool get respuesta3 => _respuesta3 ?? false;
  bool hasRespuesta3() => _respuesta3 != null;

  // "respuesta4" field.
  bool? _respuesta4;
  bool get respuesta4 => _respuesta4 ?? false;
  bool hasRespuesta4() => _respuesta4 != null;

  // "respuesta5" field.
  bool? _respuesta5;
  bool get respuesta5 => _respuesta5 ?? false;
  bool hasRespuesta5() => _respuesta5 != null;

  // "respuesta6" field.
  bool? _respuesta6;
  bool get respuesta6 => _respuesta6 ?? false;
  bool hasRespuesta6() => _respuesta6 != null;

  // "respuesta7" field.
  bool? _respuesta7;
  bool get respuesta7 => _respuesta7 ?? false;
  bool hasRespuesta7() => _respuesta7 != null;

  // "respuesta8" field.
  bool? _respuesta8;
  bool get respuesta8 => _respuesta8 ?? false;
  bool hasRespuesta8() => _respuesta8 != null;

  // "respuesta9" field.
  bool? _respuesta9;
  bool get respuesta9 => _respuesta9 ?? false;
  bool hasRespuesta9() => _respuesta9 != null;

  // "respuesta10" field.
  bool? _respuesta10;
  bool get respuesta10 => _respuesta10 ?? false;
  bool hasRespuesta10() => _respuesta10 != null;

  // "seleccion" field.
  int? _seleccion;
  int get seleccion => _seleccion ?? 0;
  bool hasSeleccion() => _seleccion != null;

  // "multiseleccion" field.
  List<int>? _multiseleccion;
  List<int> get multiseleccion => _multiseleccion ?? const [];
  bool hasMultiseleccion() => _multiseleccion != null;

  // "respuesta11" field.
  bool? _respuesta11;
  bool get respuesta11 => _respuesta11 ?? false;
  bool hasRespuesta11() => _respuesta11 != null;

  // "respuesta12" field.
  bool? _respuesta12;
  bool get respuesta12 => _respuesta12 ?? false;
  bool hasRespuesta12() => _respuesta12 != null;

  // "respuesta13" field.
  bool? _respuesta13;
  bool get respuesta13 => _respuesta13 ?? false;
  bool hasRespuesta13() => _respuesta13 != null;

  // "respuesta14" field.
  bool? _respuesta14;
  bool get respuesta14 => _respuesta14 ?? false;
  bool hasRespuesta14() => _respuesta14 != null;

  // "respuesta15" field.
  bool? _respuesta15;
  bool get respuesta15 => _respuesta15 ?? false;
  bool hasRespuesta15() => _respuesta15 != null;

  // "respuesta16" field.
  bool? _respuesta16;
  bool get respuesta16 => _respuesta16 ?? false;
  bool hasRespuesta16() => _respuesta16 != null;

  // "respuesta17" field.
  bool? _respuesta17;
  bool get respuesta17 => _respuesta17 ?? false;
  bool hasRespuesta17() => _respuesta17 != null;

  // "respuesta18" field.
  bool? _respuesta18;
  bool get respuesta18 => _respuesta18 ?? false;
  bool hasRespuesta18() => _respuesta18 != null;

  // "respuesta19" field.
  bool? _respuesta19;
  bool get respuesta19 => _respuesta19 ?? false;
  bool hasRespuesta19() => _respuesta19 != null;

  // "respuesta20" field.
  bool? _respuesta20;
  bool get respuesta20 => _respuesta20 ?? false;
  bool hasRespuesta20() => _respuesta20 != null;

  // "respuestaTexto" field.
  String? _respuestaTexto;
  String get respuestaTexto => _respuestaTexto ?? '';
  bool hasRespuestaTexto() => _respuestaTexto != null;

  // "respuestaNumero" field.
  int? _respuestaNumero;
  int get respuestaNumero => _respuestaNumero ?? 0;
  bool hasRespuestaNumero() => _respuestaNumero != null;

  // "deOpcion" field.
  bool? _deOpcion;
  bool get deOpcion => _deOpcion ?? false;
  bool hasDeOpcion() => _deOpcion != null;

  void _initializeFields() {
    _encuesta = snapshotData['encuesta'] as DocumentReference?;
    _pregunta = snapshotData['pregunta'] as DocumentReference?;
    _fechaCreacion = snapshotData['fechaCreacion'] as DateTime?;
    _respuesta1 = snapshotData['respuesta1'] as bool?;
    _respuesta2 = snapshotData['respuesta2'] as bool?;
    _respuesta3 = snapshotData['respuesta3'] as bool?;
    _respuesta4 = snapshotData['respuesta4'] as bool?;
    _respuesta5 = snapshotData['respuesta5'] as bool?;
    _respuesta6 = snapshotData['respuesta6'] as bool?;
    _respuesta7 = snapshotData['respuesta7'] as bool?;
    _respuesta8 = snapshotData['respuesta8'] as bool?;
    _respuesta9 = snapshotData['respuesta9'] as bool?;
    _respuesta10 = snapshotData['respuesta10'] as bool?;
    _seleccion = castToType<int>(snapshotData['seleccion']);
    _multiseleccion = getDataList(snapshotData['multiseleccion']);
    _respuesta11 = snapshotData['respuesta11'] as bool?;
    _respuesta12 = snapshotData['respuesta12'] as bool?;
    _respuesta13 = snapshotData['respuesta13'] as bool?;
    _respuesta14 = snapshotData['respuesta14'] as bool?;
    _respuesta15 = snapshotData['respuesta15'] as bool?;
    _respuesta16 = snapshotData['respuesta16'] as bool?;
    _respuesta17 = snapshotData['respuesta17'] as bool?;
    _respuesta18 = snapshotData['respuesta18'] as bool?;
    _respuesta19 = snapshotData['respuesta19'] as bool?;
    _respuesta20 = snapshotData['respuesta20'] as bool?;
    _respuestaTexto = snapshotData['respuestaTexto'] as String?;
    _respuestaNumero = castToType<int>(snapshotData['respuestaNumero']);
    _deOpcion = snapshotData['deOpcion'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('respuestasEncuestas');

  static Stream<RespuestasEncuestasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RespuestasEncuestasRecord.fromSnapshot(s));

  static Future<RespuestasEncuestasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RespuestasEncuestasRecord.fromSnapshot(s));

  static RespuestasEncuestasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RespuestasEncuestasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RespuestasEncuestasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RespuestasEncuestasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RespuestasEncuestasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RespuestasEncuestasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRespuestasEncuestasRecordData({
  DocumentReference? encuesta,
  DocumentReference? pregunta,
  DateTime? fechaCreacion,
  bool? respuesta1,
  bool? respuesta2,
  bool? respuesta3,
  bool? respuesta4,
  bool? respuesta5,
  bool? respuesta6,
  bool? respuesta7,
  bool? respuesta8,
  bool? respuesta9,
  bool? respuesta10,
  int? seleccion,
  bool? respuesta11,
  bool? respuesta12,
  bool? respuesta13,
  bool? respuesta14,
  bool? respuesta15,
  bool? respuesta16,
  bool? respuesta17,
  bool? respuesta18,
  bool? respuesta19,
  bool? respuesta20,
  String? respuestaTexto,
  int? respuestaNumero,
  bool? deOpcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'encuesta': encuesta,
      'pregunta': pregunta,
      'fechaCreacion': fechaCreacion,
      'respuesta1': respuesta1,
      'respuesta2': respuesta2,
      'respuesta3': respuesta3,
      'respuesta4': respuesta4,
      'respuesta5': respuesta5,
      'respuesta6': respuesta6,
      'respuesta7': respuesta7,
      'respuesta8': respuesta8,
      'respuesta9': respuesta9,
      'respuesta10': respuesta10,
      'seleccion': seleccion,
      'respuesta11': respuesta11,
      'respuesta12': respuesta12,
      'respuesta13': respuesta13,
      'respuesta14': respuesta14,
      'respuesta15': respuesta15,
      'respuesta16': respuesta16,
      'respuesta17': respuesta17,
      'respuesta18': respuesta18,
      'respuesta19': respuesta19,
      'respuesta20': respuesta20,
      'respuestaTexto': respuestaTexto,
      'respuestaNumero': respuestaNumero,
      'deOpcion': deOpcion,
    }.withoutNulls,
  );

  return firestoreData;
}

class RespuestasEncuestasRecordDocumentEquality
    implements Equality<RespuestasEncuestasRecord> {
  const RespuestasEncuestasRecordDocumentEquality();

  @override
  bool equals(RespuestasEncuestasRecord? e1, RespuestasEncuestasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.encuesta == e2?.encuesta &&
        e1?.pregunta == e2?.pregunta &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.respuesta1 == e2?.respuesta1 &&
        e1?.respuesta2 == e2?.respuesta2 &&
        e1?.respuesta3 == e2?.respuesta3 &&
        e1?.respuesta4 == e2?.respuesta4 &&
        e1?.respuesta5 == e2?.respuesta5 &&
        e1?.respuesta6 == e2?.respuesta6 &&
        e1?.respuesta7 == e2?.respuesta7 &&
        e1?.respuesta8 == e2?.respuesta8 &&
        e1?.respuesta9 == e2?.respuesta9 &&
        e1?.respuesta10 == e2?.respuesta10 &&
        e1?.seleccion == e2?.seleccion &&
        listEquality.equals(e1?.multiseleccion, e2?.multiseleccion) &&
        e1?.respuesta11 == e2?.respuesta11 &&
        e1?.respuesta12 == e2?.respuesta12 &&
        e1?.respuesta13 == e2?.respuesta13 &&
        e1?.respuesta14 == e2?.respuesta14 &&
        e1?.respuesta15 == e2?.respuesta15 &&
        e1?.respuesta16 == e2?.respuesta16 &&
        e1?.respuesta17 == e2?.respuesta17 &&
        e1?.respuesta18 == e2?.respuesta18 &&
        e1?.respuesta19 == e2?.respuesta19 &&
        e1?.respuesta20 == e2?.respuesta20 &&
        e1?.respuestaTexto == e2?.respuestaTexto &&
        e1?.respuestaNumero == e2?.respuestaNumero &&
        e1?.deOpcion == e2?.deOpcion;
  }

  @override
  int hash(RespuestasEncuestasRecord? e) => const ListEquality().hash([
        e?.encuesta,
        e?.pregunta,
        e?.fechaCreacion,
        e?.respuesta1,
        e?.respuesta2,
        e?.respuesta3,
        e?.respuesta4,
        e?.respuesta5,
        e?.respuesta6,
        e?.respuesta7,
        e?.respuesta8,
        e?.respuesta9,
        e?.respuesta10,
        e?.seleccion,
        e?.multiseleccion,
        e?.respuesta11,
        e?.respuesta12,
        e?.respuesta13,
        e?.respuesta14,
        e?.respuesta15,
        e?.respuesta16,
        e?.respuesta17,
        e?.respuesta18,
        e?.respuesta19,
        e?.respuesta20,
        e?.respuestaTexto,
        e?.respuestaNumero,
        e?.deOpcion
      ]);

  @override
  bool isValidKey(Object? o) => o is RespuestasEncuestasRecord;
}
