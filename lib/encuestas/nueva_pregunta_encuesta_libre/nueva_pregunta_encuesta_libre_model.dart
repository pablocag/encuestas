import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_pregunta_encuesta_libre_widget.dart'
    show NuevaPreguntaEncuestaLibreWidget;
import 'package:flutter/material.dart';

class NuevaPreguntaEncuestaLibreModel
    extends FlutterFlowModel<NuevaPreguntaEncuestaLibreWidget> {
  ///  Local state fields for this page.

  List<int> listaRespuestas = [];
  void addToListaRespuestas(int item) => listaRespuestas.add(item);
  void removeFromListaRespuestas(int item) => listaRespuestas.remove(item);
  void removeAtIndexFromListaRespuestas(int index) =>
      listaRespuestas.removeAt(index);
  void insertAtIndexInListaRespuestas(int index, int item) =>
      listaRespuestas.insert(index, item);
  void updateListaRespuestasAtIndex(int index, Function(int) updateFn) =>
      listaRespuestas[index] = updateFn(listaRespuestas[index]);

  bool dependePregunta = false;

  bool dependeFlujo = false;

  List<FFUploadedFile> listaImagenes = [];
  void addToListaImagenes(FFUploadedFile item) => listaImagenes.add(item);
  void removeFromListaImagenes(FFUploadedFile item) =>
      listaImagenes.remove(item);
  void removeAtIndexFromListaImagenes(int index) =>
      listaImagenes.removeAt(index);
  void insertAtIndexInListaImagenes(int index, FFUploadedFile item) =>
      listaImagenes.insert(index, item);
  void updateListaImagenesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      listaImagenes[index] = updateFn(listaImagenes[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ColumnPrincipal widget.
  ScrollController? columnPrincipalScrollController;
  // State field(s) for SwitchDepende widget.
  bool? switchDependeValue;
  // State field(s) for SwitchDependeFlujo widget.
  bool? switchDependeFlujoValue;
  // State field(s) for DropDownDepPre widget.
  int? dropDownDepPreValue;
  FormFieldController<int>? dropDownDepPreValueController;
  // State field(s) for DropDownDepRes widget.
  int? dropDownDepResValue;
  FormFieldController<int>? dropDownDepResValueController;
  // State field(s) for TextFieldInfo widget.
  FocusNode? textFieldInfoFocusNode;
  TextEditingController? textFieldInfoTextController;
  String? Function(BuildContext, String?)? textFieldInfoTextControllerValidator;
  // State field(s) for TextFieldPregunta widget.
  FocusNode? textFieldPreguntaFocusNode;
  TextEditingController? textFieldPreguntaTextController;
  String? Function(BuildContext, String?)?
      textFieldPreguntaTextControllerValidator;
  String? _textFieldPreguntaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La Pregunta es requerida';
    }

    return null;
  }

  // State field(s) for DropDownTipo widget.
  int? dropDownTipoValue;
  FormFieldController<int>? dropDownTipoValueController;
  // State field(s) for TextFieldMinimo widget.
  FocusNode? textFieldMinimoFocusNode;
  TextEditingController? textFieldMinimoTextController;
  String? Function(BuildContext, String?)?
      textFieldMinimoTextControllerValidator;
  // State field(s) for TextFieldMaximo widget.
  FocusNode? textFieldMaximoFocusNode;
  TextEditingController? textFieldMaximoTextController;
  String? Function(BuildContext, String?)?
      textFieldMaximoTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? docPregunta;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? respuestaOcupada;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaTextoS;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaNumeroS;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaRangoS;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? docPreguntaFlujo;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? preguntaOcupadaX;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaTexto;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaNumero;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaRango;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaTextoY;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaNumeroY;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaRangoY;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    columnPrincipalScrollController = ScrollController();
    textFieldPreguntaTextControllerValidator =
        _textFieldPreguntaTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    columnPrincipalScrollController?.dispose();
    textFieldInfoFocusNode?.dispose();
    textFieldInfoTextController?.dispose();

    textFieldPreguntaFocusNode?.dispose();
    textFieldPreguntaTextController?.dispose();

    textFieldMinimoFocusNode?.dispose();
    textFieldMinimoTextController?.dispose();

    textFieldMaximoFocusNode?.dispose();
    textFieldMaximoTextController?.dispose();
  }
}
