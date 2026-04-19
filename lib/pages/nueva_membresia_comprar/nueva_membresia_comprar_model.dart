import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nueva_membresia_comprar_widget.dart' show NuevaMembresiaComprarWidget;
import 'package:flutter/material.dart';

class NuevaMembresiaComprarModel
    extends FlutterFlowModel<NuevaMembresiaComprarWidget> {
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

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Stores action output result for [Custom Action - crearIDMembresia] action in Button widget.
  String? idPropuesto;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? otroIDIgual;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MembresiasRecord? nuevaMembresia;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? raizPromovido;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? god;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PromovidosRecord? nuevoHijoPromovido;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    membresiaIDTextControllerValidator = _membresiaIDTextControllerValidator;
    descripcionTextControllerValidator = _descripcionTextControllerValidator;
    encuestasTextControllerValidator = _encuestasTextControllerValidator;
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
  }
}
