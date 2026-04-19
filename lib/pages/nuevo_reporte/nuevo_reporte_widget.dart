import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nuevo_reporte_model.dart';
export 'nuevo_reporte_model.dart';

class NuevoReporteWidget extends StatefulWidget {
  const NuevoReporteWidget({super.key});

  static String routeName = 'nuevoReporte';
  static String routePath = 'nuevoReporte';

  @override
  State<NuevoReporteWidget> createState() => _NuevoReporteWidgetState();
}

class _NuevoReporteWidgetState extends State<NuevoReporteWidget> {
  late NuevoReporteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevoReporteModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'nuevoReporte'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).barra,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NUEVO_REPORTE_chevron_left_rounded_ICN_O');
              context.pop();
            },
          ),
          title: Text(
            'Nuevo Reporte',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              controller: _model.columnController,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 5.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Hechos',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodySmallIsCustom,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .resaltado,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .resaltado,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .resaltado,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.wrap_text_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary600,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      textAlign: TextAlign.start,
                                      maxLines: 8,
                                      maxLength: 600,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.none,
                                      keyboardType: TextInputType.multiline,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 3.0, 10.0, 5.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= 'FOTO',
                                      ),
                                      options:
                                          List<String>.from(['FOTO', 'VIDEO']),
                                      optionLabels: ['Fotografía', 'Video'],
                                      onChanged: (val) async {
                                        safeSetState(
                                            () => _model.dropDownValue = val);
                                        logFirebaseEvent(
                                            'NUEVO_REPORTE_DropDown_qvwo6ltg_ON_FORM_');
                                        _model.tIpoIncidencia =
                                            _model.dropDownValue;
                                        safeSetState(() {});
                                      },
                                      width: double.infinity,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleMediumIsCustom,
                                          ),
                                      icon: FaIcon(
                                        FontAwesomeIcons.photoVideo,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary600,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 8.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      borderWidth: 1.0,
                                      borderRadius: 15.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  if (_model.tIpoIncidencia == 'FOTO')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'NUEVO_REPORTE_SUBIR_FOTOGRAFA_BTN_ON_TAP');
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  imageQuality: 40,
                                                  allowPhoto: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  safeSetState(() => _model
                                                          .isDataUploading_uploadMediaBxj =
                                                      true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      'Subiendo Archivo...',
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                  originalFilename:
                                                                      m.originalFilename,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading_uploadMediaBxj =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFile_uploadMediaBxj =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl_uploadMediaBxj =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(context,
                                                        'Archivo cargado con éxito!');
                                                  } else {
                                                    safeSetState(() {});
                                                    showUploadMessage(context,
                                                        'Fallo en la carga de Archivo');
                                                    return;
                                                  }
                                                }
                                              },
                                              text: 'Subir Fotografía',
                                              icon: Icon(
                                                Icons.add_a_photo,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      _model
                                                          .uploadedFileUrl_uploadMediaBxj,
                                                      'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/camara.png?alt=media&token=e7abca31-f4b2-4de1-a90f-d34e97dc78d4',
                                                    ),
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (_model.tIpoIncidencia == 'VIDEO')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'NUEVO_REPORTE_SUBIR_VIDEO_BTN_ON_TAP');
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  allowPhoto: false,
                                                  allowVideo: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  safeSetState(() => _model
                                                          .isDataUploading_uploadMedia1z9 =
                                                      true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      'Subiendo Archivo...',
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                  originalFilename:
                                                                      m.originalFilename,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading_uploadMedia1z9 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFile_uploadMedia1z9 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl_uploadMedia1z9 =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(context,
                                                        'Archivo cargado con éxito!');
                                                  } else {
                                                    safeSetState(() {});
                                                    showUploadMessage(context,
                                                        'Fallo en la carga de Archivo');
                                                    return;
                                                  }
                                                }
                                              },
                                              text: 'Subir Video',
                                              icon: Icon(
                                                Icons.video_call,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  child: Image.network(
                                                    'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/video.png?alt=media&token=943b24c0-284f-4123-b842-b487191c4aa3',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'NUEVO_REPORTE_PUBLICAR_REPORTE_BTN_ON_TA');
                                            var _shouldSetState = false;
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            if (_model.dropDownValue ==
                                                'FOTO') {
                                              if (_model.uploadedFileUrl_uploadMediaBxj !=
                                                      '') {
                                                var incidenciasRecordReference1 =
                                                    IncidenciasRecord.collection
                                                        .doc();
                                                await incidenciasRecordReference1
                                                    .set({
                                                  ...createIncidenciasRecordData(
                                                    enviadoPor:
                                                        currentUserReference,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    texto: _model
                                                        .textController.text,
                                                    tipo: _model.dropDownValue,
                                                    foto: _model
                                                        .uploadedFileUrl_uploadMediaBxj,
                                                    membresia:
                                                        currentUserDocument
                                                            ?.membresia,
                                                    esNoticia: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'Destinatarios': [
                                                        currentUserDocument
                                                            ?.padre
                                                      ],
                                                    },
                                                  ),
                                                });
                                                _model.incidenciaFoto =
                                                    IncidenciasRecord
                                                        .getDocumentFromData({
                                                  ...createIncidenciasRecordData(
                                                    enviadoPor:
                                                        currentUserReference,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    texto: _model
                                                        .textController.text,
                                                    tipo: _model.dropDownValue,
                                                    foto: _model
                                                        .uploadedFileUrl_uploadMediaBxj,
                                                    membresia:
                                                        currentUserDocument
                                                            ?.membresia,
                                                    esNoticia: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'Destinatarios': [
                                                        currentUserDocument
                                                            ?.padre
                                                      ],
                                                    },
                                                  ),
                                                }, incidenciasRecordReference1);
                                                _shouldSetState = true;

                                                await _model
                                                    .incidenciaFoto!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'Destinatarios':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            } else {
                                              if (_model.uploadedFileUrl_uploadMedia1z9 !=
                                                      '') {
                                                var incidenciasRecordReference2 =
                                                    IncidenciasRecord.collection
                                                        .doc();
                                                await incidenciasRecordReference2
                                                    .set({
                                                  ...createIncidenciasRecordData(
                                                    enviadoPor:
                                                        currentUserReference,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    texto: _model
                                                        .textController.text,
                                                    tipo: _model.dropDownValue,
                                                    video: _model
                                                        .uploadedFileUrl_uploadMedia1z9,
                                                    membresia:
                                                        currentUserDocument
                                                            ?.membresia,
                                                    esNoticia: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'Destinatarios': [
                                                        currentUserDocument
                                                            ?.padre
                                                      ],
                                                    },
                                                  ),
                                                });
                                                _model.incidenciaVideo =
                                                    IncidenciasRecord
                                                        .getDocumentFromData({
                                                  ...createIncidenciasRecordData(
                                                    enviadoPor:
                                                        currentUserReference,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    texto: _model
                                                        .textController.text,
                                                    tipo: _model.dropDownValue,
                                                    video: _model
                                                        .uploadedFileUrl_uploadMedia1z9,
                                                    membresia:
                                                        currentUserDocument
                                                            ?.membresia,
                                                    esNoticia: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'Destinatarios': [
                                                        currentUserDocument
                                                            ?.padre
                                                      ],
                                                    },
                                                  ),
                                                }, incidenciasRecordReference2);
                                                _shouldSetState = true;

                                                await _model
                                                    .incidenciaVideo!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'Destinatarios':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            }

                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x00000000),
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: CustomAlertWidget(
                                                      titulo: 'Listo!',
                                                      mensaje:
                                                          'El Reporte ha sido enviado exitosamente!.',
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            triggerPushNotification(
                                              notificationTitle:
                                                  'Nuevo Reporte!',
                                              notificationText:
                                                  '${currentUserDisplayName} ha enviado un NUEVO Reporte!',
                                              notificationImageUrl:
                                                  currentUserPhoto,
                                              notificationSound: 'default',
                                              userRefs: [
                                                currentUserDocument!.padre!
                                              ],
                                              initialPageName: 'incidencias',
                                              parameterData: {},
                                            );

                                            context.goNamed(
                                                IncidenciasWidget.routeName);

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                          text: 'Publicar Reporte',
                                          icon: Icon(
                                            Icons.public_sharp,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 180.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .barra,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
