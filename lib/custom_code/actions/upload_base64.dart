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

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime_type/mime_type.dart';

Future<String> uploadBase64(
  String stringImage,
  String curp,
  String tipo,
  String membresiaID,
) async {
  // Add your function code here!
  //Tipos: FRENTE,TRASERO,ROSTRO,FIRMA
  String now = DateTime.now().toString();
  try {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("ines/$membresiaID/$curp $tipo $now.png");

    try {
      await storageRef.putString(stringImage,
          format: PutStringFormat.base64,
          metadata: SettableMetadata(contentType: "image/jpeg"));
    } catch (e) {
      return "";
    }
    final url = await storageRef.getDownloadURL();
    return url;
  } catch (e) {
    return "";
  }
}
