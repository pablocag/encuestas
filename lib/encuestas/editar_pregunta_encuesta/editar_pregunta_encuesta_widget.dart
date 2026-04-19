import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'editar_pregunta_encuesta_model.dart';
export 'editar_pregunta_encuesta_model.dart';

class EditarPreguntaEncuestaWidget extends StatefulWidget {
  const EditarPreguntaEncuestaWidget({
    super.key,
    required this.pregunta,
  });

  final ModelosPreguntasEncuestaRecord? pregunta;

  static String routeName = 'editarPreguntaEncuesta';
  static String routePath = 'editarPreguntaEncuesta';

  @override
  State<EditarPreguntaEncuestaWidget> createState() =>
      _EditarPreguntaEncuestaWidgetState();
}

class _EditarPreguntaEncuestaWidgetState
    extends State<EditarPreguntaEncuestaWidget> with TickerProviderStateMixin {
  late EditarPreguntaEncuestaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarPreguntaEncuestaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'editarPreguntaEncuesta'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDITAR_PREGUNTA_ENCUESTA_editarPreguntaE');
      _model.dependePregunta = (widget.pregunta?.dependeDe != null) &&
          (widget.pregunta?.dependeDeRespuesta != null);
      _model.dependeFlujo = (widget.pregunta?.dependeDe != null) &&
          (widget.pregunta?.dependeDeRespuesta == null);
      safeSetState(() {});
    });

    _model.switchMultiValue = widget.pregunta!.multiSelect;
    _model.switchMostrarTextoValue = widget.pregunta!.showTextoConImagenes;
    _model.switchDependeValue = (widget.pregunta?.dependeDe != null) &&
        (widget.pregunta!.dependeDeRespuesta > 0);
    _model.switchDependeFlujoValue = (widget.pregunta?.dependeDe != null) &&
        ((widget.pregunta?.dependeDeRespuesta == null) ||
            (widget.pregunta?.dependeDeRespuesta == 0));
    _model.textFieldInfoTextController ??=
        TextEditingController(text: widget.pregunta?.informacion);
    _model.textFieldInfoFocusNode ??= FocusNode();

    _model.textFieldPreguntaTextController ??=
        TextEditingController(text: widget.pregunta?.pregunta);
    _model.textFieldPreguntaFocusNode ??= FocusNode();

    _model.textFieldR1TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta1);
    _model.textFieldR1FocusNode ??= FocusNode();

    _model.textFieldR2TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta2);
    _model.textFieldR2FocusNode ??= FocusNode();

    _model.textFieldR3TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta3);
    _model.textFieldR3FocusNode ??= FocusNode();

    _model.textFieldR4TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta4);
    _model.textFieldR4FocusNode ??= FocusNode();

    _model.textFieldR5TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta5);
    _model.textFieldR5FocusNode ??= FocusNode();

    _model.textFieldR6TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta6);
    _model.textFieldR6FocusNode ??= FocusNode();

    _model.textFieldR7TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta7);
    _model.textFieldR7FocusNode ??= FocusNode();

    _model.textFieldR8TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta8);
    _model.textFieldR8FocusNode ??= FocusNode();

    _model.textFieldR9TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta9);
    _model.textFieldR9FocusNode ??= FocusNode();

    _model.textFieldR10TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta10);
    _model.textFieldR10FocusNode ??= FocusNode();

    _model.textFieldR11TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta11);
    _model.textFieldR11FocusNode ??= FocusNode();

    _model.textFieldR12TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta12);
    _model.textFieldR12FocusNode ??= FocusNode();

    _model.textFieldR13TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta13);
    _model.textFieldR13FocusNode ??= FocusNode();

    _model.textFieldR14TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta14);
    _model.textFieldR14FocusNode ??= FocusNode();

    _model.textFieldR15TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta15);
    _model.textFieldR15FocusNode ??= FocusNode();

    _model.textFieldR16TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta16);
    _model.textFieldR16FocusNode ??= FocusNode();

    _model.textFieldR17TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta17);
    _model.textFieldR17FocusNode ??= FocusNode();

    _model.textFieldR18TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta18);
    _model.textFieldR18FocusNode ??= FocusNode();

    _model.textFieldR19TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta19);
    _model.textFieldR19FocusNode ??= FocusNode();

    _model.textFieldR20TextController ??=
        TextEditingController(text: widget.pregunta?.respuesta20);
    _model.textFieldR20FocusNode ??= FocusNode();

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
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
    return StreamBuilder<List<ModelosPreguntasEncuestaRecord>>(
      stream: queryModelosPreguntasEncuestaRecord(
        queryBuilder: (modelosPreguntasEncuestaRecord) =>
            modelosPreguntasEncuestaRecord
                .where(
                  'modeloEncuesta',
                  isEqualTo: widget.pregunta?.modeloEncuesta,
                )
                .orderBy('numero'),
      ),
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
        List<ModelosPreguntasEncuestaRecord>
            editarPreguntaEncuestaModelosPreguntasEncuestaRecordList =
            snapshot.data!;

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
                  logFirebaseEvent('EDITAR_PREGUNTA_ENCUESTA_chevron_left_ro');
                  context.pop();
                },
              ),
              title: Text(
                'Editar Pregunta de Encuesta',
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
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 20.0),
                  child: StreamBuilder<ModelosPreguntasEncuestaRecord>(
                    stream: ModelosPreguntasEncuestaRecord.getDocument(
                        widget.pregunta!.reference),
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

                      final columnModelosPreguntasEncuestaRecord =
                          snapshot.data!;

                      return SingleChildScrollView(
                        controller: _model.columnController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Image.asset(
                                    'assets/images/logo_Encuestas_sin_fondo.png',
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation1']!),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/PREGUNTAS.png',
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.contain,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'imageOnPageLoadAnimation2']!),
                              ],
                            ),
                            Material(
                              color: Colors.transparent,
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  controller:
                                      _model.columnPrincipalScrollController,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                'Número de Pregunta:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                formatNumber(
                                                  widget.pregunta!.numero,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.periodDecimal,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .checkDouble,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 32.0,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Es de Multiselección?',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Switch.adaptive(
                                                    value: _model
                                                        .switchMultiValue!,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .switchMultiValue =
                                                          newValue);
                                                    },
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    activeTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (valueOrDefault<bool>(
                                              widget.pregunta?.imagenes,
                                              false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.text_fields,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 32.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Mostrar Texto con Imágenes?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Switch.adaptive(
                                                      value: _model
                                                          .switchMostrarTextoValue!,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .switchMostrarTextoValue =
                                                            newValue);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      inactiveTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: FutureBuilder<int>(
                                                future:
                                                    queryModelosPreguntasEncuestaRecordCount(
                                                  queryBuilder:
                                                      (modelosPreguntasEncuestaRecord) =>
                                                          modelosPreguntasEncuestaRecord
                                                              .where(
                                                                'modeloEncuesta',
                                                                isEqualTo: widget
                                                                    .pregunta
                                                                    ?.modeloEncuesta,
                                                              )
                                                              .orderBy(
                                                                  'numero'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 24.0,
                                                        height: 24.0,
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .barra,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  int rowCount = snapshot.data!;

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .question_answer_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 32.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Depende de una respuesta \nde una pregunta anterior?',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (rowCount > 0)
                                                        Switch.adaptive(
                                                          value: _model
                                                              .switchDependeValue!,
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.switchDependeValue =
                                                                    newValue);
                                                            if (newValue) {
                                                              logFirebaseEvent(
                                                                  'EDITAR_PREGUNTA_ENCUESTA_SwitchDepende_O');
                                                              _model.dependePregunta =
                                                                  true;
                                                              _model.dependeFlujo =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'EDITAR_PREGUNTA_ENCUESTA_SwitchDepende_O');
                                                              _model.dependePregunta =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          inactiveTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          inactiveThumbColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: FutureBuilder<int>(
                                                future:
                                                    queryModelosPreguntasEncuestaRecordCount(
                                                  queryBuilder:
                                                      (modelosPreguntasEncuestaRecord) =>
                                                          modelosPreguntasEncuestaRecord
                                                              .where(
                                                                'modeloEncuesta',
                                                                isEqualTo: widget
                                                                    .pregunta
                                                                    ?.modeloEncuesta,
                                                              )
                                                              .orderBy(
                                                                  'numero'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 24.0,
                                                        height: 24.0,
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .barra,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  int rowCount = snapshot.data!;

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .low_priority_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 32.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Depende de una pregunta anterior?',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (rowCount > 0)
                                                        Switch.adaptive(
                                                          value: _model
                                                              .switchDependeFlujoValue!,
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.switchDependeFlujoValue =
                                                                    newValue);
                                                            if (newValue) {
                                                              logFirebaseEvent(
                                                                  'EDITAR_PREGUNTA_ENCUESTA_SwitchDependeFl');
                                                              _model.dependeFlujo =
                                                                  true;
                                                              _model.dependePregunta =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'EDITAR_PREGUNTA_ENCUESTA_SwitchDependeFl');
                                                              _model.dependeFlujo =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          inactiveTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          inactiveThumbColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            if (_model.dependePregunta ||
                                                _model.dependeFlujo)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                ModelosPreguntasEncuestaRecord>>(
                                                          stream:
                                                              queryModelosPreguntasEncuestaRecord(
                                                            queryBuilder:
                                                                (modelosPreguntasEncuestaRecord) =>
                                                                    modelosPreguntasEncuestaRecord
                                                                        .where(
                                                                          'modeloEncuesta',
                                                                          isEqualTo: widget
                                                                              .pregunta
                                                                              ?.modeloEncuesta,
                                                                        )
                                                                        .where(
                                                                          'numero',
                                                                          isLessThan: widget
                                                                              .pregunta
                                                                              ?.numero,
                                                                        )
                                                                        .orderBy(
                                                                            'numero'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  child:
                                                                      SpinKitThreeBounce(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .barra,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ModelosPreguntasEncuestaRecord>
                                                                container1ModelosPreguntasEncuestaRecordList =
                                                                snapshot.data!;

                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                              ),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          int>(
                                                                    controller: _model
                                                                            .dropDownValueController1 ??=
                                                                        FormFieldController<
                                                                            int>(
                                                                      _model
                                                                          .dropDownValue1 ??= widget.pregunta?.dependeDe ==
                                                                              null
                                                                          ? 1
                                                                          : valueOrDefault<
                                                                              int>(
                                                                              container1ModelosPreguntasEncuestaRecordList.where((e) => e.reference == widget.pregunta?.dependeDe).toList().firstOrNull?.numero,
                                                                              1,
                                                                            ),
                                                                    ),
                                                                    options: List<int>.from(container1ModelosPreguntasEncuestaRecordList
                                                                        .map((e) =>
                                                                            e.numero)
                                                                        .toList()),
                                                                    optionLabels: functions.concatenarDosArreglos(
                                                                        container1ModelosPreguntasEncuestaRecordList
                                                                            .map((e) => formatNumber(
                                                                                  e.numero,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ))
                                                                            .toList(),
                                                                        container1ModelosPreguntasEncuestaRecordList.map((e) => e.pregunta).toList()),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.dropDownValue1 =
                                                                                val),
                                                                    width:
                                                                        180.0,
                                                                    height:
                                                                        50.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              Colors.black,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintText:
                                                                        'Selecciona una Pregunta',
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .chevronDown,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        Colors
                                                                            .white,
                                                                    borderWidth:
                                                                        1.0,
                                                                    borderRadius:
                                                                        0.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dependePregunta)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                ModelosPreguntasEncuestaRecord>>(
                                                          stream:
                                                              queryModelosPreguntasEncuestaRecord(
                                                            queryBuilder:
                                                                (modelosPreguntasEncuestaRecord) =>
                                                                    modelosPreguntasEncuestaRecord
                                                                        .where(
                                                                          'modeloEncuesta',
                                                                          isEqualTo: widget
                                                                              .pregunta
                                                                              ?.modeloEncuesta,
                                                                        )
                                                                        .where(
                                                                          'numero',
                                                                          isEqualTo:
                                                                              _model.dropDownValue1,
                                                                        ),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  child:
                                                                      SpinKitThreeBounce(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .barra,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ModelosPreguntasEncuestaRecord>
                                                                containerModelosPreguntasEncuestaRecordList =
                                                                snapshot.data!;
                                                            final containerModelosPreguntasEncuestaRecord =
                                                                containerModelosPreguntasEncuestaRecordList
                                                                        .isNotEmpty
                                                                    ? containerModelosPreguntasEncuestaRecordList
                                                                        .first
                                                                    : null;

                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        int>(
                                                                  controller: _model
                                                                          .dropDownValueController2 ??=
                                                                      FormFieldController<
                                                                          int>(
                                                                    _model.dropDownValue2 ??= widget
                                                                        .pregunta
                                                                        ?.dependeDeRespuesta,
                                                                  ),
                                                                  options: List<
                                                                          int>.from(
                                                                      functions
                                                                          .crearListaDeRespuestas(
                                                                              containerModelosPreguntasEncuestaRecord!)),
                                                                  optionLabels:
                                                                      functions
                                                                          .crearListaDeRespuestas(
                                                                              containerModelosPreguntasEncuestaRecord)
                                                                          .map((e) =>
                                                                              formatNumber(
                                                                                e,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.periodDecimal,
                                                                              ))
                                                                          .toList(),
                                                                  onChanged: (val) =>
                                                                      safeSetState(() =>
                                                                          _model.dropDownValue2 =
                                                                              val),
                                                                  width: 180.0,
                                                                  height: 50.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  hintText:
                                                                      'Selecciona una Respuesta',
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .chevronDown,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    size: 15.0,
                                                                  ),
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      Colors
                                                                          .white,
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderRadius:
                                                                      0.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .textFieldInfoTextController,
                                                focusNode: _model
                                                    .textFieldInfoFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textFieldInfoTextController',
                                                  Duration(milliseconds: 2000),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Texto de Información Preliminar',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallIsCustom,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  prefixIcon: Icon(
                                                    Icons.text_fields,
                                                    color: Colors.black,
                                                  ),
                                                  suffixIcon: _model
                                                          .textFieldInfoTextController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .textFieldInfoTextController
                                                                ?.clear();
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: Colors.black,
                                                            size: 22.0,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                maxLines: 6,
                                                validator: _model
                                                    .textFieldInfoTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .textFieldPreguntaTextController,
                                                focusNode: _model
                                                    .textFieldPreguntaFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textFieldPreguntaTextController',
                                                  Duration(milliseconds: 2000),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Texto de la Pregunta: ',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallIsCustom,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  prefixIcon: Icon(
                                                    Icons.text_fields,
                                                    color: Colors.black,
                                                  ),
                                                  suffixIcon: _model
                                                          .textFieldPreguntaTextController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .textFieldPreguntaTextController
                                                                ?.clear();
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: Colors.black,
                                                            size: 22.0,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                maxLines: 6,
                                                validator: _model
                                                    .textFieldPreguntaTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 6.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child:
                                                      FlutterFlowDropDown<int>(
                                                    controller: _model
                                                            .dropDownValueController3 ??=
                                                        FormFieldController<
                                                            int>(
                                                      _model.dropDownValue3 ??=
                                                          widget.pregunta
                                                              ?.numRespuestas,
                                                    ),
                                                    options: List<int>.from([
                                                      2,
                                                      3,
                                                      4,
                                                      5,
                                                      6,
                                                      7,
                                                      8,
                                                      9,
                                                      10
                                                    ]),
                                                    optionLabels: [
                                                      '2 Respuestas',
                                                      '3 Respuestas',
                                                      '4 Respuestas',
                                                      '5 Respuestas',
                                                      '6 Respuestas',
                                                      '7 Respuestas',
                                                      '8 Respuestas',
                                                      '9 Respuestas',
                                                      '10 Respuestas'
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .dropDownValue3 =
                                                            val),
                                                    width: 180.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                    hintText:
                                                        'Selecciona un Tipo de Pregunta',
                                                    icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .chevronDown,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      size: 15.0,
                                                    ),
                                                    fillColor: Colors.white,
                                                    elevation: 2.0,
                                                    borderColor: Colors.white,
                                                    borderWidth: 1.0,
                                                    borderRadius: 0.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (_model.dropDownValue3! >= 2)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR1TextController,
                                                        focusNode: _model
                                                            .textFieldR1FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR1TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 1',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR1TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR1TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR1TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen1,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg1 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg1 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg1 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg1 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg1 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen1 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen1 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen1)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen1: _model
                                                                        .uploadedFileUrl_uploadDataImg1,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 2)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR2TextController,
                                                        focusNode: _model
                                                            .textFieldR2FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR2TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 2',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR2TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR2TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR2TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen2,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg2 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg2 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg2 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg2 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg2 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen2 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen2 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen2)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen2: _model
                                                                        .uploadedFileUrl_uploadDataImg2,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 3)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR3TextController,
                                                        focusNode: _model
                                                            .textFieldR3FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR3TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 3',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR3TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR3TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR3TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen3,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg3 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg3 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg3 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg3 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg3 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen3 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen3 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen3)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen3: _model
                                                                        .uploadedFileUrl_uploadDataImg3,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 4)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR4TextController,
                                                        focusNode: _model
                                                            .textFieldR4FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR4TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 4',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR4TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR4TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR4TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen4,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg4 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg4 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg4 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg4 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg4 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen4 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen4 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen4)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen4: _model
                                                                        .uploadedFileUrl_uploadDataImg4,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 5)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR5TextController,
                                                        focusNode: _model
                                                            .textFieldR5FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR5TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 5',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR5TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR5TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR5TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen5,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg5 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg5 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg5 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg5 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg5 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen5 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen5 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen5)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen5: _model
                                                                        .uploadedFileUrl_uploadDataImg5,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 6)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR6TextController,
                                                        focusNode: _model
                                                            .textFieldR6FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR6TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 6',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR6TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR6TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR6TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen6,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg6 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg6 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg6 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg6 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg6 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen6 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen6 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen6)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen6: _model
                                                                        .uploadedFileUrl_uploadDataImg6,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 7)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR7TextController,
                                                        focusNode: _model
                                                            .textFieldR7FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR7TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 7',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR7TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR7TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR7TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen7,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg7 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg7 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg7 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg7 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg7 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen7 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen7 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen7)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen7: _model
                                                                        .uploadedFileUrl_uploadDataImg7,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 8)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR8TextController,
                                                        focusNode: _model
                                                            .textFieldR8FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR8TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 8',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR8TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR8TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR8TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen8,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg8 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg8 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg8 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg8 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg8 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen8 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen8 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen8)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen8: _model
                                                                        .uploadedFileUrl_uploadDataImg8,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 9)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR9TextController,
                                                        focusNode: _model
                                                            .textFieldR9FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR9TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 9',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR9TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR9TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR9TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen9,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg9 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg9 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg9 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg9 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg9 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen9 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen9 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen9)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen9: _model
                                                                        .uploadedFileUrl_uploadDataImg9,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 10)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR10TextController,
                                                        focusNode: _model
                                                            .textFieldR10FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR10TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR10TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR10TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR10TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen10,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg10 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg10 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg10 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg10 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg10 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen10 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen10 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen10)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen10: _model
                                                                        .uploadedFileUrl_uploadDataImg10,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 11)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR11TextController,
                                                        focusNode: _model
                                                            .textFieldR11FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR11TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR11TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR11TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR11TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen11,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg11 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg11 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg11 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg11 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg11 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen11 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen11 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen11)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen11: _model
                                                                        .uploadedFileUrl_uploadDataImg11,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 12)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR12TextController,
                                                        focusNode: _model
                                                            .textFieldR12FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR12TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR12TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR12TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR12TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen12,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg12 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg12 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg12 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg12 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg12 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen12 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen12 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen12)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen12: _model
                                                                        .uploadedFileUrl_uploadDataImg12,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 13)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR13TextController,
                                                        focusNode: _model
                                                            .textFieldR13FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR13TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR13TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR13TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR13TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen13,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg13 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg13 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg13 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg13 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg13 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen13 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen13 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen13)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen13: _model
                                                                        .uploadedFileUrl_uploadDataImg13,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 14)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR14TextController,
                                                        focusNode: _model
                                                            .textFieldR14FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR14TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR14TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR14TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR14TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen14,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg14 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg14 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg14 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg14 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg14 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen14 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen14 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen14)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen14: _model
                                                                        .uploadedFileUrl_uploadDataImg14,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 15)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR15TextController,
                                                        focusNode: _model
                                                            .textFieldR15FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR15TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR15TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR15TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR15TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen15,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg15 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg15 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg15 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg15 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg15 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen15 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen15 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen15)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen15: _model
                                                                        .uploadedFileUrl_uploadDataImg15,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 16)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR16TextController,
                                                        focusNode: _model
                                                            .textFieldR16FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR16TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR16TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR16TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR16TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen16,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg16 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg16 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg16 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg16 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg16 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen16 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen16 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen16)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen16: _model
                                                                        .uploadedFileUrl_uploadDataImg16,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 17)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR17TextController,
                                                        focusNode: _model
                                                            .textFieldR17FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR17TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR17TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR17TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR17TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen17,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg17 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg17 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg17 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg17 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg17 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen17 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen17 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen17)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen17: _model
                                                                        .uploadedFileUrl_uploadDataImg17,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 18)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR18TextController,
                                                        focusNode: _model
                                                            .textFieldR18FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR18TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR18TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR18TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR18TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen18,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg18 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg18 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg18 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg18 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg18 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen18 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen18 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen18)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen18: _model
                                                                        .uploadedFileUrl_uploadDataImg18,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3! >= 19)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR19TextController,
                                                        focusNode: _model
                                                            .textFieldR19FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR19TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR19TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR19TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR19TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen19,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg19 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg19 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg19 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg19 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg19 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen19 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen19 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen19)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen19: _model
                                                                        .uploadedFileUrl_uploadDataImg19,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.dropDownValue3 == 20)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldR20TextController,
                                                        focusNode: _model
                                                            .textFieldR20FocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldR20TextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Respuesta 10',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .question_answer_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldR20TextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldR20TextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .textFieldR20TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      widget
                                                          .pregunta?.imagenes,
                                                      false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnModelosPreguntasEncuestaRecord
                                                                      .imagen20,
                                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/sin_imagen.jpg?alt=media&token=91c0f8d3-4b30-4fa3-a76a-7738aa71f363',
                                                                ),
                                                                width: 210.0,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              icon: Icon(
                                                                Icons
                                                                    .redo_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDITAR_PREGUNTA_ENCUESTA_redo_rounded_IC');
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      60,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataImg20 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Subiendo Archivo...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading_uploadDataImg20 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataImg20 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataImg20 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Archivo cargado con éxito!');
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Fallo en la carga de Archivo');
                                                                    return;
                                                                  }
                                                                }

                                                                if (_model.uploadedFileUrl_uploadDataImg20 !=
                                                                        '') {
                                                                  if (widget.pregunta
                                                                              ?.imagen20 !=
                                                                          null &&
                                                                      widget.pregunta
                                                                              ?.imagen20 !=
                                                                          '') {
                                                                    await FirebaseStorage
                                                                        .instance
                                                                        .refFromURL(widget
                                                                            .pregunta!
                                                                            .imagen20)
                                                                        .delete();
                                                                  }

                                                                  await widget
                                                                      .pregunta!
                                                                      .reference
                                                                      .update(
                                                                          createModelosPreguntasEncuestaRecordData(
                                                                    imagen20: _model
                                                                        .uploadedFileUrl_uploadDataImg20,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 25.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'EDITAR_PREGUNTA_ENCUESTA_EDITAR_PREGUNTA');
                                                  var _shouldSetState = false;
                                                  HapticFeedback.lightImpact();
                                                  _model.hayEncuestasHechas =
                                                      await queryEncuestasRecordCount(
                                                    queryBuilder:
                                                        (encuestasRecord) =>
                                                            encuestasRecord
                                                                .where(
                                                      'modeloEncuesta',
                                                      isEqualTo: widget
                                                          .pregunta
                                                          ?.modeloEncuesta,
                                                    ),
                                                  );
                                                  _shouldSetState = true;
                                                  if (_model
                                                          .hayEncuestasHechas! >
                                                      0) {
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
                                                                  'Encuesta en Uso!',
                                                              mensaje:
                                                                  'Existen Encuestas levantadas con este Modelo, por lo que no puede editar.',
                                                              alerta: true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  } else {
                                                    if (_model.formKey
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    if (_model
                                                        .dependePregunta) {
                                                      _model.respuestaOcupada =
                                                          await queryModelosPreguntasEncuestaRecordOnce(
                                                        queryBuilder:
                                                            (modelosPreguntasEncuestaRecord) =>
                                                                modelosPreguntasEncuestaRecord
                                                                    .where(
                                                                      'modeloEncuesta',
                                                                      isEqualTo: widget
                                                                          .pregunta
                                                                          ?.modeloEncuesta,
                                                                    )
                                                                    .where(
                                                                      'dependeDe',
                                                                      isEqualTo: editarPreguntaEncuestaModelosPreguntasEncuestaRecordList
                                                                          .elementAtOrNull((_model.dropDownValue1!) -
                                                                              1)
                                                                          ?.reference,
                                                                    )
                                                                    .where(
                                                                      'dependeDeRespuesta',
                                                                      isEqualTo:
                                                                          _model
                                                                              .dropDownValue2,
                                                                    ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      _shouldSetState = true;
                                                      if (_model
                                                                  .respuestaOcupada
                                                                  ?.reference
                                                                  .id !=
                                                              null &&
                                                          _model
                                                                  .respuestaOcupada
                                                                  ?.reference
                                                                  .id !=
                                                              '') {
                                                        if (_model
                                                                .respuestaOcupada
                                                                ?.numero !=
                                                            widget.pregunta
                                                                ?.numero) {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
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
                                                                        'Flujo Bloqueado!',
                                                                    mensaje:
                                                                        'La Respuesta de la que depende esta Pregunta ya ha sido utilizada, por favor modifique este Flujo seleccionando otra respuesta.',
                                                                    alerta:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      }
                                                    } else {
                                                      if (_model.dependeFlujo) {
                                                        _model.preguntaDelDropdown1 =
                                                            await queryModelosPreguntasEncuestaRecordOnce(
                                                          queryBuilder:
                                                              (modelosPreguntasEncuestaRecord) =>
                                                                  modelosPreguntasEncuestaRecord
                                                                      .where(
                                                                        'modeloEncuesta',
                                                                        isEqualTo: widget
                                                                            .pregunta
                                                                            ?.modeloEncuesta,
                                                                      )
                                                                      .where(
                                                                        'numero',
                                                                        isEqualTo:
                                                                            _model.dropDownValue1,
                                                                      ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _shouldSetState = true;
                                                        _model.preguntaOcupadaF =
                                                            await queryModelosPreguntasEncuestaRecordOnce(
                                                          queryBuilder:
                                                              (modelosPreguntasEncuestaRecord) =>
                                                                  modelosPreguntasEncuestaRecord
                                                                      .where(
                                                            'dependeDe',
                                                            isEqualTo: _model
                                                                .preguntaDelDropdown1
                                                                ?.reference,
                                                          ),
                                                        );
                                                        _shouldSetState = true;
                                                        if (_model
                                                                .preguntaOcupadaF!
                                                                .length >
                                                            0) {
                                                          if ((_model.preguntaOcupadaF!
                                                                      .where((e) =>
                                                                          e.dependeDe ==
                                                                          _model
                                                                              .preguntaDelDropdown1
                                                                              ?.reference)
                                                                      .toList()
                                                                      .length >
                                                                  0) &&
                                                              (_model.preguntaOcupadaF
                                                                      ?.where((e) =>
                                                                          e.dependeDe ==
                                                                          _model
                                                                              .preguntaDelDropdown1
                                                                              ?.reference)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.numero !=
                                                                  widget
                                                                      .pregunta
                                                                      ?.numero)) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
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
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        CustomAlertWidget(
                                                                      titulo:
                                                                          'Flujo Bloqueado!',
                                                                      mensaje:
                                                                          'La Pregunta de la que depende esta Pregunta ya ha sido utilizada, por favor modifique este Flujo seleccionando otra pregunta.',
                                                                      alerta:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        }
                                                      }
                                                    }

                                                    if (_model.dropDownValue3 ==
                                                        2) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          pregunta: (String
                                                              cadena) {
                                                            return cadena
                                                                .replaceAll(
                                                                    ',', '');
                                                          }(_model
                                                              .textFieldPreguntaTextController
                                                              .text),
                                                          informacion: _model
                                                              .textFieldInfoTextController
                                                              .text,
                                                          multiSelect: _model
                                                              .switchMultiValue,
                                                          respuesta1: _model
                                                              .textFieldR1TextController
                                                              .text,
                                                          respuesta2: _model
                                                              .textFieldR2TextController
                                                              .text,
                                                          numRespuestas: _model
                                                              .dropDownValue3,
                                                          showTextoConImagenes:
                                                              _model
                                                                  .switchMostrarTextoValue,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'respuesta3':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta4':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta5':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta6':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta7':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta8':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta9':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta10':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        3) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          pregunta: (String
                                                              cadena) {
                                                            return cadena
                                                                .replaceAll(
                                                                    ',', '');
                                                          }(_model
                                                              .textFieldPreguntaTextController
                                                              .text),
                                                          informacion: _model
                                                              .textFieldInfoTextController
                                                              .text,
                                                          multiSelect: _model
                                                              .switchMultiValue,
                                                          respuesta1: _model
                                                              .textFieldR1TextController
                                                              .text,
                                                          respuesta2: _model
                                                              .textFieldR2TextController
                                                              .text,
                                                          numRespuestas: _model
                                                              .dropDownValue3,
                                                          respuesta3: _model
                                                              .textFieldR3TextController
                                                              .text,
                                                          showTextoConImagenes:
                                                              _model
                                                                  .switchMostrarTextoValue,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'respuesta4':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta5':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta6':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta7':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta8':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta9':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta10':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        4) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          pregunta: (String
                                                              cadena) {
                                                            return cadena
                                                                .replaceAll(
                                                                    ',', '');
                                                          }(_model
                                                              .textFieldPreguntaTextController
                                                              .text),
                                                          informacion: _model
                                                              .textFieldInfoTextController
                                                              .text,
                                                          multiSelect: _model
                                                              .switchMultiValue,
                                                          respuesta1: _model
                                                              .textFieldR1TextController
                                                              .text,
                                                          respuesta2: _model
                                                              .textFieldR2TextController
                                                              .text,
                                                          numRespuestas: _model
                                                              .dropDownValue3,
                                                          respuesta3: _model
                                                              .textFieldR3TextController
                                                              .text,
                                                          respuesta4: _model
                                                              .textFieldR4TextController
                                                              .text,
                                                          showTextoConImagenes:
                                                              _model
                                                                  .switchMostrarTextoValue,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'respuesta5':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta6':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta7':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta8':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta9':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta10':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        5) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          pregunta: (String
                                                              cadena) {
                                                            return cadena
                                                                .replaceAll(
                                                                    ',', '');
                                                          }(_model
                                                              .textFieldPreguntaTextController
                                                              .text),
                                                          informacion: _model
                                                              .textFieldInfoTextController
                                                              .text,
                                                          multiSelect: _model
                                                              .switchMultiValue,
                                                          respuesta1: _model
                                                              .textFieldR1TextController
                                                              .text,
                                                          respuesta2: _model
                                                              .textFieldR2TextController
                                                              .text,
                                                          numRespuestas: _model
                                                              .dropDownValue3,
                                                          respuesta3: _model
                                                              .textFieldR3TextController
                                                              .text,
                                                          respuesta4: _model
                                                              .textFieldR4TextController
                                                              .text,
                                                          respuesta5: _model
                                                              .textFieldR5TextController
                                                              .text,
                                                          showTextoConImagenes:
                                                              _model
                                                                  .switchMostrarTextoValue,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'respuesta6':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta7':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta8':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta9':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta10':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        6) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          pregunta: (String
                                                              cadena) {
                                                            return cadena
                                                                .replaceAll(
                                                                    ',', '');
                                                          }(_model
                                                              .textFieldPreguntaTextController
                                                              .text),
                                                          informacion: _model
                                                              .textFieldInfoTextController
                                                              .text,
                                                          multiSelect: _model
                                                              .switchMultiValue,
                                                          respuesta1: _model
                                                              .textFieldR1TextController
                                                              .text,
                                                          respuesta2: _model
                                                              .textFieldR2TextController
                                                              .text,
                                                          numRespuestas: _model
                                                              .dropDownValue3,
                                                          respuesta3: _model
                                                              .textFieldR3TextController
                                                              .text,
                                                          respuesta4: _model
                                                              .textFieldR4TextController
                                                              .text,
                                                          respuesta5: _model
                                                              .textFieldR5TextController
                                                              .text,
                                                          respuesta6: _model
                                                              .textFieldR6TextController
                                                              .text,
                                                          showTextoConImagenes:
                                                              _model
                                                                  .switchMostrarTextoValue,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'respuesta7':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta8':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta9':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta10':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        7) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          pregunta: (String
                                                              cadena) {
                                                            return cadena
                                                                .replaceAll(
                                                                    ',', '');
                                                          }(_model
                                                              .textFieldPreguntaTextController
                                                              .text),
                                                          informacion: _model
                                                              .textFieldInfoTextController
                                                              .text,
                                                          multiSelect: _model
                                                              .switchMultiValue,
                                                          respuesta1: _model
                                                              .textFieldR1TextController
                                                              .text,
                                                          respuesta2: _model
                                                              .textFieldR2TextController
                                                              .text,
                                                          numRespuestas: _model
                                                              .dropDownValue3,
                                                          respuesta3: _model
                                                              .textFieldR3TextController
                                                              .text,
                                                          respuesta4: _model
                                                              .textFieldR4TextController
                                                              .text,
                                                          respuesta5: _model
                                                              .textFieldR5TextController
                                                              .text,
                                                          respuesta6: _model
                                                              .textFieldR6TextController
                                                              .text,
                                                          respuesta7: _model
                                                              .textFieldR7TextController
                                                              .text,
                                                          showTextoConImagenes:
                                                              _model
                                                                  .switchMostrarTextoValue,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'respuesta8':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta9':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta10':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        8) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          pregunta: (String
                                                              cadena) {
                                                            return cadena
                                                                .replaceAll(
                                                                    ',', '');
                                                          }(_model
                                                              .textFieldPreguntaTextController
                                                              .text),
                                                          informacion: _model
                                                              .textFieldInfoTextController
                                                              .text,
                                                          multiSelect: _model
                                                              .switchMultiValue,
                                                          respuesta1: _model
                                                              .textFieldR1TextController
                                                              .text,
                                                          respuesta2: _model
                                                              .textFieldR2TextController
                                                              .text,
                                                          numRespuestas: _model
                                                              .dropDownValue3,
                                                          respuesta3: _model
                                                              .textFieldR3TextController
                                                              .text,
                                                          respuesta4: _model
                                                              .textFieldR4TextController
                                                              .text,
                                                          respuesta5: _model
                                                              .textFieldR5TextController
                                                              .text,
                                                          respuesta6: _model
                                                              .textFieldR6TextController
                                                              .text,
                                                          respuesta7: _model
                                                              .textFieldR7TextController
                                                              .text,
                                                          respuesta8: _model
                                                              .textFieldR8TextController
                                                              .text,
                                                          showTextoConImagenes:
                                                              _model
                                                                  .switchMostrarTextoValue,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'respuesta9':
                                                                FieldValue
                                                                    .delete(),
                                                            'respuesta10':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        9) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          pregunta: (String
                                                              cadena) {
                                                            return cadena
                                                                .replaceAll(
                                                                    ',', '');
                                                          }(_model
                                                              .textFieldPreguntaTextController
                                                              .text),
                                                          informacion: _model
                                                              .textFieldInfoTextController
                                                              .text,
                                                          multiSelect: _model
                                                              .switchMultiValue,
                                                          respuesta1: _model
                                                              .textFieldR1TextController
                                                              .text,
                                                          respuesta2: _model
                                                              .textFieldR2TextController
                                                              .text,
                                                          numRespuestas: _model
                                                              .dropDownValue3,
                                                          respuesta3: _model
                                                              .textFieldR3TextController
                                                              .text,
                                                          respuesta4: _model
                                                              .textFieldR4TextController
                                                              .text,
                                                          respuesta5: _model
                                                              .textFieldR5TextController
                                                              .text,
                                                          respuesta6: _model
                                                              .textFieldR6TextController
                                                              .text,
                                                          respuesta7: _model
                                                              .textFieldR7TextController
                                                              .text,
                                                          respuesta8: _model
                                                              .textFieldR8TextController
                                                              .text,
                                                          respuesta9: _model
                                                              .textFieldR9TextController
                                                              .text,
                                                          showTextoConImagenes:
                                                              _model
                                                                  .switchMostrarTextoValue,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'respuesta10':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        10) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        11) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        12) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        13) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                        respuesta13: _model
                                                            .textFieldR13TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        14) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                        respuesta13: _model
                                                            .textFieldR13TextController
                                                            .text,
                                                        respuesta14: _model
                                                            .textFieldR14TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        15) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                        respuesta13: _model
                                                            .textFieldR13TextController
                                                            .text,
                                                        respuesta14: _model
                                                            .textFieldR14TextController
                                                            .text,
                                                        respuesta15: _model
                                                            .textFieldR15TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        16) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                        respuesta13: _model
                                                            .textFieldR13TextController
                                                            .text,
                                                        respuesta14: _model
                                                            .textFieldR14TextController
                                                            .text,
                                                        respuesta15: _model
                                                            .textFieldR15TextController
                                                            .text,
                                                        respuesta16: _model
                                                            .textFieldR16TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        17) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                        respuesta13: _model
                                                            .textFieldR13TextController
                                                            .text,
                                                        respuesta14: _model
                                                            .textFieldR14TextController
                                                            .text,
                                                        respuesta15: _model
                                                            .textFieldR15TextController
                                                            .text,
                                                        respuesta16: _model
                                                            .textFieldR16TextController
                                                            .text,
                                                        respuesta17: _model
                                                            .textFieldR17TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        18) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                        respuesta13: _model
                                                            .textFieldR13TextController
                                                            .text,
                                                        respuesta14: _model
                                                            .textFieldR14TextController
                                                            .text,
                                                        respuesta15: _model
                                                            .textFieldR15TextController
                                                            .text,
                                                        respuesta16: _model
                                                            .textFieldR16TextController
                                                            .text,
                                                        respuesta17: _model
                                                            .textFieldR17TextController
                                                            .text,
                                                        respuesta18: _model
                                                            .textFieldR18TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else if (_model
                                                            .dropDownValue3 ==
                                                        19) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                        respuesta13: _model
                                                            .textFieldR13TextController
                                                            .text,
                                                        respuesta14: _model
                                                            .textFieldR14TextController
                                                            .text,
                                                        respuesta15: _model
                                                            .textFieldR15TextController
                                                            .text,
                                                        respuesta16: _model
                                                            .textFieldR16TextController
                                                            .text,
                                                        respuesta17: _model
                                                            .textFieldR17TextController
                                                            .text,
                                                        respuesta18: _model
                                                            .textFieldR18TextController
                                                            .text,
                                                        respuesta19: _model
                                                            .textFieldR19TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update(
                                                              createModelosPreguntasEncuestaRecordData(
                                                        pregunta: (String
                                                            cadena) {
                                                          return cadena
                                                              .replaceAll(
                                                                  ',', '');
                                                        }(_model
                                                            .textFieldPreguntaTextController
                                                            .text),
                                                        informacion: _model
                                                            .textFieldInfoTextController
                                                            .text,
                                                        multiSelect: _model
                                                            .switchMultiValue,
                                                        respuesta1: _model
                                                            .textFieldR1TextController
                                                            .text,
                                                        respuesta2: _model
                                                            .textFieldR2TextController
                                                            .text,
                                                        numRespuestas: _model
                                                            .dropDownValue3,
                                                        respuesta3: _model
                                                            .textFieldR3TextController
                                                            .text,
                                                        respuesta4: _model
                                                            .textFieldR4TextController
                                                            .text,
                                                        respuesta5: _model
                                                            .textFieldR5TextController
                                                            .text,
                                                        respuesta6: _model
                                                            .textFieldR6TextController
                                                            .text,
                                                        respuesta7: _model
                                                            .textFieldR7TextController
                                                            .text,
                                                        respuesta8: _model
                                                            .textFieldR8TextController
                                                            .text,
                                                        respuesta9: _model
                                                            .textFieldR9TextController
                                                            .text,
                                                        respuesta10: _model
                                                            .textFieldR10TextController
                                                            .text,
                                                        showTextoConImagenes: _model
                                                            .switchMostrarTextoValue,
                                                        respuesta11: _model
                                                            .textFieldR11TextController
                                                            .text,
                                                        respuesta12: _model
                                                            .textFieldR12TextController
                                                            .text,
                                                        respuesta13: _model
                                                            .textFieldR13TextController
                                                            .text,
                                                        respuesta14: _model
                                                            .textFieldR14TextController
                                                            .text,
                                                        respuesta15: _model
                                                            .textFieldR15TextController
                                                            .text,
                                                        respuesta16: _model
                                                            .textFieldR16TextController
                                                            .text,
                                                        respuesta17: _model
                                                            .textFieldR17TextController
                                                            .text,
                                                        respuesta18: _model
                                                            .textFieldR18TextController
                                                            .text,
                                                        respuesta19: _model
                                                            .textFieldR19TextController
                                                            .text,
                                                        respuesta20: _model
                                                            .textFieldR20TextController
                                                            .text,
                                                      ));

                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDe':
                                                                FieldValue
                                                                    .delete(),
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    }

                                                    if (_model.dependeFlujo) {
                                                      await widget
                                                          .pregunta!.reference
                                                          .update({
                                                        ...createModelosPreguntasEncuestaRecordData(
                                                          dependeDe:
                                                              editarPreguntaEncuestaModelosPreguntasEncuestaRecordList
                                                                  .where((e) =>
                                                                      e.numero ==
                                                                      _model
                                                                          .dropDownValue1)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.reference,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'dependeDeRespuesta':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      if (_model
                                                          .dependePregunta) {
                                                        await widget
                                                            .pregunta!.reference
                                                            .update(
                                                                createModelosPreguntasEncuestaRecordData(
                                                          dependeDe:
                                                              editarPreguntaEncuestaModelosPreguntasEncuestaRecordList
                                                                  .where((e) =>
                                                                      e.numero ==
                                                                      _model
                                                                          .dropDownValue1)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.reference,
                                                          dependeDeRespuesta:
                                                              _model
                                                                  .dropDownValue2,
                                                        ));
                                                      }
                                                    }

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
                                                              titulo: 'Éxito!',
                                                              mensaje:
                                                                  'Pregunta actualizada con éxito!',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    context.safePop();
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'Editar Pregunta',
                                                icon: Icon(
                                                  Icons.edit_document,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 200.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'buttonOnPageLoadAnimation']!),
                                            ),
                                          ],
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
            ),
          ),
        );
      },
    );
  }
}
