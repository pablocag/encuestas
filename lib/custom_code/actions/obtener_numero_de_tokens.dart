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

Future<int> obtenerNumeroDeTokens(String userID) async {
  // Add your function code here!
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(userID)
      .collection('fcm_tokens')
      .get();

  return snapshot.size; // Devuelve el número de documentos en la consulta
}
