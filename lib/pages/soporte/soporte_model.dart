import '/flutter_flow/flutter_flow_util.dart';
import 'soporte_widget.dart' show SoporteWidget;
import 'package:flutter/material.dart';

class SoporteModel extends FlutterFlowModel<SoporteWidget> {
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
