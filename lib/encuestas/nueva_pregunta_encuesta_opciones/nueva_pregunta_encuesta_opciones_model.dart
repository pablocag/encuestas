import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_pregunta_encuesta_opciones_widget.dart'
    show NuevaPreguntaEncuestaOpcionesWidget;
import 'package:flutter/material.dart';

class NuevaPreguntaEncuestaOpcionesModel
    extends FlutterFlowModel<NuevaPreguntaEncuestaOpcionesWidget> {
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
  // State field(s) for SwitchMulti widget.
  bool? switchMultiValue;
  // State field(s) for SwitchImagenes widget.
  bool? switchImagenesValue;
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
  bool isDataUploading_uploadFoto1 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR2 widget.
  FocusNode? textFieldR2FocusNode;
  TextEditingController? textFieldR2TextController;
  String? Function(BuildContext, String?)? textFieldR2TextControllerValidator;
  bool isDataUploading_uploadFoto2 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR3 widget.
  FocusNode? textFieldR3FocusNode;
  TextEditingController? textFieldR3TextController;
  String? Function(BuildContext, String?)? textFieldR3TextControllerValidator;
  bool isDataUploading_uploadFoto3 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR4 widget.
  FocusNode? textFieldR4FocusNode;
  TextEditingController? textFieldR4TextController;
  String? Function(BuildContext, String?)? textFieldR4TextControllerValidator;
  bool isDataUploading_uploadFoto4 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto4 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR5 widget.
  FocusNode? textFieldR5FocusNode;
  TextEditingController? textFieldR5TextController;
  String? Function(BuildContext, String?)? textFieldR5TextControllerValidator;
  bool isDataUploading_uploadFoto5 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR6 widget.
  FocusNode? textFieldR6FocusNode;
  TextEditingController? textFieldR6TextController;
  String? Function(BuildContext, String?)? textFieldR6TextControllerValidator;
  bool isDataUploading_uploadFoto6 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto6 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR7 widget.
  FocusNode? textFieldR7FocusNode;
  TextEditingController? textFieldR7TextController;
  String? Function(BuildContext, String?)? textFieldR7TextControllerValidator;
  bool isDataUploading_uploadFoto7 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto7 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR8 widget.
  FocusNode? textFieldR8FocusNode;
  TextEditingController? textFieldR8TextController;
  String? Function(BuildContext, String?)? textFieldR8TextControllerValidator;
  bool isDataUploading_uploadFoto8 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR9 widget.
  FocusNode? textFieldR9FocusNode;
  TextEditingController? textFieldR9TextController;
  String? Function(BuildContext, String?)? textFieldR9TextControllerValidator;
  bool isDataUploading_uploadFoto9 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR10 widget.
  FocusNode? textFieldR10FocusNode;
  TextEditingController? textFieldR10TextController;
  String? Function(BuildContext, String?)? textFieldR10TextControllerValidator;
  bool isDataUploading_uploadFoto10 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto10 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR11 widget.
  FocusNode? textFieldR11FocusNode;
  TextEditingController? textFieldR11TextController;
  String? Function(BuildContext, String?)? textFieldR11TextControllerValidator;
  bool isDataUploading_uploadFoto11 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto11 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR12 widget.
  FocusNode? textFieldR12FocusNode;
  TextEditingController? textFieldR12TextController;
  String? Function(BuildContext, String?)? textFieldR12TextControllerValidator;
  bool isDataUploading_uploadFoto12 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto12 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR13 widget.
  FocusNode? textFieldR13FocusNode;
  TextEditingController? textFieldR13TextController;
  String? Function(BuildContext, String?)? textFieldR13TextControllerValidator;
  bool isDataUploading_uploadFoto13 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto13 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR14 widget.
  FocusNode? textFieldR14FocusNode;
  TextEditingController? textFieldR14TextController;
  String? Function(BuildContext, String?)? textFieldR14TextControllerValidator;
  bool isDataUploading_uploadFoto14 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto14 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR15 widget.
  FocusNode? textFieldR15FocusNode;
  TextEditingController? textFieldR15TextController;
  String? Function(BuildContext, String?)? textFieldR15TextControllerValidator;
  bool isDataUploading_uploadFoto15 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto15 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR16 widget.
  FocusNode? textFieldR16FocusNode;
  TextEditingController? textFieldR16TextController;
  String? Function(BuildContext, String?)? textFieldR16TextControllerValidator;
  bool isDataUploading_uploadFoto16 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto16 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR17 widget.
  FocusNode? textFieldR17FocusNode;
  TextEditingController? textFieldR17TextController;
  String? Function(BuildContext, String?)? textFieldR17TextControllerValidator;
  bool isDataUploading_uploadFoto17 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto17 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR18 widget.
  FocusNode? textFieldR18FocusNode;
  TextEditingController? textFieldR18TextController;
  String? Function(BuildContext, String?)? textFieldR18TextControllerValidator;
  bool isDataUploading_uploadFoto18 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto18 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR19 widget.
  FocusNode? textFieldR19FocusNode;
  TextEditingController? textFieldR19TextController;
  String? Function(BuildContext, String?)? textFieldR19TextControllerValidator;
  bool isDataUploading_uploadFoto19 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto19 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldR20 widget.
  FocusNode? textFieldR20FocusNode;
  TextEditingController? textFieldR20TextController;
  String? Function(BuildContext, String?)? textFieldR20TextControllerValidator;
  bool isDataUploading_uploadFoto20 = false;
  FFUploadedFile uploadedLocalFile_uploadFoto20 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataArchivos = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataArchivos = [];
  List<String> uploadedFileUrls_uploadDataArchivos = [];

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? docPregunta;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? respuestaOcupada;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ModelosPreguntasEncuestaRecord? docPreguntaFlujo;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? preguntaOcupada;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas2Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas3Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas4Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas4;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas5Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas5;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas6Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas6;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas7Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas7;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas8Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas8;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas9Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas9;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas10Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas10;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas11Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas11;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas12Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas12;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas13Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas13;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas14Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas14;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas15Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas15;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas16Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas16;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas17Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas17;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas18Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas18;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas19Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas19;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas20Imagenes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModelosPreguntasEncuestaRecord? respuestas20;

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
