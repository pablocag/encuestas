import '/flutter_flow/flutter_flow_util.dart';
import 'god_catalogos_widget.dart' show GodCatalogosWidget;
import 'package:flutter/material.dart';

class GodCatalogosModel extends FlutterFlowModel<GodCatalogosWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
