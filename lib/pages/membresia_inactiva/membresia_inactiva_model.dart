import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'membresia_inactiva_widget.dart' show MembresiaInactivaWidget;
import 'package:flutter/material.dart';

class MembresiaInactivaModel extends FlutterFlowModel<MembresiaInactivaWidget> {
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
