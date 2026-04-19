import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EncuestasRecord extends FirestoreRecord {
  EncuestasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "membresia" field.
  DocumentReference? _membresia;
  DocumentReference? get membresia => _membresia;
  bool hasMembresia() => _membresia != null;

  // "modeloEncuesta" field.
  DocumentReference? _modeloEncuesta;
  DocumentReference? get modeloEncuesta => _modeloEncuesta;
  bool hasModeloEncuesta() => _modeloEncuesta != null;

  // "fechaCreacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "preguntaActual" field.
  DocumentReference? _preguntaActual;
  DocumentReference? get preguntaActual => _preguntaActual;
  bool hasPreguntaActual() => _preguntaActual != null;

  // "terminada" field.
  bool? _terminada;
  bool get terminada => _terminada ?? false;
  bool hasTerminada() => _terminada != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "fechaTerminado" field.
  DateTime? _fechaTerminado;
  DateTime? get fechaTerminado => _fechaTerminado;
  bool hasFechaTerminado() => _fechaTerminado != null;

  // "posicionGPS" field.
  LatLng? _posicionGPS;
  LatLng? get posicionGPS => _posicionGPS;
  bool hasPosicionGPS() => _posicionGPS != null;

  // "nombreEncuestado" field.
  String? _nombreEncuestado;
  String get nombreEncuestado => _nombreEncuestado ?? '';
  bool hasNombreEncuestado() => _nombreEncuestado != null;

  void _initializeFields() {
    _membresia = snapshotData['membresia'] as DocumentReference?;
    _modeloEncuesta = snapshotData['modeloEncuesta'] as DocumentReference?;
    _fechaCreacion = snapshotData['fechaCreacion'] as DateTime?;
    _preguntaActual = snapshotData['preguntaActual'] as DocumentReference?;
    _terminada = snapshotData['terminada'] as bool?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _fechaTerminado = snapshotData['fechaTerminado'] as DateTime?;
    _posicionGPS = snapshotData['posicionGPS'] as LatLng?;
    _nombreEncuestado = snapshotData['nombreEncuestado'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('encuestas');

  static Stream<EncuestasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EncuestasRecord.fromSnapshot(s));

  static Future<EncuestasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EncuestasRecord.fromSnapshot(s));

  static EncuestasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EncuestasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EncuestasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EncuestasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EncuestasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EncuestasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEncuestasRecordData({
  DocumentReference? membresia,
  DocumentReference? modeloEncuesta,
  DateTime? fechaCreacion,
  DocumentReference? preguntaActual,
  bool? terminada,
  DocumentReference? usuario,
  DateTime? fechaTerminado,
  LatLng? posicionGPS,
  String? nombreEncuestado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'membresia': membresia,
      'modeloEncuesta': modeloEncuesta,
      'fechaCreacion': fechaCreacion,
      'preguntaActual': preguntaActual,
      'terminada': terminada,
      'usuario': usuario,
      'fechaTerminado': fechaTerminado,
      'posicionGPS': posicionGPS,
      'nombreEncuestado': nombreEncuestado,
    }.withoutNulls,
  );

  return firestoreData;
}

class EncuestasRecordDocumentEquality implements Equality<EncuestasRecord> {
  const EncuestasRecordDocumentEquality();

  @override
  bool equals(EncuestasRecord? e1, EncuestasRecord? e2) {
    return e1?.membresia == e2?.membresia &&
        e1?.modeloEncuesta == e2?.modeloEncuesta &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.preguntaActual == e2?.preguntaActual &&
        e1?.terminada == e2?.terminada &&
        e1?.usuario == e2?.usuario &&
        e1?.fechaTerminado == e2?.fechaTerminado &&
        e1?.posicionGPS == e2?.posicionGPS &&
        e1?.nombreEncuestado == e2?.nombreEncuestado;
  }

  @override
  int hash(EncuestasRecord? e) => const ListEquality().hash([
        e?.membresia,
        e?.modeloEncuesta,
        e?.fechaCreacion,
        e?.preguntaActual,
        e?.terminada,
        e?.usuario,
        e?.fechaTerminado,
        e?.posicionGPS,
        e?.nombreEncuestado
      ]);

  @override
  bool isValidKey(Object? o) => o is EncuestasRecord;
}
