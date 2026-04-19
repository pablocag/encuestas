import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'olvide_mi_contrasena_widget.dart' show OlvideMiContrasenaWidget;
import 'package:flutter/material.dart';

class OlvideMiContrasenaModel
    extends FlutterFlowModel<OlvideMiContrasenaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'EL correo es requerido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Se requiere de un correo válido';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
