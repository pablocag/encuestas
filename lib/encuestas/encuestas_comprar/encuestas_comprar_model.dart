import '/flutter_flow/flutter_flow_util.dart';
import 'encuestas_comprar_widget.dart' show EncuestasComprarWidget;
import 'package:flutter/material.dart';

class EncuestasComprarModel extends FlutterFlowModel<EncuestasComprarWidget> {
  ///  Local state fields for this page.

  String? precio;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [RevenueCat - Purchase] action in ListTile widget.
  bool? isPurchaseSuccessful;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
