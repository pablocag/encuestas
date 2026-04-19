import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'god_page_widget.dart' show GodPageWidget;
import 'package:flutter/material.dart';

class GodPageModel extends FlutterFlowModel<GodPageWidget> {
  ///  Local state fields for this page.

  int? loopCounter = 0;

  int? loopMax = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Cloud Function - logoutUsuarios] action in Button widget.
  LogoutUsuariosCloudFunctionCallResponse? cloudFunctionqbh;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
