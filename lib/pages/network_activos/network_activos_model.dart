import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'network_activos_widget.dart' show NetworkActivosWidget;
import 'package:flutter/material.dart';

class NetworkActivosModel extends FlutterFlowModel<NetworkActivosWidget> {
  ///  Local state fields for this page.

  UsuariosOnLineStruct? lista;
  void updateListaStruct(Function(UsuariosOnLineStruct) updateFn) {
    updateFn(lista ??= UsuariosOnLineStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Stores action output result for [Cloud Function - checkUsuariosOnLine] action in Button widget.
  CheckUsuariosOnLineCloudFunctionCallResponse? cloudFunctionqz9;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
  }
}
