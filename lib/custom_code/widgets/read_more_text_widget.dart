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

import 'package:readmore/readmore.dart';

class ReadMoreTextWidget extends StatefulWidget {
  const ReadMoreTextWidget({
    Key? key,
    this.width,
    this.height,
    required this.texto,
    required this.trimL,
    required this.colorTexto,
    required this.colorClick,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String texto;
  final int trimL;
  final Color colorTexto;
  final Color colorClick;

  @override
  _ReadMoreTextWidgetState createState() => _ReadMoreTextWidgetState();
}

class _ReadMoreTextWidgetState extends State<ReadMoreTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReadMoreText(
        widget.texto,
        trimLines: widget.trimL,
        style: TextStyle(color: widget.colorTexto),
        colorClickableText: widget.colorClick,
        trimMode: TrimMode.Line,
        trimCollapsedText: '...Mostrar más',
        trimExpandedText: ' Mostrar menos',
      ),
    );
  }
}
