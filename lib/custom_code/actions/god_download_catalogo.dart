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
import 'dart:io';

Future godDownloadCatalogo(String coleccion) async {
  // Add your function code here!
  if (coleccion == 'INE') {
    String fileContent = "Descripcion,INE,Precio,PrecioStripe";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('paqueteINE').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['Descripcion'].toString() +
          "," +
          dato['INE'].toString() +
          "," +
          dato['Precio'].toString() +
          "," +
          dato['PrecioStripe'].toString();
    });
    String fileName = 'catalogoINE.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //INE
  if (coleccion == 'SMS') {
    String fileContent = "Descripcion,Precio,PrecioStripe,sms";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('paqueteSMS').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['Descripcion'].toString() +
          "," +
          dato['Precio'].toString() +
          "," +
          dato['PrecioStripe'].toString() +
          "," +
          dato['sms'].toString();
    });
    String fileName = 'catalogoSMS.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //SMS
  if (coleccion == 'ENCUESTAS') {
    String fileContent = "Descripcion,Precio,PrecioStripe,encuestas";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('paqueteEncuestas').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['Descripcion'].toString() +
          "," +
          dato['Precio'].toString() +
          "," +
          dato['PrecioStripe'].toString() +
          "," +
          dato['encuestas'].toString();
    });
    String fileName = 'catalogoENCUESTAS.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //ENCUESTAS
  if (coleccion == 'ESTADOS') {
    String fileContent = "ContieneSecciones, Descripcion, Estado";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('Estados').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['ContieneSecciones'].toString() +
          "," +
          dato['Descripcion'].toString() +
          "," +
          dato['Estado'].toString();
    });
    String fileName = 'catalogoESTADOS.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //ESTADOS
  if (coleccion == 'MUNICIPIOS') {
    String fileContent = "estado, municipio, nombre_Municipio";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('municipios').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['estado'].toString() +
          "," +
          dato['municipio'].toString() +
          "," +
          dato['nombre_Municipio'].toString();
    });
    String fileName = 'catalogoMUNICIPIOS.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //MUNICIPIOS
  if (coleccion == 'SECCIONES') {
    String fileContent =
        "Distrito_Federal,Distrito_Local,Entidad,Localidad,Municipio,Nombre_Entidad,Nombre_Municipio,Seccion,Tipo";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('Secciones').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['Distrito_Federal'].toString() +
          "," +
          dato['Distrito_Local'].toString() +
          "," +
          dato['Entidad'].toString() +
          "," +
          dato['Localidad'].toString() +
          "," +
          dato['Municipio'].toString() +
          "," +
          dato['Nombre_Entidad'].toString() +
          "," +
          dato['Nombre_Municipio'].toString() +
          "," +
          dato['Seccion'].toString() +
          "," +
          dato['Tipo'].toString();
    });
    String fileName = 'catalogoSECCIONES.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //SECCIONES
  if (coleccion == 'CONFIG') {
    String fileContent =
        "blinkIDAndroidLicense,blinkIDIOSLicense,guiaRapida,urlAndroid,urlHUAWEI,urlIOS";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('config').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['blinkIDAndroidLicense'].toString() +
          "," +
          dato['blinkIDIOSLicense'].toString() +
          "," +
          dato['guiaRapida'].toString() +
          "," +
          dato['urlAndroid'].toString() +
          "," +
          dato['urlHUAWEI'].toString() +
          "," +
          dato['urlIOS'].toString();
    });
    String fileName = 'CONFIG.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //CONFIG
  if (coleccion == 'TARJETAS') {
    String fileContent = "imagen";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('tarjetas').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent + "\n" + dato['imagen'].toString();
    });
    String fileName = 'TARJETAS.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //TARJETAS
  if (coleccion == 'TEXTOS') {
    String fileContent = "texto,titulo";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('textos').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['texto'].toString() +
          "," +
          dato['titulo'].toString();
    });
    String fileName = 'TEXTOS.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //TEXTOS
  if (coleccion == 'CASILLAS') {
    String fileContent = "nombreCorto,nombreLargo";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('tipoCasilla').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['nombreCorto'].toString() +
          "," +
          dato['nombreLargo'].toString();
    });
    String fileName = 'TIPOCASILLA.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //CASILLAS
  if (coleccion == 'INCIDENCIAS') {
    String fileContent = "descripcion,tipo";
    final QuerySnapshot catalogo =
        await FirebaseFirestore.instance.collection('tiposIncidencias').get();
    final List<DocumentSnapshot> documentos = catalogo.docs;
    documentos.forEach((registro) async {
      Map<String, dynamic> dato = registro.data() as Map<String, dynamic>;
      fileContent = fileContent +
          "\n" +
          dato['descripcion'].toString() +
          "," +
          dato['tipo'].toString();
    });
    String fileName = 'TIPOSINCIDENCIAS.csv';
    var bytes = utf8.encode(fileContent);
    final stream = Stream.fromIterable(bytes);

    if (kIsWeb) {
      return download(stream, fileName);
    }
  } //CASILLAS
}
