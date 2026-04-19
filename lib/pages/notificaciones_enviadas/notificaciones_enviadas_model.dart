import '/flutter_flow/flutter_flow_util.dart';
import 'notificaciones_enviadas_widget.dart' show NotificacionesEnviadasWidget;
import 'package:flutter/material.dart';

class NotificacionesEnviadasModel
    extends FlutterFlowModel<NotificacionesEnviadasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController;

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
