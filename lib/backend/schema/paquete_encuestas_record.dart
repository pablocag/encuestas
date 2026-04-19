import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaqueteEncuestasRecord extends FirestoreRecord {
  PaqueteEncuestasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "encuestas" field.
  int? _encuestas;
  int get encuestas => _encuestas ?? 0;
  bool hasEncuestas() => _encuestas != null;

  // "Precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "PrecioStripe" field.
  double? _precioStripe;
  double get precioStripe => _precioStripe ?? 0.0;
  bool hasPrecioStripe() => _precioStripe != null;

  // "purchase_ID" field.
  String? _purchaseID;
  String get purchaseID => _purchaseID ?? '';
  bool hasPurchaseID() => _purchaseID != null;

  void _initializeFields() {
    _descripcion = snapshotData['Descripcion'] as String?;
    _encuestas = castToType<int>(snapshotData['encuestas']);
    _precio = castToType<double>(snapshotData['Precio']);
    _precioStripe = castToType<double>(snapshotData['PrecioStripe']);
    _purchaseID = snapshotData['purchase_ID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paqueteEncuestas');

  static Stream<PaqueteEncuestasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaqueteEncuestasRecord.fromSnapshot(s));

  static Future<PaqueteEncuestasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PaqueteEncuestasRecord.fromSnapshot(s));

  static PaqueteEncuestasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaqueteEncuestasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaqueteEncuestasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaqueteEncuestasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaqueteEncuestasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaqueteEncuestasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaqueteEncuestasRecordData({
  String? descripcion,
  int? encuestas,
  double? precio,
  double? precioStripe,
  String? purchaseID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Descripcion': descripcion,
      'encuestas': encuestas,
      'Precio': precio,
      'PrecioStripe': precioStripe,
      'purchase_ID': purchaseID,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaqueteEncuestasRecordDocumentEquality
    implements Equality<PaqueteEncuestasRecord> {
  const PaqueteEncuestasRecordDocumentEquality();

  @override
  bool equals(PaqueteEncuestasRecord? e1, PaqueteEncuestasRecord? e2) {
    return e1?.descripcion == e2?.descripcion &&
        e1?.encuestas == e2?.encuestas &&
        e1?.precio == e2?.precio &&
        e1?.precioStripe == e2?.precioStripe &&
        e1?.purchaseID == e2?.purchaseID;
  }

  @override
  int hash(PaqueteEncuestasRecord? e) => const ListEquality().hash([
        e?.descripcion,
        e?.encuestas,
        e?.precio,
        e?.precioStripe,
        e?.purchaseID
      ]);

  @override
  bool isValidKey(Object? o) => o is PaqueteEncuestasRecord;
}
