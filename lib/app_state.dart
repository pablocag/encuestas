import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
    });
    await _safeInitAsync(() async {
      _pwd = await secureStorage.getString('ff_pwd') ?? _pwd;
    });
    await _safeInitAsync(() async {
      _version = await secureStorage.getInt('ff_version') ?? _version;
    });
    await _safeInitAsync(() async {
      _fechaCreacionUsuario =
          await secureStorage.read(key: 'ff_fechaCreacionUsuario') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_fechaCreacionUsuario'))!)
              : _fechaCreacionUsuario;
    });
    await _safeInitAsync(() async {
      _cuentas = await secureStorage.getStringList('ff_cuentas') ?? _cuentas;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    secureStorage.setString('ff_email', value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  double _totalRed = 0.0;
  double get totalRed => _totalRed;
  set totalRed(double value) {
    _totalRed = value;
  }

  String _pwd = '';
  String get pwd => _pwd;
  set pwd(String value) {
    _pwd = value;
    secureStorage.setString('ff_pwd', value);
  }

  void deletePwd() {
    secureStorage.delete(key: 'ff_pwd');
  }

  int _version = 10;
  int get version => _version;
  set version(int value) {
    _version = value;
    secureStorage.setInt('ff_version', value);
  }

  void deleteVersion() {
    secureStorage.delete(key: 'ff_version');
  }

  DateTime? _fechaCreacionUsuario =
      DateTime.fromMillisecondsSinceEpoch(1672596000000);
  DateTime? get fechaCreacionUsuario => _fechaCreacionUsuario;
  set fechaCreacionUsuario(DateTime? value) {
    _fechaCreacionUsuario = value;
    value != null
        ? secureStorage.setInt(
            'ff_fechaCreacionUsuario', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_fechaCreacionUsuario');
  }

  void deleteFechaCreacionUsuario() {
    secureStorage.delete(key: 'ff_fechaCreacionUsuario');
  }

  List<String> _cuentas = [];
  List<String> get cuentas => _cuentas;
  set cuentas(List<String> value) {
    _cuentas = value;
    secureStorage.setStringList('ff_cuentas', value);
  }

  void deleteCuentas() {
    secureStorage.delete(key: 'ff_cuentas');
  }

  void addToCuentas(String value) {
    cuentas.add(value);
    secureStorage.setStringList('ff_cuentas', _cuentas);
  }

  void removeFromCuentas(String value) {
    cuentas.remove(value);
    secureStorage.setStringList('ff_cuentas', _cuentas);
  }

  void removeAtIndexFromCuentas(int index) {
    cuentas.removeAt(index);
    secureStorage.setStringList('ff_cuentas', _cuentas);
  }

  void updateCuentasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cuentas[index] = updateFn(_cuentas[index]);
    secureStorage.setStringList('ff_cuentas', _cuentas);
  }

  void insertAtIndexInCuentas(int index, String value) {
    cuentas.insert(index, value);
    secureStorage.setStringList('ff_cuentas', _cuentas);
  }

  final _encuestasManager = StreamRequestManager<List<EncuestasRecord>>();
  Stream<List<EncuestasRecord>> encuestas({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EncuestasRecord>> Function() requestFn,
  }) =>
      _encuestasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEncuestasCache() => _encuestasManager.clear();
  void clearEncuestasCacheKey(String? uniqueKey) =>
      _encuestasManager.clearRequest(uniqueKey);

  final _membresiaLogoManager = StreamRequestManager<MembresiasRecord>();
  Stream<MembresiasRecord> membresiaLogo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<MembresiasRecord> Function() requestFn,
  }) =>
      _membresiaLogoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMembresiaLogoCache() => _membresiaLogoManager.clear();
  void clearMembresiaLogoCacheKey(String? uniqueKey) =>
      _membresiaLogoManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
