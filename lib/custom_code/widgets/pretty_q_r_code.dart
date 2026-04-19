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

import 'package:pretty_qr_code/pretty_qr_code.dart';

class PrettyQRCode extends StatefulWidget {
  const PrettyQRCode({
    Key? key,
    this.width,
    this.height,
    this.texto,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? texto;

  @override
  _PrettyQRCodeState createState() => _PrettyQRCodeState();
}

class _PrettyQRCodeState extends State<PrettyQRCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PrettyQr(
        size: 300,
        data: widget.texto!,
        errorCorrectLevel: QrErrorCorrectLevel.H,
        typeNumber: null,
        roundEdges: true,
      ),
    );
  }
}
