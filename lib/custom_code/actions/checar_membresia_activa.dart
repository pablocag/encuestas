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

Future<bool> checarMembresiaActiva(DocumentReference membresia) async {
  // Add your function code here!
  DocumentSnapshot document = await membresia.get();
  bool activa = false;
  final data = document.data()! as Map?;
  if (document.exists) {
    activa = data!['activa'];
    return activa;
  } else {
    return false;
  }
}
