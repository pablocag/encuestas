import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'aplicar_encuesta_widget.dart' show AplicarEncuestaWidget;
import 'package:flutter/material.dart';

class AplicarEncuestaModel extends FlutterFlowModel<AplicarEncuestaWidget> {
  ///  Local state fields for this page.

  bool encuestasVisibles = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ColumnEncuestas widget.
  ScrollController? columnEncuestasScrollController;
  // Stores action output result for [Backend Call - Read Document] action in ListTile widget.
  MembresiasRecord? encuestasRestantes;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    columnEncuestasScrollController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    columnEncuestasScrollController?.dispose();
  }
}
