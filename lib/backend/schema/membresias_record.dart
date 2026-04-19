import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MembresiasRecord extends FirestoreRecord {
  MembresiasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "membresia_ID" field.
  String? _membresiaID;
  String get membresiaID => _membresiaID ?? '';
  bool hasMembresiaID() => _membresiaID != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  bool hasActiva() => _activa != null;

  // "PaquetePersonas" field.
  int? _paquetePersonas;
  int get paquetePersonas => _paquetePersonas ?? 0;
  bool hasPaquetePersonas() => _paquetePersonas != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "PaqueteEncuestas" field.
  int? _paqueteEncuestas;
  int get paqueteEncuestas => _paqueteEncuestas ?? 0;
  bool hasPaqueteEncuestas() => _paqueteEncuestas != null;

  // "usuariosDesactivados" field.
  bool? _usuariosDesactivados;
  bool get usuariosDesactivados => _usuariosDesactivados ?? false;
  bool hasUsuariosDesactivados() => _usuariosDesactivados != null;

  void _initializeFields() {
    _membresiaID = snapshotData['membresia_ID'] as String?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _activa = snapshotData['activa'] as bool?;
    _paquetePersonas = castToType<int>(snapshotData['PaquetePersonas']);
    _logo = snapshotData['logo'] as String?;
    _paqueteEncuestas = castToType<int>(snapshotData['PaqueteEncuestas']);
    _usuariosDesactivados = snapshotData['usuariosDesactivados'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('membresias');

  static Stream<MembresiasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MembresiasRecord.fromSnapshot(s));

  static Future<MembresiasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MembresiasRecord.fromSnapshot(s));

  static MembresiasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MembresiasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MembresiasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MembresiasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MembresiasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MembresiasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMembresiasRecordData({
  String? membresiaID,
  DocumentReference? usuario,
  String? descripcion,
  bool? activa,
  int? paquetePersonas,
  String? logo,
  int? paqueteEncuestas,
  bool? usuariosDesactivados,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'membresia_ID': membresiaID,
      'usuario': usuario,
      'Descripcion': descripcion,
      'activa': activa,
      'PaquetePersonas': paquetePersonas,
      'logo': logo,
      'PaqueteEncuestas': paqueteEncuestas,
      'usuariosDesactivados': usuariosDesactivados,
    }.withoutNulls,
  );

  return firestoreData;
}

class MembresiasRecordDocumentEquality implements Equality<MembresiasRecord> {
  const MembresiasRecordDocumentEquality();

  @override
  bool equals(MembresiasRecord? e1, MembresiasRecord? e2) {
    return e1?.membresiaID == e2?.membresiaID &&
        e1?.usuario == e2?.usuario &&
        e1?.descripcion == e2?.descripcion &&
        e1?.activa == e2?.activa &&
        e1?.paquetePersonas == e2?.paquetePersonas &&
        e1?.logo == e2?.logo &&
        e1?.paqueteEncuestas == e2?.paqueteEncuestas &&
        e1?.usuariosDesactivados == e2?.usuariosDesactivados;
  }

  @override
  int hash(MembresiasRecord? e) => const ListEquality().hash([
        e?.membresiaID,
        e?.usuario,
        e?.descripcion,
        e?.activa,
        e?.paquetePersonas,
        e?.logo,
        e?.paqueteEncuestas,
        e?.usuariosDesactivados
      ]);

  @override
  bool isValidKey(Object? o) => o is MembresiasRecord;
}
