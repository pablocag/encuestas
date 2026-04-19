import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'modelo_preguntas_encuesta_widget.dart'
    show ModeloPreguntasEncuestaWidget;
import 'package:flutter/material.dart';

class ModeloPreguntasEncuestaModel
    extends FlutterFlowModel<ModeloPreguntasEncuestaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  int? estaEncuestaUsadaI;
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  int? otrasRespuestas;
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  int? hayEncuestas;

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
