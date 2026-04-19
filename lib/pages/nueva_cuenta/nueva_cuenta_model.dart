import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nueva_cuenta_widget.dart' show NuevaCuentaWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NuevaCuentaModel extends FlutterFlowModel<NuevaCuentaWidget> {
  ///  Local state fields for this page.

  int? nivelPadre;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for scrollingBody widget.
  ScrollController? scrollingBodyScrollController;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo electrónico es requerido';
    }

    if (val.length < 5) {
      return 'El correo requiere de al menos 5 caracteres';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Solo se permite un correo electrónico válido';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La Contraseña es requerida';
    }

    if (val.length < 6) {
      return 'La contraseña debe contener al menos 6 caracteres';
    }
    if (val.length > 12) {
      return 'La contraseña debe contener máximo 12 caracteres';
    }

    return null;
  }

  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;
  String? _passwordConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debe Confirmar su Contraseña';
    }

    if (val.length < 6) {
      return 'La contraseña debe contener al menos 6 caracteres';
    }
    if (val.length > 12) {
      return 'La contraseña debe contener máximo 12 caracteres';
    }

    return null;
  }

  // State field(s) for TxTNombres widget.
  FocusNode? txTNombresFocusNode;
  TextEditingController? txTNombresTextController;
  String? Function(BuildContext, String?)? txTNombresTextControllerValidator;
  String? _txTNombresTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Su nombre es requerido';
    }

    if (val.length < 3) {
      return 'Su nombre deben contener al menos 3 caracteres';
    }
    if (val.length > 25) {
      return 'Su nombre deben contener máximo 25 caracteres';
    }

    return null;
  }

  // State field(s) for TxTAp_Paterno widget.
  FocusNode? txTApPaternoFocusNode;
  TextEditingController? txTApPaternoTextController;
  String? Function(BuildContext, String?)? txTApPaternoTextControllerValidator;
  String? _txTApPaternoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Su apellido paterno es requerido';
    }

    if (val.length < 2) {
      return 'Su apellido paterno debe al menos 2 caracteres';
    }
    if (val.length > 25) {
      return 'Su apellido paterno debe contener máximo 25 caracteres';
    }

    return null;
  }

  // State field(s) for TxTAp_Materno widget.
  FocusNode? txTApMaternoFocusNode;
  TextEditingController? txTApMaternoTextController;
  String? Function(BuildContext, String?)? txTApMaternoTextControllerValidator;
  String? _txTApMaternoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Su apellido materno es requerido';
    }

    if (val.length < 2) {
      return 'Su apellido paterno debe al menos 2 caracteres';
    }
    if (val.length > 25) {
      return 'Su apellido materno debe contener máximo 25 caracteres';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for TxTCelular widget.
  FocusNode? txTCelularFocusNode;
  TextEditingController? txTCelularTextController;
  late MaskTextInputFormatter txTCelularMask;
  String? Function(BuildContext, String?)? txTCelularTextControllerValidator;
  // State field(s) for CheckboxAcuerdo widget.
  bool? checkboxAcuerdoValue;

  @override
  void initState(BuildContext context) {
    scrollingBodyScrollController = ScrollController();
    columnController = ScrollController();
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    passwordConfirmVisibility = false;
    passwordConfirmTextControllerValidator =
        _passwordConfirmTextControllerValidator;
    txTNombresTextControllerValidator = _txTNombresTextControllerValidator;
    txTApPaternoTextControllerValidator = _txTApPaternoTextControllerValidator;
    txTApMaternoTextControllerValidator = _txTApMaternoTextControllerValidator;
  }

  @override
  void dispose() {
    scrollingBodyScrollController?.dispose();
    columnController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();

    txTNombresFocusNode?.dispose();
    txTNombresTextController?.dispose();

    txTApPaternoFocusNode?.dispose();
    txTApPaternoTextController?.dispose();

    txTApMaternoFocusNode?.dispose();
    txTApMaternoTextController?.dispose();

    txTCelularFocusNode?.dispose();
    txTCelularTextController?.dispose();
  }
}
