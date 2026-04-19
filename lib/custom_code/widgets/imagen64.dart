// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

class Imagen64 extends StatefulWidget {
  const Imagen64({
    Key? key,
    this.width,
    this.height,
    required this.imagenStr,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imagenStr;

  @override
  _Imagen64State createState() => _Imagen64State();
}

class _Imagen64State extends State<Imagen64> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.memory(
        Base64Decoder().convert(widget.imagenStr),
        height: 180,
        width: 350,
      ),
    );
  }
}
