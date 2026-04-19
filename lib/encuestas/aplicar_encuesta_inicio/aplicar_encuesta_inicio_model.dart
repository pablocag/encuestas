import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'aplicar_encuesta_inicio_widget.dart' show AplicarEncuestaInicioWidget;
import 'package:flutter/material.dart';

class AplicarEncuestaInicioModel
    extends FlutterFlowModel<AplicarEncuestaInicioWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextFieldNombre widget.
  FocusNode? textFieldNombreFocusNode;
  TextEditingController? textFieldNombreTextController;
  String? Function(BuildContext, String?)?
      textFieldNombreTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EncuestasRecord? nuevaEncuesta;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldNombreFocusNode?.dispose();
    textFieldNombreTextController?.dispose();
  }
}
