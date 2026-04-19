import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Registro centralizado con niveles. En **release**, [d] no emite nada;
/// [w] y [e] usan `dart:developer` (visible en DevTools / logs del sistema).
///
/// Para **Crashlytics**, valorar `firebase_crashlytics` y llamar a
/// `FirebaseCrashlytics.instance.recordError` desde [e] cuando exista dependencia.
abstract final class AppLog {
  static const String _name = 'EncuestasPrometheus';

  /// Debug: solo en modo debug (no ruido en producción).
  static void d(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(message, name: _name, error: error, stackTrace: stackTrace);
    }
  }

  /// Advertencia (siempre registrada vía developer).
  static void w(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(
      message,
      name: _name,
      level: 900,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Error (siempre registrada vía developer).
  static void e(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(
      message,
      name: _name,
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
