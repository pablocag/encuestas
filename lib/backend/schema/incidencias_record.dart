import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IncidenciasRecord extends FirestoreRecord {
  IncidenciasRecord._(
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

  // "Destinatarios" field.
  List<DocumentReference>? _destinatarios;
  List<DocumentReference> get destinatarios => _destinatarios ?? const [];
  bool hasDestinatarios() => _destinatarios != null;

  // "membresia" field.
  DocumentReference? _membresia;
  DocumentReference? get membresia => _membresia;
  bool hasMembresia() => _membresia != null;

  // "esNoticia" field.
  bool? _esNoticia;
  bool get esNoticia => _esNoticia ?? false;
  bool hasEsNoticia() => _esNoticia != null;

  // "noticia" field.
  DocumentReference? _noticia;
  DocumentReference? get noticia => _noticia;
  bool hasNoticia() => _noticia != null;

  void _initializeFields() {
    _enviadoPor = snapshotData['enviadoPor'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _texto = snapshotData['Texto'] as String?;
    _tipo = snapshotData['Tipo'] as String?;
    _video = snapshotData['Video'] as String?;
    _foto = snapshotData['Foto'] as String?;
    _destinatarios = getDataList(snapshotData['Destinatarios']);
    _membresia = snapshotData['membresia'] as DocumentReference?;
    _esNoticia = snapshotData['esNoticia'] as bool?;
    _noticia = snapshotData['noticia'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('incidencias');

  static Stream<IncidenciasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IncidenciasRecord.fromSnapshot(s));

  static Future<IncidenciasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IncidenciasRecord.fromSnapshot(s));

  static IncidenciasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IncidenciasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IncidenciasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IncidenciasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IncidenciasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IncidenciasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIncidenciasRecordData({
  DocumentReference? enviadoPor,
  DateTime? timestamp,
  String? texto,
  String? tipo,
  String? video,
  String? foto,
  DocumentReference? membresia,
  bool? esNoticia,
  DocumentReference? noticia,
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
      'esNoticia': esNoticia,
      'noticia': noticia,
    }.withoutNulls,
  );

  return firestoreData;
}

class IncidenciasRecordDocumentEquality implements Equality<IncidenciasRecord> {
  const IncidenciasRecordDocumentEquality();

  @override
  bool equals(IncidenciasRecord? e1, IncidenciasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.enviadoPor == e2?.enviadoPor &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.texto == e2?.texto &&
        e1?.tipo == e2?.tipo &&
        e1?.video == e2?.video &&
        e1?.foto == e2?.foto &&
        listEquality.equals(e1?.destinatarios, e2?.destinatarios) &&
        e1?.membresia == e2?.membresia &&
        e1?.esNoticia == e2?.esNoticia &&
        e1?.noticia == e2?.noticia;
  }

  @override
  int hash(IncidenciasRecord? e) => const ListEquality().hash([
        e?.enviadoPor,
        e?.timestamp,
        e?.likes,
        e?.texto,
        e?.tipo,
        e?.video,
        e?.foto,
        e?.destinatarios,
        e?.membresia,
        e?.esNoticia,
        e?.noticia
      ]);

  @override
  bool isValidKey(Object? o) => o is IncidenciasRecord;
}
