// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:no_screenshot/no_screenshot.dart';

Future<bool> screenShotsOff() async {
  // No soportado en web; evita llamadas nativas innecesarias o errores en runtime.
  if (kIsWeb) {
    return false;
  }
  try {
    final _noScreenshot = NoScreenshot.instance;
    return await _noScreenshot.screenshotOff();
  } catch (_) {
    return false;
  }
}
