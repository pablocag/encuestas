import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'editar_membresia_model.dart';
export 'editar_membresia_model.dart';

class EditarMembresiaWidget extends StatefulWidget {
  const EditarMembresiaWidget({
    super.key,
    this.membresia,
  });

  final DocumentReference? membresia;

  static String routeName = 'editarMembresia';
  static String routePath = 'editarMembresia';

  @override
  State<EditarMembresiaWidget> createState() => _EditarMembresiaWidgetState();
}

class _EditarMembresiaWidgetState extends State<EditarMembresiaWidget>
    with TickerProviderStateMixin {
  late EditarMembresiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarMembresiaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'editarMembresia'});

    _model.membresiaIDFocusNode ??= FocusNode();

    _model.descripcionFocusNode ??= FocusNode();

    _model.encuestasFocusNode ??= FocusNode();

    _model.personasFocusNode ??= FocusNode();

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MembresiasRecord>(
      stream: MembresiasRecord.getDocument(widget.membresia!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).barra,
                  size: 24.0,
                ),
              ),
            ),
          );
        }

        final editarMembresiaMembresiasRecord = snapshot.data!;

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
                  logFirebaseEvent('EDITAR_MEMBRESIA_chevron_left_rounded_IC');
                  context.pop();
                },
              ),
              title: Text(
                'Editar Membresía',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
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
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(
                    editarMembresiaMembresiasRecord.usuario!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: SpinKitThreeBounce(
                          color: FlutterFlowTheme.of(context).barra,
                          size: 24.0,
                        ),
                      ),
                    );
                  }

                  final columnUsersRecord = snapshot.data!;

                  return SingleChildScrollView(
                    controller: _model.columnController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/logo_Encuestas_sin_fondo.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.fitWidth,
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation']!),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Membresia',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMediumFamily,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .headlineMediumIsCustom,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation1']!),
                                      Text(
                                        '${columnUsersRecord.nombres} ${columnUsersRecord.apPaterno} ${columnUsersRecord.apMaterno}',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation2']!),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 20.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 15.0, 5.0, 5.0),
                                          child: TextFormField(
                                            controller: _model
                                                    .membresiaIDTextController ??=
                                                TextEditingController(
                                              text:
                                                  editarMembresiaMembresiasRecord
                                                      .membresiaID,
                                            ),
                                            focusNode:
                                                _model.membresiaIDFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.characters,
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Membresía ID (6 digitos)',
                                              hintText: '6 Caracteres',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .membresiaIDTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .characters),
                                                  );
                                                }),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 10.0, 5.0, 5.0),
                                          child: TextFormField(
                                            controller: _model
                                                    .descripcionTextController ??=
                                                TextEditingController(
                                              text:
                                                  editarMembresiaMembresiasRecord
                                                      .descripcion,
                                            ),
                                            focusNode:
                                                _model.descripcionFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Descripción',
                                              hintText: 'Tipo de Membresía',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            validator: _model
                                                .descripcionTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 10.0, 5.0, 5.0),
                                          child: TextFormField(
                                            controller: _model
                                                    .encuestasTextController ??=
                                                TextEditingController(
                                              text:
                                                  editarMembresiaMembresiasRecord
                                                      .paqueteEncuestas
                                                      .toString(),
                                            ),
                                            focusNode:
                                                _model.encuestasFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Encuestas Disponibles',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .encuestasTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 10.0, 5.0, 5.0),
                                          child: TextFormField(
                                            controller: _model
                                                    .personasTextController ??=
                                                TextEditingController(
                                              text:
                                                  editarMembresiaMembresiasRecord
                                                      .paquetePersonas
                                                      .toString(),
                                            ),
                                            focusNode: _model.personasFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Paquete de Personas Disponibles\n',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .personasTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Membresía Activa',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                            Switch.adaptive(
                                              value: _model
                                                      .switchActivaValue ??=
                                                  editarMembresiaMembresiasRecord
                                                      .activa,
                                              onChanged: (newValue) async {
                                                safeSetState(() =>
                                                    _model.switchActivaValue =
                                                        newValue);
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    editarMembresiaMembresiasRecord
                                                        .logo,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'EDITAR_MEMBRESIA_ACTUALIZAR_LOGOTIPO_BTN');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      maxWidth: 512.00,
                                                      maxHeight: 512.00,
                                                      imageQuality: 60,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading_uploadDataAcr =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                      originalFilename:
                                                                          m.originalFilename,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading_uploadDataAcr =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile_uploadDataAcr =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Archivo cargado con éxito!');
                                                      } else {
                                                        safeSetState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Fallo en la carga de Archivo');
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  text: 'Actualizar Logotipo',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .success,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (!editarMembresiaMembresiasRecord
                                                .usuariosDesactivados)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'EDITAR_MEMBRESIA_DESACTIVAR_USUARIOS_BTN');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    await actions
                                                        .godDesactivarPromotores(
                                                      widget.membresia!,
                                                    );
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                CustomAlertWidget(
                                                              titulo:
                                                                  'Terminado',
                                                              mensaje:
                                                                  'Se han Desactivado los Usuarios',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  text: 'Desactivar Usuarios',
                                                  options: FFButtonOptions(
                                                    width: 140.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .resaltado,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            if (editarMembresiaMembresiasRecord
                                                .usuariosDesactivados)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'EDITAR_MEMBRESIA_REACTIVAR_USUARIOS_BTN_');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    await actions
                                                        .godReactivarPromotores(
                                                      widget.membresia!,
                                                    );
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                CustomAlertWidget(
                                                              titulo:
                                                                  'Terminado',
                                                              mensaje:
                                                                  'Se han Reactivado los Usuarios',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  text: 'Reactivar Usuarios',
                                                  options: FFButtonOptions(
                                                    width: 140.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .resaltado,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 25.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'EDITAR_MEMBRESIA_PAGE_GUARDAR_BTN_ON_TAP');
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
                                        HapticFeedback.lightImpact();

                                        await editarMembresiaMembresiasRecord
                                            .reference
                                            .update(createMembresiasRecordData(
                                          descripcion: _model
                                              .descripcionTextController.text,
                                          paquetePersonas: int.tryParse(_model
                                              .personasTextController.text),
                                          activa: _model.switchActivaValue,
                                          paqueteEncuestas: int.tryParse(_model
                                              .encuestasTextController.text),
                                        ));
                                        _model.raizPromovido =
                                            await queryPromovidosRecordOnce(
                                          queryBuilder: (promovidosRecord) =>
                                              promovidosRecord.where(
                                            'email',
                                            isEqualTo: columnUsersRecord.email,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.raizPromovido?.reference !=
                                            null) {
                                          if (!(currentUserDocument?.hijos
                                                      .toList() ??
                                                  [])
                                              .contains(columnUsersRecord
                                                  .reference)) {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'Hijos':
                                                      FieldValue.arrayUnion([
                                                    columnUsersRecord.reference
                                                  ]),
                                                },
                                              ),
                                            });
                                          }
                                          if (!(currentUserDocument
                                                      ?.hijoaPromovidos
                                                      .toList() ??
                                                  [])
                                              .contains(_model
                                                  .raizPromovido?.reference)) {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'HijoaPromovidos':
                                                      FieldValue.arrayUnion([
                                                    _model.raizPromovido
                                                        ?.reference
                                                  ]),
                                                },
                                              ),
                                            });
                                          }
                                        } else {
                                          var promovidosRecordReference =
                                              PromovidosRecord.collection.doc();
                                          await promovidosRecordReference
                                              .set(createPromovidosRecordData(
                                            nombres: columnUsersRecord.nombres,
                                            apPaterno:
                                                columnUsersRecord.apPaterno,
                                            apMaterno:
                                                columnUsersRecord.apMaterno,
                                            fechaNac:
                                                columnUsersRecord.fechaNac,
                                            email: columnUsersRecord.email,
                                            padre: currentUserReference,
                                            phoneNumber:
                                                columnUsersRecord.phoneNumber,
                                            userRef:
                                                columnUsersRecord.reference,
                                            nivel: columnUsersRecord.nivel,
                                            promotor: true,
                                            membresia:
                                                editarMembresiaMembresiasRecord
                                                    .reference,
                                            photoUrl:
                                                columnUsersRecord.photoUrl,
                                            diaNac: functions.diaNacimiento(
                                                columnUsersRecord.fechaNac),
                                            mesNac: functions.mesNacimiento(
                                                columnUsersRecord.fechaNac),
                                            fecha: getCurrentTimestamp,
                                            gps: currentUserLocationValue,
                                          ));
                                          _model.nuevoHijoPromovido =
                                              PromovidosRecord
                                                  .getDocumentFromData(
                                                      createPromovidosRecordData(
                                                        nombres:
                                                            columnUsersRecord
                                                                .nombres,
                                                        apPaterno:
                                                            columnUsersRecord
                                                                .apPaterno,
                                                        apMaterno:
                                                            columnUsersRecord
                                                                .apMaterno,
                                                        fechaNac:
                                                            columnUsersRecord
                                                                .fechaNac,
                                                        email: columnUsersRecord
                                                            .email,
                                                        padre:
                                                            currentUserReference,
                                                        phoneNumber:
                                                            columnUsersRecord
                                                                .phoneNumber,
                                                        userRef:
                                                            columnUsersRecord
                                                                .reference,
                                                        nivel: columnUsersRecord
                                                            .nivel,
                                                        promotor: true,
                                                        membresia:
                                                            editarMembresiaMembresiasRecord
                                                                .reference,
                                                        photoUrl:
                                                            columnUsersRecord
                                                                .photoUrl,
                                                        diaNac: functions
                                                            .diaNacimiento(
                                                                columnUsersRecord
                                                                    .fechaNac),
                                                        mesNac: functions
                                                            .mesNacimiento(
                                                                columnUsersRecord
                                                                    .fechaNac),
                                                        fecha:
                                                            getCurrentTimestamp,
                                                        gps:
                                                            currentUserLocationValue,
                                                      ),
                                                      promovidosRecordReference);

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'HijoaPromovidos':
                                                    FieldValue.arrayUnion([
                                                  _model.nuevoHijoPromovido
                                                      ?.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        }

                                        await columnUsersRecord.reference
                                            .update(createUsersRecordData(
                                          padre: currentUserReference,
                                        ));
                                        if ((_model.uploadedLocalFile_uploadDataAcr
                                                    .bytes?.isNotEmpty ??
                                                false)) {
                                          {
                                            safeSetState(() => _model
                                                    .isDataUploading_uploadDataLogo =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .uploadedLocalFile_uploadDataAcr
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [
                                                      _model
                                                          .uploadedLocalFile_uploadDataAcr
                                                    ]
                                                  : <FFUploadedFile>[];
                                              selectedMedia =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                              );
                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading_uploadDataLogo =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadDataLogo =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_uploadDataLogo =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          await editarMembresiaMembresiasRecord
                                              .reference
                                              .update(
                                                  createMembresiasRecordData(
                                            logo: _model
                                                .uploadedFileUrl_uploadDataLogo,
                                          ));
                                        }
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Color(0x00000000),
                                          isDismissible: false,
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
                                                  titulo: 'Membresía',
                                                  mensaje:
                                                      'Membresia actualizada correctamente',
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        safeSetState(() {});
                                      },
                                      text: 'Guardar',
                                      icon: Icon(
                                        Icons.save,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
