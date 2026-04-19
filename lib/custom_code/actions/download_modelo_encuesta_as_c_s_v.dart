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

import 'package:flutter/foundation.dart';

import 'dart:io';

import 'dart:convert' show utf8;
import 'package:cross_file/cross_file.dart';
import 'package:download/download.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future downloadModeloEncuestaAsCSV(
  String tituloModelo,
  List<ModelosPreguntasEncuestaRecord>? preguntas,
) async {
  preguntas = preguntas ?? [];

  String csvFilePath;
  String fileContent =
      "Numero,Pregunta,Respuesta 1,Respuesta 2,Respuesta 3,Respuesta 4,Respuesta 5,Respuesta 6,Respuesta 7,Respuesta 8,Respuesta 9,Respuesta 10";

  preguntas.asMap().forEach((index, record) => fileContent = fileContent +
      "\n" +
      record.numero.toString() +
      "," +
      record.pregunta.toString() +
      "," +
      record.respuesta1.toString() +
      "," +
      record.respuesta2.toString() +
      "," +
      record.respuesta3.toString() +
      "," +
      record.respuesta4.toString() +
      "," +
      record.respuesta5.toString() +
      "," +
      record.respuesta6.toString() +
      "," +
      record.respuesta7.toString() +
      "," +
      record.respuesta8.toString() +
      "," +
      record.respuesta9.toString() +
      "," +
      record.respuesta10.toString());

  String fileName = 'PROMETHEUS MODELO $tituloModelo.csv';
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);

  if (kIsWeb) {
    return download(stream, fileName);
  } else {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');

    final sink = file.openWrite();
    sink.write(fileContent);
    await sink.close();

    csvFilePath = file.path;

    await Share.shareXFiles(
      [XFile(csvFilePath)],
      subject: 'Archivo CSV',
      text: 'Adjunto se encuentra el Formato CSV',
    );
  }
}
