import '/flutter_flow/flutter_flow_util.dart';
import 'mensaje_leido_por_widget.dart' show MensajeLeidoPorWidget;
import 'package:flutter/material.dart';

class MensajeLeidoPorModel extends FlutterFlowModel<MensajeLeidoPorWidget> {
  ///  State fields for stateful widgets in this component.

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
