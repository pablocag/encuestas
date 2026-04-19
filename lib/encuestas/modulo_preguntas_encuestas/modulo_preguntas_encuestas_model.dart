import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'modulo_preguntas_encuestas_widget.dart'
    show ModuloPreguntasEncuestasWidget;
import 'package:flutter/material.dart';

class ModuloPreguntasEncuestasModel
    extends FlutterFlowModel<ModuloPreguntasEncuestasWidget> {
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
