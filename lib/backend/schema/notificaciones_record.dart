import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacionesRecord extends FirestoreRecord {
  NotificacionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "envidadoPor" field.
  DocumentReference? _envidadoPor;
  DocumentReference? get envidadoPor => _envidadoPor;
  bool hasEnvidadoPor() => _envidadoPor != null;

  // "destinatarios" field.
  List<DocumentReference>? _destinatarios;
  List<DocumentReference> get destinatarios => _destinatarios ?? const [];
  bool hasDestinatarios() => _destinatarios != null;

  // "leidoPor" field.
  List<DocumentReference>? _leidoPor;
  List<DocumentReference> get leidoPor => _leidoPor ?? const [];
  bool hasLeidoPor() => _leidoPor != null;

  // "Mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "gps" field.
  LatLng? _gps;
  LatLng? get gps => _gps;
  bool hasGps() => _gps != null;

  // "tel" field.
  String? _tel;
  String get tel => _tel ?? '';
  bool hasTel() => _tel != null;

  void _initializeFields() {
    _envidadoPor = snapshotData['envidadoPor'] as DocumentReference?;
    _destinatarios = getDataList(snapshotData['destinatarios']);
    _leidoPor = getDataList(snapshotData['leidoPor']);
    _mensaje = snapshotData['Mensaje'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _gps = snapshotData['gps'] as LatLng?;
    _tel = snapshotData['tel'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificaciones');

  static Stream<NotificacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacionesRecord.fromSnapshot(s));

  static Future<NotificacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacionesRecord.fromSnapshot(s));

  static NotificacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacionesRecordData({
  DocumentReference? envidadoPor,
  String? mensaje,
  DateTime? timestamp,
  LatLng? gps,
  String? tel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'envidadoPor': envidadoPor,
      'Mensaje': mensaje,
      'timestamp': timestamp,
      'gps': gps,
      'tel': tel,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacionesRecordDocumentEquality
    implements Equality<NotificacionesRecord> {
  const NotificacionesRecordDocumentEquality();

  @override
  bool equals(NotificacionesRecord? e1, NotificacionesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.envidadoPor == e2?.envidadoPor &&
        listEquality.equals(e1?.destinatarios, e2?.destinatarios) &&
        listEquality.equals(e1?.leidoPor, e2?.leidoPor) &&
        e1?.mensaje == e2?.mensaje &&
        e1?.timestamp == e2?.timestamp &&
        e1?.gps == e2?.gps &&
        e1?.tel == e2?.tel;
  }

  @override
  int hash(NotificacionesRecord? e) => const ListEquality().hash([
        e?.envidadoPor,
        e?.destinatarios,
        e?.leidoPor,
        e?.mensaje,
        e?.timestamp,
        e?.gps,
        e?.tel
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacionesRecord;
}
