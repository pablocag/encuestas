import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nuevo_reporte_widget.dart' show NuevoReporteWidget;
import 'package:flutter/material.dart';

class NuevoReporteModel extends FlutterFlowModel<NuevoReporteWidget> {
  ///  Local state fields for this page.

  String? tIpoIncidencia = 'FOTO';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading_uploadMediaBxj = false;
  FFUploadedFile uploadedLocalFile_uploadMediaBxj =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadMediaBxj = '';

  bool isDataUploading_uploadMedia1z9 = false;
  FFUploadedFile uploadedLocalFile_uploadMedia1z9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadMedia1z9 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  IncidenciasRecord? incidenciaFoto;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  IncidenciasRecord? incidenciaVideo;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
