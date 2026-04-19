import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'nuevo_mensaje_widget.dart' show NuevoMensajeWidget;
import 'package:flutter/material.dart';

class NuevoMensajeModel extends FlutterFlowModel<NuevoMensajeWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El mensaje esta vacío!';
    }

    if (val.length < 5) {
      return 'Se requiere de al menos 5 caracteres';
    }
    if (val.length > 280) {
      return 'El Máximo permitido es de 280 caracteres';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? notificacionID;

  /// Query cache managers for this widget.

  final _misPromotoresManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> misPromotores({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _misPromotoresManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMisPromotoresCache() => _misPromotoresManager.clear();
  void clearMisPromotoresCacheKey(String? uniqueKey) =>
      _misPromotoresManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    paginatedDataTableController.dispose();
    columnController3?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    /// Dispose query cache managers for this widget.

    clearMisPromotoresCache();
  }
}
