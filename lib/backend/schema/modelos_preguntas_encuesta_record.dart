import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModelosPreguntasEncuestaRecord extends FirestoreRecord {
  ModelosPreguntasEncuestaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "modeloEncuesta" field.
  DocumentReference? _modeloEncuesta;
  DocumentReference? get modeloEncuesta => _modeloEncuesta;
  bool hasModeloEncuesta() => _modeloEncuesta != null;

  // "numero" field.
  int? _numero;
  int get numero => _numero ?? 0;
  bool hasNumero() => _numero != null;

  // "pregunta" field.
  String? _pregunta;
  String get pregunta => _pregunta ?? '';
  bool hasPregunta() => _pregunta != null;

  // "informacion" field.
  String? _informacion;
  String get informacion => _informacion ?? '';
  bool hasInformacion() => _informacion != null;

  // "dependeDe" field.
  DocumentReference? _dependeDe;
  DocumentReference? get dependeDe => _dependeDe;
  bool hasDependeDe() => _dependeDe != null;

  // "dependeDeRespuesta" field.
  int? _dependeDeRespuesta;
  int get dependeDeRespuesta => _dependeDeRespuesta ?? 0;
  bool hasDependeDeRespuesta() => _dependeDeRespuesta != null;

  // "respuesta1" field.
  String? _respuesta1;
  String get respuesta1 => _respuesta1 ?? '';
  bool hasRespuesta1() => _respuesta1 != null;

  // "respuesta2" field.
  String? _respuesta2;
  String get respuesta2 => _respuesta2 ?? '';
  bool hasRespuesta2() => _respuesta2 != null;

  // "respuesta3" field.
  String? _respuesta3;
  String get respuesta3 => _respuesta3 ?? '';
  bool hasRespuesta3() => _respuesta3 != null;

  // "respuesta4" field.
  String? _respuesta4;
  String get respuesta4 => _respuesta4 ?? '';
  bool hasRespuesta4() => _respuesta4 != null;

  // "respuesta5" field.
  String? _respuesta5;
  String get respuesta5 => _respuesta5 ?? '';
  bool hasRespuesta5() => _respuesta5 != null;

  // "respuesta6" field.
  String? _respuesta6;
  String get respuesta6 => _respuesta6 ?? '';
  bool hasRespuesta6() => _respuesta6 != null;

  // "respuesta7" field.
  String? _respuesta7;
  String get respuesta7 => _respuesta7 ?? '';
  bool hasRespuesta7() => _respuesta7 != null;

  // "respuesta8" field.
  String? _respuesta8;
  String get respuesta8 => _respuesta8 ?? '';
  bool hasRespuesta8() => _respuesta8 != null;

  // "respuesta9" field.
  String? _respuesta9;
  String get respuesta9 => _respuesta9 ?? '';
  bool hasRespuesta9() => _respuesta9 != null;

  // "respuesta10" field.
  String? _respuesta10;
  String get respuesta10 => _respuesta10 ?? '';
  bool hasRespuesta10() => _respuesta10 != null;

  // "numRespuestas" field.
  int? _numRespuestas;
  int get numRespuestas => _numRespuestas ?? 0;
  bool hasNumRespuestas() => _numRespuestas != null;

  // "multiSelect" field.
  bool? _multiSelect;
  bool get multiSelect => _multiSelect ?? false;
  bool hasMultiSelect() => _multiSelect != null;

  // "imagen1" field.
  String? _imagen1;
  String get imagen1 => _imagen1 ?? '';
  bool hasImagen1() => _imagen1 != null;

  // "imagen2" field.
  String? _imagen2;
  String get imagen2 => _imagen2 ?? '';
  bool hasImagen2() => _imagen2 != null;

  // "imagen3" field.
  String? _imagen3;
  String get imagen3 => _imagen3 ?? '';
  bool hasImagen3() => _imagen3 != null;

  // "imagen4" field.
  String? _imagen4;
  String get imagen4 => _imagen4 ?? '';
  bool hasImagen4() => _imagen4 != null;

  // "imagen5" field.
  String? _imagen5;
  String get imagen5 => _imagen5 ?? '';
  bool hasImagen5() => _imagen5 != null;

  // "imagen6" field.
  String? _imagen6;
  String get imagen6 => _imagen6 ?? '';
  bool hasImagen6() => _imagen6 != null;

  // "imagen7" field.
  String? _imagen7;
  String get imagen7 => _imagen7 ?? '';
  bool hasImagen7() => _imagen7 != null;

  // "imagen8" field.
  String? _imagen8;
  String get imagen8 => _imagen8 ?? '';
  bool hasImagen8() => _imagen8 != null;

  // "imagen9" field.
  String? _imagen9;
  String get imagen9 => _imagen9 ?? '';
  bool hasImagen9() => _imagen9 != null;

  // "imagen10" field.
  String? _imagen10;
  String get imagen10 => _imagen10 ?? '';
  bool hasImagen10() => _imagen10 != null;

  // "imagenes" field.
  bool? _imagenes;
  bool get imagenes => _imagenes ?? false;
  bool hasImagenes() => _imagenes != null;

  // "showTextoConImagenes" field.
  bool? _showTextoConImagenes;
  bool get showTextoConImagenes => _showTextoConImagenes ?? false;
  bool hasShowTextoConImagenes() => _showTextoConImagenes != null;

  // "respuesta11" field.
  String? _respuesta11;
  String get respuesta11 => _respuesta11 ?? '';
  bool hasRespuesta11() => _respuesta11 != null;

  // "respuesta12" field.
  String? _respuesta12;
  String get respuesta12 => _respuesta12 ?? '';
  bool hasRespuesta12() => _respuesta12 != null;

  // "respuesta13" field.
  String? _respuesta13;
  String get respuesta13 => _respuesta13 ?? '';
  bool hasRespuesta13() => _respuesta13 != null;

  // "respuesta14" field.
  String? _respuesta14;
  String get respuesta14 => _respuesta14 ?? '';
  bool hasRespuesta14() => _respuesta14 != null;

  // "respuesta15" field.
  String? _respuesta15;
  String get respuesta15 => _respuesta15 ?? '';
  bool hasRespuesta15() => _respuesta15 != null;

  // "respuesta16" field.
  String? _respuesta16;
  String get respuesta16 => _respuesta16 ?? '';
  bool hasRespuesta16() => _respuesta16 != null;

  // "respuesta17" field.
  String? _respuesta17;
  String get respuesta17 => _respuesta17 ?? '';
  bool hasRespuesta17() => _respuesta17 != null;

  // "respuesta18" field.
  String? _respuesta18;
  String get respuesta18 => _respuesta18 ?? '';
  bool hasRespuesta18() => _respuesta18 != null;

  // "respuesta19" field.
  String? _respuesta19;
  String get respuesta19 => _respuesta19 ?? '';
  bool hasRespuesta19() => _respuesta19 != null;

  // "respuesta20" field.
  String? _respuesta20;
  String get respuesta20 => _respuesta20 ?? '';
  bool hasRespuesta20() => _respuesta20 != null;

  // "imagen11" field.
  String? _imagen11;
  String get imagen11 => _imagen11 ?? '';
  bool hasImagen11() => _imagen11 != null;

  // "imagen12" field.
  String? _imagen12;
  String get imagen12 => _imagen12 ?? '';
  bool hasImagen12() => _imagen12 != null;

  // "imagen13" field.
  String? _imagen13;
  String get imagen13 => _imagen13 ?? '';
  bool hasImagen13() => _imagen13 != null;

  // "imagen14" field.
  String? _imagen14;
  String get imagen14 => _imagen14 ?? '';
  bool hasImagen14() => _imagen14 != null;

  // "imagen15" field.
  String? _imagen15;
  String get imagen15 => _imagen15 ?? '';
  bool hasImagen15() => _imagen15 != null;

  // "imagen16" field.
  String? _imagen16;
  String get imagen16 => _imagen16 ?? '';
  bool hasImagen16() => _imagen16 != null;

  // "imagen17" field.
  String? _imagen17;
  String get imagen17 => _imagen17 ?? '';
  bool hasImagen17() => _imagen17 != null;

  // "imagen18" field.
  String? _imagen18;
  String get imagen18 => _imagen18 ?? '';
  bool hasImagen18() => _imagen18 != null;

  // "imagen19" field.
  String? _imagen19;
  String get imagen19 => _imagen19 ?? '';
  bool hasImagen19() => _imagen19 != null;

  // "imagen20" field.
  String? _imagen20;
  String get imagen20 => _imagen20 ?? '';
  bool hasImagen20() => _imagen20 != null;

  // "deTexto" field.
  bool? _deTexto;
  bool get deTexto => _deTexto ?? false;
  bool hasDeTexto() => _deTexto != null;

  // "deNumero" field.
  bool? _deNumero;
  bool get deNumero => _deNumero ?? false;
  bool hasDeNumero() => _deNumero != null;

  // "deRango" field.
  bool? _deRango;
  bool get deRango => _deRango ?? false;
  bool hasDeRango() => _deRango != null;

  // "rangoMinimo" field.
  int? _rangoMinimo;
  int get rangoMinimo => _rangoMinimo ?? 0;
  bool hasRangoMinimo() => _rangoMinimo != null;

  // "rangoMaximo" field.
  int? _rangoMaximo;
  int get rangoMaximo => _rangoMaximo ?? 0;
  bool hasRangoMaximo() => _rangoMaximo != null;

  void _initializeFields() {
    _modeloEncuesta = snapshotData['modeloEncuesta'] as DocumentReference?;
    _numero = castToType<int>(snapshotData['numero']);
    _pregunta = snapshotData['pregunta'] as String?;
    _informacion = snapshotData['informacion'] as String?;
    _dependeDe = snapshotData['dependeDe'] as DocumentReference?;
    _dependeDeRespuesta = castToType<int>(snapshotData['dependeDeRespuesta']);
    _respuesta1 = snapshotData['respuesta1'] as String?;
    _respuesta2 = snapshotData['respuesta2'] as String?;
    _respuesta3 = snapshotData['respuesta3'] as String?;
    _respuesta4 = snapshotData['respuesta4'] as String?;
    _respuesta5 = snapshotData['respuesta5'] as String?;
    _respuesta6 = snapshotData['respuesta6'] as String?;
    _respuesta7 = snapshotData['respuesta7'] as String?;
    _respuesta8 = snapshotData['respuesta8'] as String?;
    _respuesta9 = snapshotData['respuesta9'] as String?;
    _respuesta10 = snapshotData['respuesta10'] as String?;
    _numRespuestas = castToType<int>(snapshotData['numRespuestas']);
    _multiSelect = snapshotData['multiSelect'] as bool?;
    _imagen1 = snapshotData['imagen1'] as String?;
    _imagen2 = snapshotData['imagen2'] as String?;
    _imagen3 = snapshotData['imagen3'] as String?;
    _imagen4 = snapshotData['imagen4'] as String?;
    _imagen5 = snapshotData['imagen5'] as String?;
    _imagen6 = snapshotData['imagen6'] as String?;
    _imagen7 = snapshotData['imagen7'] as String?;
    _imagen8 = snapshotData['imagen8'] as String?;
    _imagen9 = snapshotData['imagen9'] as String?;
    _imagen10 = snapshotData['imagen10'] as String?;
    _imagenes = snapshotData['imagenes'] as bool?;
    _showTextoConImagenes = snapshotData['showTextoConImagenes'] as bool?;
    _respuesta11 = snapshotData['respuesta11'] as String?;
    _respuesta12 = snapshotData['respuesta12'] as String?;
    _respuesta13 = snapshotData['respuesta13'] as String?;
    _respuesta14 = snapshotData['respuesta14'] as String?;
    _respuesta15 = snapshotData['respuesta15'] as String?;
    _respuesta16 = snapshotData['respuesta16'] as String?;
    _respuesta17 = snapshotData['respuesta17'] as String?;
    _respuesta18 = snapshotData['respuesta18'] as String?;
    _respuesta19 = snapshotData['respuesta19'] as String?;
    _respuesta20 = snapshotData['respuesta20'] as String?;
    _imagen11 = snapshotData['imagen11'] as String?;
    _imagen12 = snapshotData['imagen12'] as String?;
    _imagen13 = snapshotData['imagen13'] as String?;
    _imagen14 = snapshotData['imagen14'] as String?;
    _imagen15 = snapshotData['imagen15'] as String?;
    _imagen16 = snapshotData['imagen16'] as String?;
    _imagen17 = snapshotData['imagen17'] as String?;
    _imagen18 = snapshotData['imagen18'] as String?;
    _imagen19 = snapshotData['imagen19'] as String?;
    _imagen20 = snapshotData['imagen20'] as String?;
    _deTexto = snapshotData['deTexto'] as bool?;
    _deNumero = snapshotData['deNumero'] as bool?;
    _deRango = snapshotData['deRango'] as bool?;
    _rangoMinimo = castToType<int>(snapshotData['rangoMinimo']);
    _rangoMaximo = castToType<int>(snapshotData['rangoMaximo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('modelosPreguntasEncuesta');

  static Stream<ModelosPreguntasEncuestaRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ModelosPreguntasEncuestaRecord.fromSnapshot(s));

  static Future<ModelosPreguntasEncuestaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ModelosPreguntasEncuestaRecord.fromSnapshot(s));

  static ModelosPreguntasEncuestaRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ModelosPreguntasEncuestaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModelosPreguntasEncuestaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModelosPreguntasEncuestaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModelosPreguntasEncuestaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModelosPreguntasEncuestaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModelosPreguntasEncuestaRecordData({
  DocumentReference? modeloEncuesta,
  int? numero,
  String? pregunta,
  String? informacion,
  DocumentReference? dependeDe,
  int? dependeDeRespuesta,
  String? respuesta1,
  String? respuesta2,
  String? respuesta3,
  String? respuesta4,
  String? respuesta5,
  String? respuesta6,
  String? respuesta7,
  String? respuesta8,
  String? respuesta9,
  String? respuesta10,
  int? numRespuestas,
  bool? multiSelect,
  String? imagen1,
  String? imagen2,
  String? imagen3,
  String? imagen4,
  String? imagen5,
  String? imagen6,
  String? imagen7,
  String? imagen8,
  String? imagen9,
  String? imagen10,
  bool? imagenes,
  bool? showTextoConImagenes,
  String? respuesta11,
  String? respuesta12,
  String? respuesta13,
  String? respuesta14,
  String? respuesta15,
  String? respuesta16,
  String? respuesta17,
  String? respuesta18,
  String? respuesta19,
  String? respuesta20,
  String? imagen11,
  String? imagen12,
  String? imagen13,
  String? imagen14,
  String? imagen15,
  String? imagen16,
  String? imagen17,
  String? imagen18,
  String? imagen19,
  String? imagen20,
  bool? deTexto,
  bool? deNumero,
  bool? deRango,
  int? rangoMinimo,
  int? rangoMaximo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'modeloEncuesta': modeloEncuesta,
      'numero': numero,
      'pregunta': pregunta,
      'informacion': informacion,
      'dependeDe': dependeDe,
      'dependeDeRespuesta': dependeDeRespuesta,
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
      'numRespuestas': numRespuestas,
      'multiSelect': multiSelect,
      'imagen1': imagen1,
      'imagen2': imagen2,
      'imagen3': imagen3,
      'imagen4': imagen4,
      'imagen5': imagen5,
      'imagen6': imagen6,
      'imagen7': imagen7,
      'imagen8': imagen8,
      'imagen9': imagen9,
      'imagen10': imagen10,
      'imagenes': imagenes,
      'showTextoConImagenes': showTextoConImagenes,
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
      'imagen11': imagen11,
      'imagen12': imagen12,
      'imagen13': imagen13,
      'imagen14': imagen14,
      'imagen15': imagen15,
      'imagen16': imagen16,
      'imagen17': imagen17,
      'imagen18': imagen18,
      'imagen19': imagen19,
      'imagen20': imagen20,
      'deTexto': deTexto,
      'deNumero': deNumero,
      'deRango': deRango,
      'rangoMinimo': rangoMinimo,
      'rangoMaximo': rangoMaximo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModelosPreguntasEncuestaRecordDocumentEquality
    implements Equality<ModelosPreguntasEncuestaRecord> {
  const ModelosPreguntasEncuestaRecordDocumentEquality();

  @override
  bool equals(
      ModelosPreguntasEncuestaRecord? e1, ModelosPreguntasEncuestaRecord? e2) {
    return e1?.modeloEncuesta == e2?.modeloEncuesta &&
        e1?.numero == e2?.numero &&
        e1?.pregunta == e2?.pregunta &&
        e1?.informacion == e2?.informacion &&
        e1?.dependeDe == e2?.dependeDe &&
        e1?.dependeDeRespuesta == e2?.dependeDeRespuesta &&
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
        e1?.numRespuestas == e2?.numRespuestas &&
        e1?.multiSelect == e2?.multiSelect &&
        e1?.imagen1 == e2?.imagen1 &&
        e1?.imagen2 == e2?.imagen2 &&
        e1?.imagen3 == e2?.imagen3 &&
        e1?.imagen4 == e2?.imagen4 &&
        e1?.imagen5 == e2?.imagen5 &&
        e1?.imagen6 == e2?.imagen6 &&
        e1?.imagen7 == e2?.imagen7 &&
        e1?.imagen8 == e2?.imagen8 &&
        e1?.imagen9 == e2?.imagen9 &&
        e1?.imagen10 == e2?.imagen10 &&
        e1?.imagenes == e2?.imagenes &&
        e1?.showTextoConImagenes == e2?.showTextoConImagenes &&
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
        e1?.imagen11 == e2?.imagen11 &&
        e1?.imagen12 == e2?.imagen12 &&
        e1?.imagen13 == e2?.imagen13 &&
        e1?.imagen14 == e2?.imagen14 &&
        e1?.imagen15 == e2?.imagen15 &&
        e1?.imagen16 == e2?.imagen16 &&
        e1?.imagen17 == e2?.imagen17 &&
        e1?.imagen18 == e2?.imagen18 &&
        e1?.imagen19 == e2?.imagen19 &&
        e1?.imagen20 == e2?.imagen20 &&
        e1?.deTexto == e2?.deTexto &&
        e1?.deNumero == e2?.deNumero &&
        e1?.deRango == e2?.deRango &&
        e1?.rangoMinimo == e2?.rangoMinimo &&
        e1?.rangoMaximo == e2?.rangoMaximo;
  }

  @override
  int hash(ModelosPreguntasEncuestaRecord? e) => const ListEquality().hash([
        e?.modeloEncuesta,
        e?.numero,
        e?.pregunta,
        e?.informacion,
        e?.dependeDe,
        e?.dependeDeRespuesta,
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
        e?.numRespuestas,
        e?.multiSelect,
        e?.imagen1,
        e?.imagen2,
        e?.imagen3,
        e?.imagen4,
        e?.imagen5,
        e?.imagen6,
        e?.imagen7,
        e?.imagen8,
        e?.imagen9,
        e?.imagen10,
        e?.imagenes,
        e?.showTextoConImagenes,
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
        e?.imagen11,
        e?.imagen12,
        e?.imagen13,
        e?.imagen14,
        e?.imagen15,
        e?.imagen16,
        e?.imagen17,
        e?.imagen18,
        e?.imagen19,
        e?.imagen20,
        e?.deTexto,
        e?.deNumero,
        e?.deRango,
        e?.rangoMinimo,
        e?.rangoMaximo
      ]);

  @override
  bool isValidKey(Object? o) => o is ModelosPreguntasEncuestaRecord;
}
