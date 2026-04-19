import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextosRecord extends FirestoreRecord {
  TextosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _texto = snapshotData['texto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('textos');

  static Stream<TextosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TextosRecord.fromSnapshot(s));

  static Future<TextosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TextosRecord.fromSnapshot(s));

  static TextosRecord fromSnapshot(DocumentSnapshot snapshot) => TextosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TextosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TextosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TextosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TextosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTextosRecordData({
  String? titulo,
  String? texto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'texto': texto,
    }.withoutNulls,
  );

  return firestoreData;
}

class TextosRecordDocumentEquality implements Equality<TextosRecord> {
  const TextosRecordDocumentEquality();

  @override
  bool equals(TextosRecord? e1, TextosRecord? e2) {
    return e1?.titulo == e2?.titulo && e1?.texto == e2?.texto;
  }

  @override
  int hash(TextosRecord? e) => const ListEquality().hash([e?.titulo, e?.texto]);

  @override
  bool isValidKey(Object? o) => o is TextosRecord;
}
