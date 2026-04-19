import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_pregunta_encuesta_widget.dart' show EditarPreguntaEncuestaWidget;
import 'package:flutter/material.dart';

class EditarPreguntaEncuestaModel
    extends FlutterFlowModel<EditarPreguntaEncuestaWidget> {
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

  List<String> cadenaPreguntas = [];
  void addToCadenaPreguntas(String item) => cadenaPreguntas.add(item);
  void removeFromCadenaPreguntas(String item) => cadenaPreguntas.remove(item);
  void removeAtIndexFromCadenaPreguntas(int index) =>
      cadenaPreguntas.removeAt(index);
  void insertAtIndexInCadenaPreguntas(int index, String item) =>
      cadenaPreguntas.insert(index, item);
  void updateCadenaPreguntasAtIndex(int index, Function(String) updateFn) =>
      cadenaPreguntas[index] = updateFn(cadenaPreguntas[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ColumnPrincipal widget.
  ScrollController? columnPrincipalScrollController;
  // State field(s) for SwitchMulti widget.
  bool? switchMultiValue;
  // State field(s) for SwitchMostrarTexto widget.
  bool? switchMostrarTextoValue;
  // State field(s) for SwitchDepende widget.
  bool? switchDependeValue;
  // State field(s) for SwitchDependeFlujo widget.
  bool? switchDependeFlujoValue;
  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
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

  // State field(s) for DropDown widget.
  int? dropDownValue3;
  FormFieldController<int>? dropDownValueController3;
  // State field(s) for TextFieldR1 widget.
  FocusNode? textFieldR1FocusNode;
  TextEditingController? textFieldR1TextController;
  String? Function(BuildContext, String?)? textFieldR1TextControllerValidator;
  bool isDataUploading_uploadDataImg1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg1 = '';

  // State field(s) for TextFieldR2 widget.
  FocusNode? textFieldR2FocusNode;
  TextEditingController? textFieldR2TextController;
  String? Function(BuildContext, String?)? textFieldR2TextControllerValidator;
  bool isDataUploading_uploadDataImg2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg2 = '';

  // State field(s) for TextFieldR3 widget.
  FocusNode? textFieldR3FocusNode;
  TextEditingController? textFieldR3TextController;
  String? Function(BuildContext, String?)? textFieldR3TextControllerValidator;
  bool isDataUploading_uploadDataImg3 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg3 = '';

  // State field(s) for TextFieldR4 widget.
  FocusNode? textFieldR4FocusNode;
  TextEditingController? textFieldR4TextController;
  String? Function(BuildContext, String?)? textFieldR4TextControllerValidator;
  bool isDataUploading_uploadDataImg4 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg4 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg4 = '';

  // State field(s) for TextFieldR5 widget.
  FocusNode? textFieldR5FocusNode;
  TextEditingController? textFieldR5TextController;
  String? Function(BuildContext, String?)? textFieldR5TextControllerValidator;
  bool isDataUploading_uploadDataImg5 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg5 = '';

  // State field(s) for TextFieldR6 widget.
  FocusNode? textFieldR6FocusNode;
  TextEditingController? textFieldR6TextController;
  String? Function(BuildContext, String?)? textFieldR6TextControllerValidator;
  bool isDataUploading_uploadDataImg6 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg6 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg6 = '';

  // State field(s) for TextFieldR7 widget.
  FocusNode? textFieldR7FocusNode;
  TextEditingController? textFieldR7TextController;
  String? Function(BuildContext, String?)? textFieldR7TextControllerValidator;
  bool isDataUploading_uploadDataImg7 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg7 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg7 = '';

  // State field(s) for TextFieldR8 widget.
  FocusNode? textFieldR8FocusNode;
  TextEditingController? textFieldR8TextController;
  String? Function(BuildContext, String?)? textFieldR8TextControllerValidator;
  bool isDataUploading_uploadDataImg8 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg8 = '';

  // State field(s) for TextFieldR9 widget.
  FocusNode? textFieldR9FocusNode;
  TextEditingController? textFieldR9TextController;
  String? Function(BuildContext, String?)? textFieldR9TextControllerValidator;
  bool isDataUploading_uploadDataImg9 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg9 = '';

  // State field(s) for TextFieldR10 widget.
  FocusNode? textFieldR10FocusNode;
  TextEditingController? textFieldR10TextController;
  String? Function(BuildContext, String?)? textFieldR10TextControllerValidator;
  bool isDataUploading_uploadDataImg10 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg10 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg10 = '';

  // State field(s) for TextFieldR11 widget.
  FocusNode? textFieldR11FocusNode;
  TextEditingController? textFieldR11TextController;
  String? Function(BuildContext, String?)? textFieldR11TextControllerValidator;
  bool isDataUploading_uploadDataImg11 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg11 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg11 = '';

  // State field(s) for TextFieldR12 widget.
  FocusNode? textFieldR12FocusNode;
  TextEditingController? textFieldR12TextController;
  String? Function(BuildContext, String?)? textFieldR12TextControllerValidator;
  bool isDataUploading_uploadDataImg12 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg12 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg12 = '';

  // State field(s) for TextFieldR13 widget.
  FocusNode? textFieldR13FocusNode;
  TextEditingController? textFieldR13TextController;
  String? Function(BuildContext, String?)? textFieldR13TextControllerValidator;
  bool isDataUploading_uploadDataImg13 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg13 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg13 = '';

  // State field(s) for TextFieldR14 widget.
  FocusNode? textFieldR14FocusNode;
  TextEditingController? textFieldR14TextController;
  String? Function(BuildContext, String?)? textFieldR14TextControllerValidator;
  bool isDataUploading_uploadDataImg14 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg14 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg14 = '';

  // State field(s) for TextFieldR15 widget.
  FocusNode? textFieldR15FocusNode;
  TextEditingController? textFieldR15TextController;
  String? Function(BuildContext, String?)? textFieldR15TextControllerValidator;
  bool isDataUploading_uploadDataImg15 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg15 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg15 = '';

  // State field(s) for TextFieldR16 widget.
  FocusNode? textFieldR16FocusNode;
  TextEditingController? textFieldR16TextController;
  String? Function(BuildContext, String?)? textFieldR16TextControllerValidator;
  bool isDataUploading_uploadDataImg16 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg16 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg16 = '';

  // State field(s) for TextFieldR17 widget.
  FocusNode? textFieldR17FocusNode;
  TextEditingController? textFieldR17TextController;
  String? Function(BuildContext, String?)? textFieldR17TextControllerValidator;
  bool isDataUploading_uploadDataImg17 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg17 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg17 = '';

  // State field(s) for TextFieldR18 widget.
  FocusNode? textFieldR18FocusNode;
  TextEditingController? textFieldR18TextController;
  String? Function(BuildContext, String?)? textFieldR18TextControllerValidator;
  bool isDataUploading_uploadDataImg18 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg18 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg18 = '';

  // State field(s) for TextFieldR19 widget.
  FocusNode? textFieldR19FocusNode;
  TextEditingController? textFieldR19TextController;
  String? Function(BuildContext, String?)? textFieldR19TextControllerValidator;
  bool isDataUploading_uploadDataImg19 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg19 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg19 = '';

  // State field(s) for TextFieldR20 widget.
  FocusNode? textFieldR20FocusNode;
  TextEditingController? textFieldR20TextController;
  String? Function(BuildContext, String?)? textFieldR20TextControllerValidator;
  bool isDataUploading_uploadDataImg20 = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg20 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImg20 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? hayEncuestasHechas;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestaOcupada;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? preguntaDelDropdown1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ModelosPreguntasEncuestaRecord>? preguntaOcupadaF;

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

    textFieldR1FocusNode?.dispose();
    textFieldR1TextController?.dispose();

    textFieldR2FocusNode?.dispose();
    textFieldR2TextController?.dispose();

    textFieldR3FocusNode?.dispose();
    textFieldR3TextController?.dispose();

    textFieldR4FocusNode?.dispose();
    textFieldR4TextController?.dispose();

    textFieldR5FocusNode?.dispose();
    textFieldR5TextController?.dispose();

    textFieldR6FocusNode?.dispose();
    textFieldR6TextController?.dispose();

    textFieldR7FocusNode?.dispose();
    textFieldR7TextController?.dispose();

    textFieldR8FocusNode?.dispose();
    textFieldR8TextController?.dispose();

    textFieldR9FocusNode?.dispose();
    textFieldR9TextController?.dispose();

    textFieldR10FocusNode?.dispose();
    textFieldR10TextController?.dispose();

    textFieldR11FocusNode?.dispose();
    textFieldR11TextController?.dispose();

    textFieldR12FocusNode?.dispose();
    textFieldR12TextController?.dispose();

    textFieldR13FocusNode?.dispose();
    textFieldR13TextController?.dispose();

    textFieldR14FocusNode?.dispose();
    textFieldR14TextController?.dispose();

    textFieldR15FocusNode?.dispose();
    textFieldR15TextController?.dispose();

    textFieldR16FocusNode?.dispose();
    textFieldR16TextController?.dispose();

    textFieldR17FocusNode?.dispose();
    textFieldR17TextController?.dispose();

    textFieldR18FocusNode?.dispose();
    textFieldR18TextController?.dispose();

    textFieldR19FocusNode?.dispose();
    textFieldR19TextController?.dispose();

    textFieldR20FocusNode?.dispose();
    textFieldR20TextController?.dispose();
  }
}
