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

Future<List<DocumentReference>> godListaPromotoresRed(
  DocumentReference usuario,
  DocumentReference membresia,
) async {
  // Add your function code here!
  List<DocumentReference> red = [];
  red.add(usuario);
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('Padre', isEqualTo: usuario)
      .where('membresia', isEqualTo: membresia)
      .get();
  List<DocumentSnapshot> children = snapshot.docs;
  for (DocumentSnapshot child in children) {
    red += await godListaPromotoresRed(child.reference, membresia);
  }
  ;
  return red;
}
