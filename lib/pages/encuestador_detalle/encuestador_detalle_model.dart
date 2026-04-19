import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'encuestador_detalle_widget.dart' show EncuestadorDetalleWidget;
import 'package:flutter/material.dart';

class EncuestadorDetalleModel
    extends FlutterFlowModel<EncuestadorDetalleWidget> {
  ///  Local state fields for this page.

  DateTime? now;

  DateTime? ayer;

  DateTime? hace3Dias;

  DateTime? hace1Semana;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
  }
}
