import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'aplicar_encuesta_preguntas_widget.dart'
    show AplicarEncuestaPreguntasWidget;
import 'package:flutter/material.dart';

class AplicarEncuestaPreguntasModel
    extends FlutterFlowModel<AplicarEncuestaPreguntasWidget> {
  ///  Local state fields for this page.

  int? seleccion = 0;

  bool? sel1 = false;

  bool sel2 = false;

  bool sel3 = false;

  bool sel4 = false;

  bool sel5 = false;

  bool sel6 = false;

  bool sel7 = false;

  bool sel8 = false;

  bool sel9 = false;

  bool sel10 = false;

  bool sel11 = false;

  bool sel12 = false;

  bool sel13 = false;

  bool sel14 = false;

  bool sel15 = false;

  bool sel16 = false;

  bool sel17 = false;

  bool sel18 = false;

  bool sel19 = false;

  bool sel20 = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  RespuestasEncuestasRecord? eliminarRespuesta;
  // State field(s) for ColumnPrincipal widget.
  ScrollController? columnPrincipalScrollController1;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for ColumnPrincipal widget.
  ScrollController? columnPrincipalScrollController2;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for ColumnUnica widget.
  ScrollController? columnUnicaScrollController;
  // State field(s) for ColumnMultiple widget.
  ScrollController? columnMultipleScrollController;
  // State field(s) for ColumnUnicaConImagenes widget.
  ScrollController? columnUnicaConImagenesScrollController;
  // State field(s) for ColumnMultipleConImagenes widget.
  ScrollController? columnMultipleConImagenesScrollController;
  // State field(s) for ColumnTexto widget.
  ScrollController? columnTextoScrollController;
  // State field(s) for TextFieldRespuestaTexto widget.
  FocusNode? textFieldRespuestaTextoFocusNode;
  TextEditingController? textFieldRespuestaTextoTextController;
  String? Function(BuildContext, String?)?
      textFieldRespuestaTextoTextControllerValidator;
  // State field(s) for ColumnNumero widget.
  ScrollController? columnNumeroScrollController;
  // State field(s) for TextFieldRespuestaNumerica widget.
  FocusNode? textFieldRespuestaNumericaFocusNode;
  TextEditingController? textFieldRespuestaNumericaTextController;
  String? Function(BuildContext, String?)?
      textFieldRespuestaNumericaTextControllerValidator;
  // State field(s) for ColumnRango widget.
  ScrollController? columnRangoScrollController;
  // State field(s) for DropDownRango widget.
  int? dropDownRangoValue;
  FormFieldController<int>? dropDownRangoValueController;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  MembresiasRecord? membresiaEncuesta;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RespuestasEncuestasRecord? nuevaRespuestaM;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RespuestasEncuestasRecord? editarRespuestaM;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ModelosPreguntasEncuestaRecord>? preguntasSinDependeDeM;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RespuestasEncuestasRecord? nuevaRespuestaTexto;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RespuestasEncuestasRecord? editarRespuestaTexto;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RespuestasEncuestasRecord? nuevaRespuestaNumero;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RespuestasEncuestasRecord? editarRespuestaNumero;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RespuestasEncuestasRecord? nuevaRespuestaRango;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RespuestasEncuestasRecord? editarRespuestaRango;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RespuestasEncuestasRecord? nuevaRespuesta;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RespuestasEncuestasRecord? editarRespuesta;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? siguientePreguntaDependeR;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? siguientePreguntaDepende;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ModelosPreguntasEncuestaRecord>? preguntasSinDependeDe;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? siguientePreguntaDependeX;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? siguientePreguntaDependeZ;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ModelosPreguntasEncuestaRecord>? preguntasSinDependeDeZ;

  @override
  void initState(BuildContext context) {
    columnPrincipalScrollController1 = ScrollController();
    columnController1 = ScrollController();
    columnPrincipalScrollController2 = ScrollController();
    columnController2 = ScrollController();
    columnUnicaScrollController = ScrollController();
    columnMultipleScrollController = ScrollController();
    columnUnicaConImagenesScrollController = ScrollController();
    columnMultipleConImagenesScrollController = ScrollController();
    columnTextoScrollController = ScrollController();
    columnNumeroScrollController = ScrollController();
    columnRangoScrollController = ScrollController();
  }

  @override
  void dispose() {
    columnPrincipalScrollController1?.dispose();
    columnController1?.dispose();
    columnPrincipalScrollController2?.dispose();
    columnController2?.dispose();
    columnUnicaScrollController?.dispose();
    columnMultipleScrollController?.dispose();
    columnUnicaConImagenesScrollController?.dispose();
    columnMultipleConImagenesScrollController?.dispose();
    columnTextoScrollController?.dispose();
    textFieldRespuestaTextoFocusNode?.dispose();
    textFieldRespuestaTextoTextController?.dispose();

    columnNumeroScrollController?.dispose();
    textFieldRespuestaNumericaFocusNode?.dispose();
    textFieldRespuestaNumericaTextController?.dispose();

    columnRangoScrollController?.dispose();
  }
}
