import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'asigna_encuestadores_widget.dart' show AsignaEncuestadoresWidget;
import 'package:flutter/material.dart';

class AsignaEncuestadoresModel
    extends FlutterFlowModel<AsignaEncuestadoresWidget> {
  ///  Local state fields for this page.

  bool? showAll = true;

  bool encuestadores = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
