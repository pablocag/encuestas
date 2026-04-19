import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

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

  // "Promotor" field.
  bool? _promotor;
  bool get promotor => _promotor ?? false;
  bool hasPromotor() => _promotor != null;

  // "Nivel" field.
  int? _nivel;
  int get nivel => _nivel ?? 0;
  bool hasNivel() => _nivel != null;

  // "Hijos" field.
  List<DocumentReference>? _hijos;
  List<DocumentReference> get hijos => _hijos ?? const [];
  bool hasHijos() => _hijos != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "Padre" field.
  DocumentReference? _padre;
  DocumentReference? get padre => _padre;
  bool hasPadre() => _padre != null;

  // "root" field.
  bool? _root;
  bool get root => _root ?? false;
  bool hasRoot() => _root != null;

  // "God" field.
  bool? _god;
  bool get god => _god ?? false;
  bool hasGod() => _god != null;

  // "membresia" field.
  DocumentReference? _membresia;
  DocumentReference? get membresia => _membresia;
  bool hasMembresia() => _membresia != null;

  // "tieneMembresia" field.
  bool? _tieneMembresia;
  bool get tieneMembresia => _tieneMembresia ?? false;
  bool hasTieneMembresia() => _tieneMembresia != null;

  // "HijoaPromovidos" field.
  List<DocumentReference>? _hijoaPromovidos;
  List<DocumentReference> get hijoaPromovidos => _hijoaPromovidos ?? const [];
  bool hasHijoaPromovidos() => _hijoaPromovidos != null;

  // "Encuestador" field.
  bool? _encuestador;
  bool get encuestador => _encuestador ?? false;
  bool hasEncuestador() => _encuestador != null;

  // "activo" field.
  bool? _activo;
  bool get activo => _activo ?? false;
  bool hasActivo() => _activo != null;

  // "pinCode" field.
  String? _pinCode;
  String get pinCode => _pinCode ?? '';
  bool hasPinCode() => _pinCode != null;

  // "adminEncuestas" field.
  bool? _adminEncuestas;
  bool get adminEncuestas => _adminEncuestas ?? false;
  bool hasAdminEncuestas() => _adminEncuestas != null;

  // "activoOLD" field.
  bool? _activoOLD;
  bool get activoOLD => _activoOLD ?? false;
  bool hasActivoOLD() => _activoOLD != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _nombres = snapshotData['Nombres'] as String?;
    _apPaterno = snapshotData['ApPaterno'] as String?;
    _apMaterno = snapshotData['ApMaterno'] as String?;
    _fechaNac = snapshotData['Fecha_Nac'] as DateTime?;
    _promotor = snapshotData['Promotor'] as bool?;
    _nivel = castToType<int>(snapshotData['Nivel']);
    _hijos = getDataList(snapshotData['Hijos']);
    _rating = castToType<int>(snapshotData['rating']);
    _padre = snapshotData['Padre'] as DocumentReference?;
    _root = snapshotData['root'] as bool?;
    _god = snapshotData['God'] as bool?;
    _membresia = snapshotData['membresia'] as DocumentReference?;
    _tieneMembresia = snapshotData['tieneMembresia'] as bool?;
    _hijoaPromovidos = getDataList(snapshotData['HijoaPromovidos']);
    _encuestador = snapshotData['Encuestador'] as bool?;
    _activo = snapshotData['activo'] as bool?;
    _pinCode = snapshotData['pinCode'] as String?;
    _adminEncuestas = snapshotData['adminEncuestas'] as bool?;
    _activoOLD = snapshotData['activoOLD'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? nombres,
  String? apPaterno,
  String? apMaterno,
  DateTime? fechaNac,
  bool? promotor,
  int? nivel,
  int? rating,
  DocumentReference? padre,
  bool? root,
  bool? god,
  DocumentReference? membresia,
  bool? tieneMembresia,
  bool? encuestador,
  bool? activo,
  String? pinCode,
  bool? adminEncuestas,
  bool? activoOLD,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Nombres': nombres,
      'ApPaterno': apPaterno,
      'ApMaterno': apMaterno,
      'Fecha_Nac': fechaNac,
      'Promotor': promotor,
      'Nivel': nivel,
      'rating': rating,
      'Padre': padre,
      'root': root,
      'God': god,
      'membresia': membresia,
      'tieneMembresia': tieneMembresia,
      'Encuestador': encuestador,
      'activo': activo,
      'pinCode': pinCode,
      'adminEncuestas': adminEncuestas,
      'activoOLD': activoOLD,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.nombres == e2?.nombres &&
        e1?.apPaterno == e2?.apPaterno &&
        e1?.apMaterno == e2?.apMaterno &&
        e1?.fechaNac == e2?.fechaNac &&
        e1?.promotor == e2?.promotor &&
        e1?.nivel == e2?.nivel &&
        listEquality.equals(e1?.hijos, e2?.hijos) &&
        e1?.rating == e2?.rating &&
        e1?.padre == e2?.padre &&
        e1?.root == e2?.root &&
        e1?.god == e2?.god &&
        e1?.membresia == e2?.membresia &&
        e1?.tieneMembresia == e2?.tieneMembresia &&
        listEquality.equals(e1?.hijoaPromovidos, e2?.hijoaPromovidos) &&
        e1?.encuestador == e2?.encuestador &&
        e1?.activo == e2?.activo &&
        e1?.pinCode == e2?.pinCode &&
        e1?.adminEncuestas == e2?.adminEncuestas &&
        e1?.activoOLD == e2?.activoOLD;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.nombres,
        e?.apPaterno,
        e?.apMaterno,
        e?.fechaNac,
        e?.promotor,
        e?.nivel,
        e?.hijos,
        e?.rating,
        e?.padre,
        e?.root,
        e?.god,
        e?.membresia,
        e?.tieneMembresia,
        e?.hijoaPromovidos,
        e?.encuestador,
        e?.activo,
        e?.pinCode,
        e?.adminEncuestas,
        e?.activoOLD
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
