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

Future<int> updateHijosPromotoresPadre(
  DocumentReference userRef,
  DocumentReference padreRef,
) async {
  // Add your function code here!
  //cambiar de padre
  int registros = 0;
  final usuario = await userRef.get();
  final padre = await padreRef.get();
  final usuarioData = usuario.data() as Map<String, dynamic>;
  final padreData = padre.data() as Map<String, dynamic>;

  if ((usuarioData['Hijos'] != null) && (usuarioData['Hijos'].length > 0)) {
    final padreHijosU = padreData['Hijos'] as List<dynamic>;
    final usuarioHijosU = usuarioData['Hijos'] as List<dynamic>;

    var usuariosPadre = [...padreHijosU, ...usuarioHijosU].toSet().toList();

    registros += usuarioHijosU.length;

    await padreRef.update({'Hijos': usuariosPadre});
  }

  return registros;
}
