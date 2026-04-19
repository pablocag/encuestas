import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_membresia_widget.dart' show EditarMembresiaWidget;
import 'package:flutter/material.dart';

class EditarMembresiaModel extends FlutterFlowModel<EditarMembresiaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for membresia_ID widget.
  FocusNode? membresiaIDFocusNode;
  TextEditingController? membresiaIDTextController;
  String? Function(BuildContext, String?)? membresiaIDTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  String? _descripcionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La Descripcion es requerida';
    }

    return null;
  }

  // State field(s) for Encuestas widget.
  FocusNode? encuestasFocusNode;
  TextEditingController? encuestasTextController;
  String? Function(BuildContext, String?)? encuestasTextControllerValidator;
  String? _encuestasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Paquete requerido';
    }

    return null;
  }

  // State field(s) for Personas widget.
  FocusNode? personasFocusNode;
  TextEditingController? personasTextController;
  String? Function(BuildContext, String?)? personasTextControllerValidator;
  String? _personasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dato requerido';
    }

    return null;
  }

  // State field(s) for SwitchActiva widget.
  bool? switchActivaValue;
  bool isDataUploading_uploadDataAcr = false;
  FFUploadedFile uploadedLocalFile_uploadDataAcr =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PromovidosRecord? raizPromovido;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PromovidosRecord? nuevoHijoPromovido;
  bool isDataUploading_uploadDataLogo = false;
  FFUploadedFile uploadedLocalFile_uploadDataLogo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataLogo = '';

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    descripcionTextControllerValidator = _descripcionTextControllerValidator;
    encuestasTextControllerValidator = _encuestasTextControllerValidator;
    personasTextControllerValidator = _personasTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    membresiaIDFocusNode?.dispose();
    membresiaIDTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    encuestasFocusNode?.dispose();
    encuestasTextController?.dispose();

    personasFocusNode?.dispose();
    personasTextController?.dispose();
  }
}
