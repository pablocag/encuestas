import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModelosEncuestasRecord extends FirestoreRecord {
  ModelosEncuestasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "pitch" field.
  String? _pitch;
  String get pitch => _pitch ?? '';
  bool hasPitch() => _pitch != null;

  // "fechaCreacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  bool hasActiva() => _activa != null;

  // "membresia" field.
  DocumentReference? _membresia;
  DocumentReference? get membresia => _membresia;
  bool hasMembresia() => _membresia != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  void _initializeFields() {
    _descripcion = snapshotData['descripcion'] as String?;
    _pitch = snapshotData['pitch'] as String?;
    _fechaCreacion = snapshotData['fechaCreacion'] as DateTime?;
    _activa = snapshotData['activa'] as bool?;
    _membresia = snapshotData['membresia'] as DocumentReference?;
    _titulo = snapshotData['titulo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('modelosEncuestas');

  static Stream<ModelosEncuestasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModelosEncuestasRecord.fromSnapshot(s));

  static Future<ModelosEncuestasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ModelosEncuestasRecord.fromSnapshot(s));

  static ModelosEncuestasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModelosEncuestasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModelosEncuestasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModelosEncuestasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModelosEncuestasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModelosEncuestasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModelosEncuestasRecordData({
  String? descripcion,
  String? pitch,
  DateTime? fechaCreacion,
  bool? activa,
  DocumentReference? membresia,
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descripcion': descripcion,
      'pitch': pitch,
      'fechaCreacion': fechaCreacion,
      'activa': activa,
      'membresia': membresia,
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModelosEncuestasRecordDocumentEquality
    implements Equality<ModelosEncuestasRecord> {
  const ModelosEncuestasRecordDocumentEquality();

  @override
  bool equals(ModelosEncuestasRecord? e1, ModelosEncuestasRecord? e2) {
    return e1?.descripcion == e2?.descripcion &&
        e1?.pitch == e2?.pitch &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.activa == e2?.activa &&
        e1?.membresia == e2?.membresia &&
        e1?.titulo == e2?.titulo;
  }

  @override
  int hash(ModelosEncuestasRecord? e) => const ListEquality().hash([
        e?.descripcion,
        e?.pitch,
        e?.fechaCreacion,
        e?.activa,
        e?.membresia,
        e?.titulo
      ]);

  @override
  bool isValidKey(Object? o) => o is ModelosEncuestasRecord;
}
