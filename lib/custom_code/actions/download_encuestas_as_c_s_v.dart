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

import 'dart:convert' show utf8;
import 'package:download/download.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cross_file/cross_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

Future downloadEncuestasAsCSV(
  String tituloModelo,
  List<EncuestasRecord>? encuestas,
  List<RespuestasEncuestasRecord>? respuestas,
  List<ModelosPreguntasEncuestaRecord>? preguntas,
) async {
  // Add your function code here!

  encuestas = encuestas ?? [];
  respuestas = respuestas ?? [];
  preguntas = (preguntas ?? {}) as List<ModelosPreguntasEncuestaRecord>?;

  String csvFilePath;
  String fileContent =
      "ID Encuesta,Fecha,GPS Latitud,GPS Longitud,Pregunta,Respuesta 1,Respuesta 2,Respuesta 3,Respuesta 4,Respuesta 5,Respuesta 6,Respuesta 7,Respuesta 8,Respuesta 9,Respuesta 10,Respuesta 11,Respuesta 12,Respuesta 13,Respuesta 14,Respuesta 15,Respuesta 16,Respuesta 17,Respuesta 18,Respuesta 19,Respuesta 20,Respuesta Texto,Respuesta Numero,Encuestador";

  for (final encuesta in encuestas) {
    UsersRecord encuestador =
        await UsersRecord.getDocumentOnce(encuesta.usuario!);
    for (final respuesta in respuestas) {
      if (respuesta.encuesta == encuesta.reference) {
        final preguntaModelo = preguntas!.firstWhere((preguntaModelo) =>
            preguntaModelo.reference.id == respuesta.pregunta!.id);

        fileContent = fileContent +
            "\n" +
            encuesta.reference.id.toString() +
            "," +
            encuesta.fechaCreacion.toString() +
            "," +
            encuesta.posicionGPS!.latitude.toString() +
            "," +
            encuesta.posicionGPS!.longitude.toString() +
            "," +
            preguntaModelo.numero.toString() +
            "," +
            (respuesta.respuesta1 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta2 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta3 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta4 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta5 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta6 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta7 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta8 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta9 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta10 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta11 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta12 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta13 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta14 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta15 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta16 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta17 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta18 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta19 ? 1 : 0).toString() +
            "," +
            (respuesta.respuesta20 ? 1 : 0).toString() +
            "," +
            respuesta.respuestaTexto.toString() +
            "," +
            respuesta.respuestaNumero.toString() +
            "," +
            encuestador.nombres.toString() +
            " " +
            encuestador.apPaterno.toString() +
            " " +
            encuestador.apMaterno.toString();
      }
    }
  }

  String fileName = 'PROMETHEUS ENCUESTAS $tituloModelo.csv';
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
