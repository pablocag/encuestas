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

Future<int> updateHijosPromotores(
  DocumentReference padreRef,
  List<DocumentReference>? usuarioHijosPromotores,
) async {
  // Add your function code here!
  int registros = 0;
  for (var element in usuarioHijosPromotores ?? []) {
    registros += 1;
    var docRef = FirebaseFirestore.instance.collection('users').doc(element.id);
    docRef.update({'Padre': padreRef});
  }
  ;
  return registros;
}
