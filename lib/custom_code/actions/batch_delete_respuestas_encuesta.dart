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

//import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> batchDeleteRespuestasEncuesta(
    List<DocumentReference> listaRefRespuestas) async {
  // Create a batch object
  WriteBatch batch = FirebaseFirestore.instance.batch();

  // Loop through the list of document references and delete each document
  for (DocumentReference ref in listaRefRespuestas) {
    //  String url = await ref.get().then((doc) => doc.data()['imagen1']);
    //  if (url != null) {
    //      await FirebaseStorage.instance.refFromURL(url).delete();
    //  }
    batch.delete(ref);
  }
  await batch.commit();
}
