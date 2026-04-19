import '/flutter_flow/flutter_flow_util.dart';
import 'noticias_card_widget.dart' show NoticiasCardWidget;
import 'package:flutter/material.dart';

class NoticiasCardModel extends FlutterFlowModel<NoticiasCardWidget> {
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
