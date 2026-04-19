import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? rateRed(int? hijos) {
  if (hijos == null) return 0;
  switch (hijos) {
    case 0:
      return 0;
    case 1:
      return 0.5;
    case 2:
      return 1;
    case 3:
      return 1.5;
    case 4:
      return 2;
    case 5:
      return 2.5;
    case 6:
      return 3;
    case 7:
      return 3.5;
    case 8:
      return 4;
    case 9:
      return 4.5;
    case 10:
      return 5;
    default:
      return 0;
  }
}

DateTime ayer() {
  // retornar el dia de ayer
  final now = DateTime.now();
  final yesterday = now.subtract(Duration(days: 1));
  return DateTime(
      yesterday.year, yesterday.month, yesterday.day, 23, 59, 59, 999);
}

double? calcularEdadValida(DateTime? fechaNac) {
  // calculate the age
  if (fechaNac == null) return null;
  final DateTime now = DateTime.utc(2024, 6, 2);
  final int age = now.year - fechaNac.year;
  if (now.month < fechaNac.month ||
      (now.month == fechaNac.month && now.day < fechaNac.day)) {
    return age - 1;
  }
  return age.toDouble();
}

bool? birthday(DateTime? fechaNac) {
  // calculate if today is birthday
  if (fechaNac == null) return null;
  final DateTime now = DateTime.now();
  return now.month == fechaNac.month && now.day == fechaNac.day;
}

int? diaNacimiento(DateTime? fechaNac) {
  // calculate day of a date
  if (fechaNac == null) return null;
  return fechaNac.day;
}

int? mesNacimiento(DateTime? fechaNac) {
  // calculate month of a date
  // calculate month of a date
  if (fechaNac == null) return null;
  return fechaNac.month;
}

String? firstName(String? nombre) {
  // substr firts name of nombre
  if (nombre == null) return null;
  return nombre.split(' ').first;
}

bool? cumple18(DateTime? fechaNac) {
  // check if shall have 18 years in 6/2/2024
  // calculate if today is birthday
  if (fechaNac == null) return null;
  final DateTime eleccion = DateTime.utc(2024, 6, 2);
  int age = eleccion.year - fechaNac.year;
  if (eleccion.month < fechaNac.month ||
      (eleccion.month == fechaNac.month && eleccion.day < fechaNac.day)) {
    age -= 1;
  }
  if (age >= 18) {
    return true;
  } else {
    return false;
  }
}

String? siguienteLetra(String? letra) {
  // calculate next letter of abecedary
  if (letra == null) return null;
  final String abecedary = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final int index = abecedary.indexOf(letra);
  if (index == -1) {
    return null;
  }
  if (index == abecedary.length - 1) {
    return abecedary[0];
  }
  return abecedary[index + 1];
}

int sumarValoresLista(List<int> lista) {
  // sum list values
  int suma = 0;
  for (int i = 0; i < lista.length; i++) {
    suma += lista[i];
  }
  return suma;
}

DateTime convertirStringaFecha(String? fechaString) {
  // convert string day month year to date
  if (fechaString == null) {
    return DateTime.now();
  }
  List<String> fechaList = fechaString.split('/');
  int day = int.parse(fechaList[0]);
  int month = int.parse(fechaList[1]);
  int year = int.parse(fechaList[2]);
  return DateTime(year, month, day);
}

String? extraeSeccion(String? cadena) {
  // extrae substring de cadena
  bool iniciado = false;
  String resultado = '';
  if (cadena == null) {
    return "";
  }
  for (int i = 0; i < 6; i++) {
    if (!iniciado) {
      if ((cadena[i] == '1') ||
          (cadena[i] == '2') ||
          (cadena[i] == '3') ||
          (cadena[i] == '4') ||
          (cadena[i] == '5') ||
          (cadena[i] == '6') ||
          (cadena[i] == '7') ||
          (cadena[i] == '8') ||
          (cadena[i] == '9')) {
        iniciado = true;
        resultado += cadena[i];
      }
    } else {
      resultado += cadena[i];
    }
  }
  return resultado;
}

bool dateNotToday(DateTime fecha) {
  // date is not today
  DateTime now = DateTime.now();
  return fecha.day != now.day ||
      fecha.month != now.month ||
      fecha.year != now.year;
}

String listToString(List<String> lista) {
  List<String> newList = [];
  for (String item in lista) {
    newList.add("+521$item");
  }
  // convert list into string separated by comma
  return newList.join(',');
}

List<int> crearListaDeRespuestas(ModelosPreguntasEncuestaRecord pregunta) {
  List<int> respuestas = [];

  int maxNumber = pregunta.numRespuestas;
  for (int i = 1; i <= maxNumber; i++) {
    respuestas.add(i);
  }

  return respuestas;
}

List<String> concatenarDosArreglos(
  List<String>? cadena1,
  List<String>? cadena2,
) {
  // concatenar dos strings del mismo index de dos arrays
  List<String> res = [];
  if (cadena1 == null || cadena2 == null) {
    return res;
  }
  int longitud = math.min(cadena1.length, cadena2.length);
  for (int i = 0; i < longitud; i++) {
    res.add('${cadena1[i]}. ${cadena2[i]}');
  }
  return res;
}

String? diferenciaEnMinutos(
  DateTime horaInicio,
  DateTime horaTermino,
) {
  // diferencia en minutos y segundos entre horaInicio y horaTermino
  final diferencia = horaTermino.difference(horaInicio);
  final minutos = diferencia.inMinutes;
  final segundos = diferencia.inSeconds.remainder(60);
  return '$minutos Min. $segundos Seg.';
}

int? fechasHoy(List<DateTime>? fechas) {
  // count how many fechas are today
  if (fechas == null || fechas.isEmpty) {
    return null;
  }
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  int count = 0;
  for (final fecha in fechas) {
    final fechaToday = DateTime(fecha.year, fecha.month, fecha.day);
    if (fechaToday == today) {
      count++;
    }
  }
  return count;
}

bool checkAspectRatio(String imagen) {
  // check aspect ratio of an image
  final List<String> parts = imagen.split('/');
  final String fileName = parts.last;
  final List<String> dimensions = fileName.split('x');
  final double width = double.parse(dimensions[0]);
  final double height = double.parse(dimensions[1]);
  final double aspectRatio = width / height;
  return aspectRatio >= 0.66 && aspectRatio <= 0.67;
}

List<int> crearListaMultirespuestas(
  bool sel1,
  bool sel2,
  bool sel3,
  bool sel4,
  bool sel5,
  bool sel6,
  bool sel7,
  bool sel8,
  bool sel9,
  bool sel10,
  bool sel11,
  bool sel12,
  bool sel13,
  bool sel14,
  bool sel15,
  bool sel16,
  bool sel17,
  bool sel18,
  bool sel19,
  bool sel20,
) {
  // create a int list depend of arguments
  List<int> lista = [];
  if (sel1) lista.add(1);
  if (sel2) lista.add(2);
  if (sel3) lista.add(3);
  if (sel4) lista.add(4);
  if (sel5) lista.add(5);
  if (sel6) lista.add(6);
  if (sel7) lista.add(7);
  if (sel8) lista.add(8);
  if (sel9) lista.add(9);
  if (sel10) lista.add(10);
  if (sel11) lista.add(11);
  if (sel12) lista.add(12);
  if (sel13) lista.add(13);
  if (sel14) lista.add(14);
  if (sel15) lista.add(15);
  if (sel16) lista.add(16);
  if (sel17) lista.add(17);
  if (sel18) lista.add(18);
  if (sel19) lista.add(19);
  if (sel20) lista.add(20);
  return lista;
}

String? textToLink(String? texto) {
  // linkify from text
  if (texto == null || texto.isEmpty) {
    return null;
  }
  final regex = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
  final match = regex.firstMatch(texto);
  if (match == null) {
    return null;
  }
  final link = match.group(0);
  return link;
}

int? extraeEstadodeClaveDeElector(String? claveElector) {
  // extrae substring from claveElector and convert to integer
  if (claveElector == null || claveElector.length < 18) {
    return null;
  }
  final estadoStr = claveElector.substring(12, 14);
  return int.tryParse(estadoStr);
}

DateTime hoy() {
  // retornar el dia de hoy
  return DateTime.now();
}

DateTime haceNDias(int dias) {
  // retornar el dia de ayer
  final now = DateTime.now();
  final hace = now.subtract(Duration(days: dias));
  return DateTime(hace.year, hace.month, hace.day, 23, 59, 59, 999);
}

String stringToUrl(String cadena) {
  // convertir cadena en uri
  return Uri.parse(cadena).toString();
}

String extraeTags(String texto) {
  // extrae todas las substrings que empiecen con #
  final RegExp exp = RegExp(r'\##\w+');
  final Iterable<Match> matches = exp.allMatches(texto);
  final List<String> tags = matches.map((match) => match.group(0)!).toList();

  List<String> tagsLimpios =
      tags.map((cadena) => cadena.replaceAll('##', '')).toList();

  return tagsLimpios.toSet().join(',');
}
