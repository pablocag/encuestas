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

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

Future batchCloneModeloRespuestas(
  DocumentReference refNuevoModelo,
  DocumentReference refViejoModelo,
) async {
  final QuerySnapshot modelos = await FirebaseFirestore.instance
      .collection('modelosPreguntasEncuesta')
      .where('modeloEncuesta', isEqualTo: refViejoModelo)
      .get();

  final List<DocumentSnapshot> documentos = modelos.docs;

  documentos.forEach((modeloRespuesta) async {
    DocumentReference newDocRef = await FirebaseFirestore.instance
        .collection('modelosPreguntasEncuesta')
        .doc();

    Map<String, dynamic> data = modeloRespuesta.data() as Map<String, dynamic>;

    data.remove('id');
    data['modeloEncuesta'] = refNuevoModelo;
    await newDocRef.set(data);
  });
}
