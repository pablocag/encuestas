import '/flutter_flow/flutter_flow_util.dart';
import 'mi_q_r_widget.dart' show MiQRWidget;
import 'package:flutter/material.dart';

class MiQRModel extends FlutterFlowModel<MiQRWidget> {
  ///  State fields for stateful widgets in this component.

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
