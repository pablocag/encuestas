import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nueva_membresia_widget.dart' show NuevaMembresiaWidget;
import 'package:flutter/material.dart';

class NuevaMembresiaModel extends FlutterFlowModel<NuevaMembresiaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for membresia_ID widget.
  FocusNode? membresiaIDFocusNode;
  TextEditingController? membresiaIDTextController;
  String? Function(BuildContext, String?)? membresiaIDTextControllerValidator;
  String? _membresiaIDTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // Stores action output result for [Custom Action - crearIDMembresia] action in Button widget.
  String? idPropuesto;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? otroIDIgual;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  String? _descripcionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // State field(s) for Encuestas widget.
  FocusNode? encuestasFocusNode;
  TextEditingController? encuestasTextController;
  String? Function(BuildContext, String?)? encuestasTextControllerValidator;
  String? _encuestasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    return null;
  }

  // State field(s) for Personas widget.
  FocusNode? personasFocusNode;
  TextEditingController? personasTextController;
  String? Function(BuildContext, String?)? personasTextControllerValidator;
  String? _personasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MembresiasRecord? nuevaMembresia;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? raizPromovidoN;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PromovidosRecord? nuevoHijoPromovido;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    membresiaIDTextControllerValidator = _membresiaIDTextControllerValidator;
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
