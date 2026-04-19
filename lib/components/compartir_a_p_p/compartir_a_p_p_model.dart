import '/flutter_flow/flutter_flow_util.dart';
import 'compartir_a_p_p_widget.dart' show CompartirAPPWidget;
import 'package:flutter/material.dart';

class CompartirAPPModel extends FlutterFlowModel<CompartirAPPWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // Stores action output result for [Custom Action - crearPINCode] action in Button widget.
  String? nuevoPINL;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? countPINL;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController?.dispose();
  }
}
