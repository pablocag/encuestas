import '/flutter_flow/flutter_flow_util.dart';
import 'noticias_comentarios_widget.dart' show NoticiasComentariosWidget;
import 'package:flutter/material.dart';

class NoticiasComentariosModel
    extends FlutterFlowModel<NoticiasComentariosWidget> {
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
