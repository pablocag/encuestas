import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nueva_noticia_widget.dart' show NuevaNoticiaWidget;
import 'package:flutter/material.dart';

class NuevaNoticiaModel extends FlutterFlowModel<NuevaNoticiaWidget> {
  ///  Local state fields for this page.

  String? tIpoNoticia = 'FOTO';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El texto es requeridoi';
    }

    if (val.length < 10) {
      return 'Se requiere de al menos 10 caracteres';
    }
    if (val.length > 800) {
      return 'Se permite máximo 800 caracteres';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading_uploadMediaRfe = false;
  FFUploadedFile uploadedLocalFile_uploadMediaRfe =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadMediaRfe = '';

  bool isDataUploading_uploadMediaY15 = false;
  FFUploadedFile uploadedLocalFile_uploadMediaY15 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadMediaY15 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NoticiasRecord? noticiaFoto;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NoticiasRecord? noticiaVideo;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
