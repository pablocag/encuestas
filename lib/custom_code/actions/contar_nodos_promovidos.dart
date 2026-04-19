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

Future<int> contarNodosPromovidos(DocumentReference usuario) async {
  // Add your function code here!
  int count = 0;
  var user = await usuario.get();
  var usuarioData = user.data() as Map<String, dynamic>;
  if ((usuarioData['HijoaPromovidos'] != null) &&
      (usuarioData['HijoaPromovidos'].length > 0)) {
    count += usuarioData['HijoaPromovidos'].length as int;
  }

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('Padre', isEqualTo: usuario)
      .get();
  List<DocumentSnapshot> children = snapshot.docs;
  for (DocumentSnapshot child in children) {
    count += await contarNodosPromovidos(child.reference);
  }
  return count;
}
