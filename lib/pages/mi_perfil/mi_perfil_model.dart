import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mi_perfil_widget.dart' show MiPerfilWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MiPerfilModel extends FlutterFlowModel<MiPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  bool isDataUploading_uploadDataJ9a = false;
  FFUploadedFile uploadedLocalFile_uploadDataJ9a =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJ9a = '';

  // Stores action output result for [Custom Action - deleteReferenciasUsuario] action in IconButton widget.
  int? referenciasEliminadas;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for TxTCelular widget.
  FocusNode? txTCelularFocusNode;
  TextEditingController? txTCelularTextController;
  late MaskTextInputFormatter txTCelularMask;
  String? Function(BuildContext, String?)? txTCelularTextControllerValidator;
  String? _txTCelularTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'EL Teléfono es requerido';
    }

    if (val.length < 10) {
      return 'Se requiere de al menos 10 digitos';
    }
    if (val.length > 10) {
      return 'Se requiere de al menos 10 digitos';
    }

    return null;
  }

  // Stores action output result for [Custom Action - crearPINCode] action in Button widget.
  String? nuevoPINL;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? countPINL;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    txTCelularTextControllerValidator = _txTCelularTextControllerValidator;
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    txTCelularFocusNode?.dispose();
    txTCelularTextController?.dispose();
  }
}
