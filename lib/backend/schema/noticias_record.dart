import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoticiasRecord extends FirestoreRecord {
  NoticiasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "enviadoPor" field.
  DocumentReference? _enviadoPor;
  DocumentReference? get enviadoPor => _enviadoPor;
  bool hasEnviadoPor() => _enviadoPor != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "Texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "Tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "Foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "membresia" field.
  DocumentReference? _membresia;
  DocumentReference? get membresia => _membresia;
  bool hasMembresia() => _membresia != null;

  // "comentarios" field.
  List<ComentariosStruct>? _comentarios;
  List<ComentariosStruct> get comentarios => _comentarios ?? const [];
  bool hasComentarios() => _comentarios != null;

  void _initializeFields() {
    _enviadoPor = snapshotData['enviadoPor'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _texto = snapshotData['Texto'] as String?;
    _tipo = snapshotData['Tipo'] as String?;
    _video = snapshotData['Video'] as String?;
    _foto = snapshotData['Foto'] as String?;
    _membresia = snapshotData['membresia'] as DocumentReference?;
    _comentarios = getStructList(
      snapshotData['comentarios'],
      ComentariosStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('noticias');

  static Stream<NoticiasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoticiasRecord.fromSnapshot(s));

  static Future<NoticiasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoticiasRecord.fromSnapshot(s));

  static NoticiasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NoticiasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoticiasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoticiasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoticiasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NoticiasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNoticiasRecordData({
  DocumentReference? enviadoPor,
  DateTime? timestamp,
  String? texto,
  String? tipo,
  String? video,
  String? foto,
  DocumentReference? membresia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'enviadoPor': enviadoPor,
      'timestamp': timestamp,
      'Texto': texto,
      'Tipo': tipo,
      'Video': video,
      'Foto': foto,
      'membresia': membresia,
    }.withoutNulls,
  );

  return firestoreData;
}

class NoticiasRecordDocumentEquality implements Equality<NoticiasRecord> {
  const NoticiasRecordDocumentEquality();

  @override
  bool equals(NoticiasRecord? e1, NoticiasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.enviadoPor == e2?.enviadoPor &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.texto == e2?.texto &&
        e1?.tipo == e2?.tipo &&
        e1?.video == e2?.video &&
        e1?.foto == e2?.foto &&
        e1?.membresia == e2?.membresia &&
        listEquality.equals(e1?.comentarios, e2?.comentarios);
  }

  @override
  int hash(NoticiasRecord? e) => const ListEquality().hash([
        e?.enviadoPor,
        e?.timestamp,
        e?.likes,
        e?.texto,
        e?.tipo,
        e?.video,
        e?.foto,
        e?.membresia,
        e?.comentarios
      ]);

  @override
  bool isValidKey(Object? o) => o is NoticiasRecord;
}
