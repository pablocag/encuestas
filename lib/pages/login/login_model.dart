import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for emailAddress widget.
  final emailAddressKey = GlobalKey();
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? emailAddressSelectedOption;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La contraseña es necesaria';
    }

    if (val.length < 6) {
      return 'Se requieren al menos 6 caracteres en la contraseña';
    }

    return null;
  }

  bool bioAuth = false;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    emailAddressFocusNode?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
