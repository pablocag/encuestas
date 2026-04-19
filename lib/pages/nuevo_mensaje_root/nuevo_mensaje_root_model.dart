import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nuevo_mensaje_root_widget.dart' show NuevoMensajeRootWidget;
import 'package:flutter/material.dart';

class NuevoMensajeRootModel extends FlutterFlowModel<NuevoMensajeRootWidget> {
  ///  Local state fields for this page.

  int? municipioActivo;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for ColumnPrincipal widget.
  ScrollController? columnPrincipalScrollController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El mensaje es requerido!';
    }

    if (val.length < 5) {
      return 'Se requiere de al menos 5 caracteres';
    }
    if (val.length > 280) {
      return 'El Máximo permitido es de 280 caracteres';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? usersTodos;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? notificacionIDT;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnPrincipalScrollController = ScrollController();
    columnController2 = ScrollController();
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnPrincipalScrollController?.dispose();
    paginatedDataTableController.dispose();
    columnController2?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
