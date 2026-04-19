import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigRecord extends FirestoreRecord {
  ConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "urlAndroid" field.
  String? _urlAndroid;
  String get urlAndroid => _urlAndroid ?? '';
  bool hasUrlAndroid() => _urlAndroid != null;

  // "urlIOS" field.
  String? _urlIOS;
  String get urlIOS => _urlIOS ?? '';
  bool hasUrlIOS() => _urlIOS != null;

  // "guiaRapida" field.
  String? _guiaRapida;
  String get guiaRapida => _guiaRapida ?? '';
  bool hasGuiaRapida() => _guiaRapida != null;

  // "urlHUAWEI" field.
  String? _urlHUAWEI;
  String get urlHUAWEI => _urlHUAWEI ?? '';
  bool hasUrlHUAWEI() => _urlHUAWEI != null;

  void _initializeFields() {
    _urlAndroid = snapshotData['urlAndroid'] as String?;
    _urlIOS = snapshotData['urlIOS'] as String?;
    _guiaRapida = snapshotData['guiaRapida'] as String?;
    _urlHUAWEI = snapshotData['urlHUAWEI'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigRecord.fromSnapshot(s));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigRecord.fromSnapshot(s));

  static ConfigRecord fromSnapshot(DocumentSnapshot snapshot) => ConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigRecordData({
  String? urlAndroid,
  String? urlIOS,
  String? guiaRapida,
  String? urlHUAWEI,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'urlAndroid': urlAndroid,
      'urlIOS': urlIOS,
      'guiaRapida': guiaRapida,
      'urlHUAWEI': urlHUAWEI,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    return e1?.urlAndroid == e2?.urlAndroid &&
        e1?.urlIOS == e2?.urlIOS &&
        e1?.guiaRapida == e2?.guiaRapida &&
        e1?.urlHUAWEI == e2?.urlHUAWEI;
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality()
      .hash([e?.urlAndroid, e?.urlIOS, e?.guiaRapida, e?.urlHUAWEI]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
