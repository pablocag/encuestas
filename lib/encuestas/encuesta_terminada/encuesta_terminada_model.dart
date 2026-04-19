import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'encuesta_terminada_widget.dart' show EncuestaTerminadaWidget;
import 'package:flutter/material.dart';

class EncuestaTerminadaModel extends FlutterFlowModel<EncuestaTerminadaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  // State field(s) for Row widget.
  ScrollController? rowController3;
  // State field(s) for Row widget.
  ScrollController? rowController4;

  @override
  void initState(BuildContext context) {
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    rowController3 = ScrollController();
    rowController4 = ScrollController();
  }

  @override
  void dispose() {
    rowController1?.dispose();
    rowController2?.dispose();
    rowController3?.dispose();
    rowController4?.dispose();
  }
}
