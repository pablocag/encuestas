import '/flutter_flow/flutter_flow_util.dart';
import 'editar_tel_encuestador_widget.dart' show EditarTelEncuestadorWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarTelEncuestadorModel
    extends FlutterFlowModel<EditarTelEncuestadorWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
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
      return 'El teléfono es requerido';
    }

    if (val.length < 10) {
      return 'El teléfono requiere de 10 dígitos';
    }
    if (val.length > 10) {
      return 'El teléfono requiere de 10 dígitos';
    }

    return null;
  }

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
