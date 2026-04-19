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

Future<int> updateHijosPromovidosPadre(
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

  if ((usuarioData['HijoaPromovidos'] != null) &&
      (usuarioData['HijoaPromovidos'].length > 0)) {
    final padreHijosP = padreData['HijoaPromovidos'] as List<dynamic>;
    final usuarioHijosP = usuarioData['HijoaPromovidos'] as List<dynamic>;

    var promovidosPadre = [...padreHijosP, ...usuarioHijosP].toSet().toList();

    registros += usuarioHijosP.length;

    await padreRef.update({'HijoaPromovidos': promovidosPadre});
  }
  return registros;
}
