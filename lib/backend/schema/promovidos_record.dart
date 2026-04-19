import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromovidosRecord extends FirestoreRecord {
  PromovidosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombres" field.
  String? _nombres;
  String get nombres => _nombres ?? '';
  bool hasNombres() => _nombres != null;

  // "ApPaterno" field.
  String? _apPaterno;
  String get apPaterno => _apPaterno ?? '';
  bool hasApPaterno() => _apPaterno != null;

  // "ApMaterno" field.
  String? _apMaterno;
  String get apMaterno => _apMaterno ?? '';
  bool hasApMaterno() => _apMaterno != null;

  // "Fecha_Nac" field.
  DateTime? _fechaNac;
  DateTime? get fechaNac => _fechaNac;
  bool hasFechaNac() => _fechaNac != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Padre" field.
  DocumentReference? _padre;
  DocumentReference? get padre => _padre;
  bool hasPadre() => _padre != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "nivel" field.
  int? _nivel;
  int get nivel => _nivel ?? 0;
  bool hasNivel() => _nivel != null;

  // "Promotor" field.
  bool? _promotor;
  bool get promotor => _promotor ?? false;
  bool hasPromotor() => _promotor != null;

  // "membresia" field.
  DocumentReference? _membresia;
  DocumentReference? get membresia => _membresia;
  bool hasMembresia() => _membresia != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "dia_Nac" field.
  int? _diaNac;
  int get diaNac => _diaNac ?? 0;
  bool hasDiaNac() => _diaNac != null;

  // "mes_Nac" field.
  int? _mesNac;
  int get mesNac => _mesNac ?? 0;
  bool hasMesNac() => _mesNac != null;

  // "obs" field.
  String? _obs;
  String get obs => _obs ?? '';
  bool hasObs() => _obs != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "gps" field.
  LatLng? _gps;
  LatLng? get gps => _gps;
  bool hasGps() => _gps != null;

  void _initializeFields() {
    _nombres = snapshotData['Nombres'] as String?;
    _apPaterno = snapshotData['ApPaterno'] as String?;
    _apMaterno = snapshotData['ApMaterno'] as String?;
    _fechaNac = snapshotData['Fecha_Nac'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _padre = snapshotData['Padre'] as DocumentReference?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _nivel = castToType<int>(snapshotData['nivel']);
    _promotor = snapshotData['Promotor'] as bool?;
    _membresia = snapshotData['membresia'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _diaNac = castToType<int>(snapshotData['dia_Nac']);
    _mesNac = castToType<int>(snapshotData['mes_Nac']);
    _obs = snapshotData['obs'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _gps = snapshotData['gps'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Promovidos');

  static Stream<PromovidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromovidosRecord.fromSnapshot(s));

  static Future<PromovidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromovidosRecord.fromSnapshot(s));

  static PromovidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromovidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromovidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromovidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromovidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromovidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromovidosRecordData({
  String? nombres,
  String? apPaterno,
  String? apMaterno,
  DateTime? fechaNac,
  String? email,
  DocumentReference? padre,
  String? phoneNumber,
  DocumentReference? userRef,
  int? nivel,
  bool? promotor,
  DocumentReference? membresia,
  String? photoUrl,
  int? diaNac,
  int? mesNac,
  String? obs,
  DateTime? fecha,
  LatLng? gps,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombres': nombres,
      'ApPaterno': apPaterno,
      'ApMaterno': apMaterno,
      'Fecha_Nac': fechaNac,
      'email': email,
      'Padre': padre,
      'phone_number': phoneNumber,
      'userRef': userRef,
      'nivel': nivel,
      'Promotor': promotor,
      'membresia': membresia,
      'photo_url': photoUrl,
      'dia_Nac': diaNac,
      'mes_Nac': mesNac,
      'obs': obs,
      'fecha': fecha,
      'gps': gps,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromovidosRecordDocumentEquality implements Equality<PromovidosRecord> {
  const PromovidosRecordDocumentEquality();

  @override
  bool equals(PromovidosRecord? e1, PromovidosRecord? e2) {
    return e1?.nombres == e2?.nombres &&
        e1?.apPaterno == e2?.apPaterno &&
        e1?.apMaterno == e2?.apMaterno &&
        e1?.fechaNac == e2?.fechaNac &&
        e1?.email == e2?.email &&
        e1?.padre == e2?.padre &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userRef == e2?.userRef &&
        e1?.nivel == e2?.nivel &&
        e1?.promotor == e2?.promotor &&
        e1?.membresia == e2?.membresia &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.diaNac == e2?.diaNac &&
        e1?.mesNac == e2?.mesNac &&
        e1?.obs == e2?.obs &&
        e1?.fecha == e2?.fecha &&
        e1?.gps == e2?.gps;
  }

  @override
  int hash(PromovidosRecord? e) => const ListEquality().hash([
        e?.nombres,
        e?.apPaterno,
        e?.apMaterno,
        e?.fechaNac,
        e?.email,
        e?.padre,
        e?.phoneNumber,
        e?.userRef,
        e?.nivel,
        e?.promotor,
        e?.membresia,
        e?.photoUrl,
        e?.diaNac,
        e?.mesNac,
        e?.obs,
        e?.fecha,
        e?.gps
      ]);

  @override
  bool isValidKey(Object? o) => o is PromovidosRecord;
}
