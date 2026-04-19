import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nueva_pregunta_encuesta_libre_model.dart';
export 'nueva_pregunta_encuesta_libre_model.dart';

class NuevaPreguntaEncuestaLibreWidget extends StatefulWidget {
  const NuevaPreguntaEncuestaLibreWidget({
    super.key,
    required this.modelo,
  });

  final ModelosEncuestasRecord? modelo;

  static String routeName = 'nuevaPreguntaEncuestaLibre';
  static String routePath = 'nuevaPreguntaEncuestaLibre';

  @override
  State<NuevaPreguntaEncuestaLibreWidget> createState() =>
      _NuevaPreguntaEncuestaLibreWidgetState();
}

class _NuevaPreguntaEncuestaLibreWidgetState
    extends State<NuevaPreguntaEncuestaLibreWidget>
    with TickerProviderStateMixin {
  late NuevaPreguntaEncuestaLibreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevaPreguntaEncuestaLibreModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'nuevaPreguntaEncuestaLibre'});
    _model.switchDependeValue = _model.dependePregunta;
    _model.switchDependeFlujoValue = _model.dependeFlujo;
    _model.textFieldInfoTextController ??= TextEditingController();
    _model.textFieldInfoFocusNode ??= FocusNode();

    _model.textFieldPreguntaTextController ??= TextEditingController();
    _model.textFieldPreguntaFocusNode ??= FocusNode();

    _model.textFieldMinimoTextController ??= TextEditingController();
    _model.textFieldMinimoFocusNode ??= FocusNode();

    _model.textFieldMaximoTextController ??= TextEditingController();
    _model.textFieldMaximoFocusNode ??= FocusNode();

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
                  isEqualTo: widget.modelo?.reference,
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
            nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList =
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
                  logFirebaseEvent('NUEVA_PREGUNTA_ENCUESTA_LIBRE_chevron_le');
                  context.pop();
                },
              ),
              title: Text(
                'Nueva Pregunta de Encuesta',
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 20.0),
                child: SingleChildScrollView(
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
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation1']!),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/PREGUNTAS.png',
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.contain,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation2']!),
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
                            controller: _model.columnPrincipalScrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                              .modelo
                                                              ?.reference,
                                                        )
                                                        .orderBy('numero'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .barra,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            int rowCount = snapshot.data!;

                                            return Row(
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
                                                      Icon(
                                                        Icons
                                                            .question_answer_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                if (rowCount > 0)
                                                  Switch.adaptive(
                                                    value: _model
                                                        .switchDependeValue!,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .switchDependeValue =
                                                          newValue);
                                                      if (newValue) {
                                                        logFirebaseEvent(
                                                            'NUEVA_PREGUNTA_ENCUESTA_LIBRE_SwitchDepe');
                                                        _model.dependePregunta =
                                                            true;
                                                        _model.dependeFlujo =
                                                            false;
                                                        safeSetState(() {});
                                                      } else {
                                                        logFirebaseEvent(
                                                            'NUEVA_PREGUNTA_ENCUESTA_LIBRE_SwitchDepe');
                                                        _model.dependePregunta =
                                                            false;
                                                        safeSetState(() {});
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                              .modelo
                                                              ?.reference,
                                                        )
                                                        .orderBy('numero'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .barra,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            int rowCount = snapshot.data!;

                                            return Row(
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
                                                      Icon(
                                                        Icons
                                                            .low_priority_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                if (rowCount > 0)
                                                  Switch.adaptive(
                                                    value: _model
                                                        .switchDependeFlujoValue!,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .switchDependeFlujoValue =
                                                          newValue);
                                                      if (newValue) {
                                                        logFirebaseEvent(
                                                            'NUEVA_PREGUNTA_ENCUESTA_LIBRE_SwitchDepe');
                                                        _model.dependeFlujo =
                                                            true;
                                                        _model.dependePregunta =
                                                            false;
                                                        safeSetState(() {});
                                                      } else {
                                                        logFirebaseEvent(
                                                            'NUEVA_PREGUNTA_ENCUESTA_LIBRE_SwitchDepe');
                                                        _model.dependeFlujo =
                                                            false;
                                                        safeSetState(() {});
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 6.0),
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
                                                                        .modelo
                                                                        ?.reference,
                                                                  )
                                                                  .where(
                                                                    'multiSelect',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'numero'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<ModelosPreguntasEncuestaRecord>
                                                          containerModelosPreguntasEncuestaRecordList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  int>(
                                                            controller: _model
                                                                    .dropDownDepPreValueController ??=
                                                                FormFieldController<
                                                                    int>(
                                                              _model.dropDownDepPreValue ??=
                                                                  1,
                                                            ),
                                                            options: List<
                                                                    int>.from(
                                                                containerModelosPreguntasEncuestaRecordList
                                                                    .map((e) =>
                                                                        e.numero)
                                                                    .toList()),
                                                            optionLabels: functions
                                                                .concatenarDosArreglos(
                                                                    containerModelosPreguntasEncuestaRecordList
                                                                        .map((e) =>
                                                                            formatNumber(
                                                                              e.numero,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.periodDecimal,
                                                                            ))
                                                                        .toList(),
                                                                    containerModelosPreguntasEncuestaRecordList
                                                                        .map((e) =>
                                                                            e.pregunta)
                                                                        .toList()),
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.dropDownDepPreValue =
                                                                        val),
                                                            width: 180.0,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            hintText:
                                                                'Selecciona una Pregunta',
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .chevronDown,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 15.0,
                                                            ),
                                                            fillColor:
                                                                Colors.white,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                Colors.white,
                                                            borderWidth: 1.0,
                                                            borderRadius: 0.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        4.0,
                                                                        12.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: false,
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
                                      if (_model.dependePregunta)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 6.0),
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
                                                                        .modelo
                                                                        ?.reference,
                                                                  )
                                                                  .where(
                                                                    'numero',
                                                                    isEqualTo:
                                                                        _model
                                                                            .dropDownDepPreValue,
                                                                  ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  int>(
                                                            controller: _model
                                                                    .dropDownDepResValueController ??=
                                                                FormFieldController<
                                                                    int>(
                                                              _model.dropDownDepResValue ??=
                                                                  1,
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
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        ))
                                                                    .toList(),
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.dropDownDepResValue =
                                                                        val),
                                                            width: 180.0,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            hintText:
                                                                'Selecciona una Respuesta',
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .chevronDown,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 15.0,
                                                            ),
                                                            fillColor:
                                                                Colors.white,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                Colors.white,
                                                            borderWidth: 1.0,
                                                            borderRadius: 0.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        4.0,
                                                                        12.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: false,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: TextFormField(
                                          controller: _model
                                              .textFieldInfoTextController,
                                          focusNode:
                                              _model.textFieldInfoFocusNode,
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
                                                FlutterFlowTheme.of(context)
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          maxLines: 6,
                                          validator: _model
                                              .textFieldInfoTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: TextFormField(
                                          controller: _model
                                              .textFieldPreguntaTextController,
                                          focusNode:
                                              _model.textFieldPreguntaFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textFieldPreguntaTextController',
                                            Duration(milliseconds: 2000),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Texto de la Pregunta: ',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          maxLines: 6,
                                          validator: _model
                                              .textFieldPreguntaTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 6.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: FlutterFlowDropDown<int>(
                                              controller: _model
                                                      .dropDownTipoValueController ??=
                                                  FormFieldController<int>(
                                                _model.dropDownTipoValue ??= 1,
                                              ),
                                              options:
                                                  List<int>.from([1, 2, 3]),
                                              optionLabels: [
                                                'Texto Libre',
                                                'Dígitos',
                                                'Rango'
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                      .dropDownTipoValue = val),
                                              width: 180.0,
                                              height: 50.0,
                                              textStyle:
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
                                              hintText:
                                                  'Selecciona un Tipo de Pregunta',
                                              icon: FaIcon(
                                                FontAwesomeIcons.chevronDown,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 15.0,
                                              ),
                                              fillColor: Colors.white,
                                              elevation: 2.0,
                                              borderColor: Colors.white,
                                              borderWidth: 1.0,
                                              borderRadius: 0.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 12.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.dropDownTipoValue == 3)
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 5.0, 15.0, 5.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .textFieldMinimoTextController,
                                              focusNode: _model
                                                  .textFieldMinimoFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textFieldMinimoTextController',
                                                Duration(milliseconds: 2000),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Rango Mínimo...',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.numbers,
                                                  color: Colors.black,
                                                  size: 22.0,
                                                ),
                                                suffixIcon: _model
                                                        .textFieldMinimoTextController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .textFieldMinimoTextController
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
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .textFieldMinimoTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (_model.dropDownTipoValue == 3)
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 5.0, 15.0, 5.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .textFieldMaximoTextController,
                                              focusNode: _model
                                                  .textFieldMaximoFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textFieldMaximoTextController',
                                                Duration(milliseconds: 2000),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Rango Máximo...',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.numbers,
                                                  color: Colors.black,
                                                  size: 22.0,
                                                ),
                                                suffixIcon: _model
                                                        .textFieldMaximoTextController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .textFieldMaximoTextController
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
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .textFieldMaximoTextControllerValidator
                                                  .asValidator(context),
                                            ),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 25.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'NUEVA_PREGUNTA_ENCUESTA_LIBRE_CREAR_PREG');
                                            var _shouldSetState = false;
                                            HapticFeedback.lightImpact();
                                            if (_model.dependePregunta) {
                                              _model.docPregunta =
                                                  await queryModelosPreguntasEncuestaRecordOnce(
                                                queryBuilder:
                                                    (modelosPreguntasEncuestaRecord) =>
                                                        modelosPreguntasEncuestaRecord
                                                            .where(
                                                              'modeloEncuesta',
                                                              isEqualTo: widget
                                                                  .modelo
                                                                  ?.reference,
                                                            )
                                                            .where(
                                                              'numero',
                                                              isEqualTo: _model
                                                                  .dropDownDepPreValue,
                                                            ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              _shouldSetState = true;
                                              _model.respuestaOcupada =
                                                  await queryModelosPreguntasEncuestaRecordCount(
                                                queryBuilder:
                                                    (modelosPreguntasEncuestaRecord) =>
                                                        modelosPreguntasEncuestaRecord
                                                            .where(
                                                              'modeloEncuesta',
                                                              isEqualTo: widget
                                                                  .modelo
                                                                  ?.reference,
                                                            )
                                                            .where(
                                                              'dependeDe',
                                                              isEqualTo: _model
                                                                  .docPregunta
                                                                  ?.reference,
                                                            )
                                                            .where(
                                                              'dependeDeRespuesta',
                                                              isEqualTo: _model
                                                                  .dropDownDepResValue,
                                                            ),
                                              );
                                              _shouldSetState = true;
                                              if (_model.respuestaOcupada! >
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
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
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
                                              }
                                              if (_model.dropDownTipoValue ==
                                                  1) {
                                                var modelosPreguntasEncuestaRecordReference1 =
                                                    ModelosPreguntasEncuestaRecord
                                                        .collection
                                                        .doc();
                                                await modelosPreguntasEncuestaRecordReference1
                                                    .set(
                                                        createModelosPreguntasEncuestaRecordData(
                                                  modeloEncuesta:
                                                      widget.modelo?.reference,
                                                  numero: valueOrDefault<int>(
                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                            .length,
                                                        0,
                                                      ) +
                                                      1,
                                                  pregunta: (String cadena) {
                                                    return cadena.replaceAll(
                                                        ',', '');
                                                  }(_model
                                                      .textFieldPreguntaTextController
                                                      .text),
                                                  informacion: _model
                                                      .textFieldInfoTextController
                                                      .text,
                                                  dependeDe: null,
                                                  deTexto: true,
                                                  numRespuestas: 1,
                                                  multiSelect: false,
                                                ));
                                                _model.respuestaTextoS =
                                                    ModelosPreguntasEncuestaRecord
                                                        .getDocumentFromData(
                                                            createModelosPreguntasEncuestaRecordData(
                                                              modeloEncuesta:
                                                                  widget.modelo
                                                                      ?.reference,
                                                              numero:
                                                                  valueOrDefault<
                                                                          int>(
                                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                            .length,
                                                                        0,
                                                                      ) +
                                                                      1,
                                                              pregunta: (String
                                                                  cadena) {
                                                                return cadena
                                                                    .replaceAll(
                                                                        ',',
                                                                        '');
                                                              }(_model
                                                                  .textFieldPreguntaTextController
                                                                  .text),
                                                              informacion: _model
                                                                  .textFieldInfoTextController
                                                                  .text,
                                                              dependeDe: null,
                                                              deTexto: true,
                                                              numRespuestas: 1,
                                                              multiSelect:
                                                                  false,
                                                            ),
                                                            modelosPreguntasEncuestaRecordReference1);
                                                _shouldSetState = true;
                                                if (_model.dependeFlujo) {
                                                  await _model.respuestaTextoS!
                                                      .reference
                                                      .update(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    dependeDe: _model
                                                        .docPregunta?.reference,
                                                  ));
                                                }
                                                if (_model.dependePregunta) {
                                                  await _model.respuestaTextoS!
                                                      .reference
                                                      .update(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    dependeDe:
                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                            .where((e) =>
                                                                e.numero ==
                                                                _model
                                                                    .dropDownDepPreValue)
                                                            .toList()
                                                            .firstOrNull
                                                            ?.reference,
                                                    dependeDeRespuesta: _model
                                                        .dropDownDepResValue,
                                                  ));
                                                }
                                              } else if (_model
                                                      .dropDownTipoValue ==
                                                  2) {
                                                var modelosPreguntasEncuestaRecordReference2 =
                                                    ModelosPreguntasEncuestaRecord
                                                        .collection
                                                        .doc();
                                                await modelosPreguntasEncuestaRecordReference2
                                                    .set(
                                                        createModelosPreguntasEncuestaRecordData(
                                                  modeloEncuesta:
                                                      widget.modelo?.reference,
                                                  numero: valueOrDefault<int>(
                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                            .length,
                                                        0,
                                                      ) +
                                                      1,
                                                  pregunta: (String cadena) {
                                                    return cadena.replaceAll(
                                                        ',', '');
                                                  }(_model
                                                      .textFieldPreguntaTextController
                                                      .text),
                                                  informacion: _model
                                                      .textFieldInfoTextController
                                                      .text,
                                                  dependeDe: null,
                                                  deNumero: true,
                                                  numRespuestas: 1,
                                                  multiSelect: false,
                                                ));
                                                _model.respuestaNumeroS =
                                                    ModelosPreguntasEncuestaRecord
                                                        .getDocumentFromData(
                                                            createModelosPreguntasEncuestaRecordData(
                                                              modeloEncuesta:
                                                                  widget.modelo
                                                                      ?.reference,
                                                              numero:
                                                                  valueOrDefault<
                                                                          int>(
                                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                            .length,
                                                                        0,
                                                                      ) +
                                                                      1,
                                                              pregunta: (String
                                                                  cadena) {
                                                                return cadena
                                                                    .replaceAll(
                                                                        ',',
                                                                        '');
                                                              }(_model
                                                                  .textFieldPreguntaTextController
                                                                  .text),
                                                              informacion: _model
                                                                  .textFieldInfoTextController
                                                                  .text,
                                                              dependeDe: null,
                                                              deNumero: true,
                                                              numRespuestas: 1,
                                                              multiSelect:
                                                                  false,
                                                            ),
                                                            modelosPreguntasEncuestaRecordReference2);
                                                _shouldSetState = true;
                                                if (_model.dependeFlujo) {
                                                  await _model.respuestaNumeroS!
                                                      .reference
                                                      .update(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    dependeDe: _model
                                                        .docPregunta?.reference,
                                                  ));
                                                }
                                                if (_model.dependePregunta) {
                                                  await _model.respuestaNumeroS!
                                                      .reference
                                                      .update(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    dependeDe:
                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                            .where((e) =>
                                                                e.numero ==
                                                                _model
                                                                    .dropDownDepPreValue)
                                                            .toList()
                                                            .firstOrNull
                                                            ?.reference,
                                                    dependeDeRespuesta: _model
                                                        .dropDownDepResValue,
                                                  ));
                                                }
                                              } else {
                                                var modelosPreguntasEncuestaRecordReference3 =
                                                    ModelosPreguntasEncuestaRecord
                                                        .collection
                                                        .doc();
                                                await modelosPreguntasEncuestaRecordReference3
                                                    .set(
                                                        createModelosPreguntasEncuestaRecordData(
                                                  modeloEncuesta:
                                                      widget.modelo?.reference,
                                                  numero: valueOrDefault<int>(
                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                            .length,
                                                        0,
                                                      ) +
                                                      1,
                                                  pregunta: (String cadena) {
                                                    return cadena.replaceAll(
                                                        ',', '');
                                                  }(_model
                                                      .textFieldPreguntaTextController
                                                      .text),
                                                  informacion: _model
                                                      .textFieldInfoTextController
                                                      .text,
                                                  dependeDe: null,
                                                  deRango: true,
                                                  numRespuestas: 1,
                                                  multiSelect: false,
                                                  rangoMinimo: int.tryParse(_model
                                                      .textFieldMinimoTextController
                                                      .text),
                                                  rangoMaximo: int.tryParse(_model
                                                      .textFieldMaximoTextController
                                                      .text),
                                                ));
                                                _model.respuestaRangoS =
                                                    ModelosPreguntasEncuestaRecord
                                                        .getDocumentFromData(
                                                            createModelosPreguntasEncuestaRecordData(
                                                              modeloEncuesta:
                                                                  widget.modelo
                                                                      ?.reference,
                                                              numero:
                                                                  valueOrDefault<
                                                                          int>(
                                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                            .length,
                                                                        0,
                                                                      ) +
                                                                      1,
                                                              pregunta: (String
                                                                  cadena) {
                                                                return cadena
                                                                    .replaceAll(
                                                                        ',',
                                                                        '');
                                                              }(_model
                                                                  .textFieldPreguntaTextController
                                                                  .text),
                                                              informacion: _model
                                                                  .textFieldInfoTextController
                                                                  .text,
                                                              dependeDe: null,
                                                              deRango: true,
                                                              numRespuestas: 1,
                                                              multiSelect:
                                                                  false,
                                                              rangoMinimo: int
                                                                  .tryParse(_model
                                                                      .textFieldMinimoTextController
                                                                      .text),
                                                              rangoMaximo: int
                                                                  .tryParse(_model
                                                                      .textFieldMaximoTextController
                                                                      .text),
                                                            ),
                                                            modelosPreguntasEncuestaRecordReference3);
                                                _shouldSetState = true;
                                                if (_model.dependeFlujo) {
                                                  await _model.respuestaRangoS!
                                                      .reference
                                                      .update(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    dependeDe: _model
                                                        .docPregunta?.reference,
                                                  ));
                                                }
                                                if (_model.dependePregunta) {
                                                  await _model.respuestaRangoS!
                                                      .reference
                                                      .update(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    dependeDe:
                                                        nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                            .where((e) =>
                                                                e.numero ==
                                                                _model
                                                                    .dropDownDepPreValue)
                                                            .toList()
                                                            .firstOrNull
                                                            ?.reference,
                                                    dependeDeRespuesta: _model
                                                        .dropDownDepResValue,
                                                  ));
                                                }
                                              }
                                            } else {
                                              if (_model.dependeFlujo) {
                                                _model.docPreguntaFlujo =
                                                    await queryModelosPreguntasEncuestaRecordOnce(
                                                  queryBuilder:
                                                      (modelosPreguntasEncuestaRecord) =>
                                                          modelosPreguntasEncuestaRecord
                                                              .where(
                                                                'modeloEncuesta',
                                                                isEqualTo: widget
                                                                    .modelo
                                                                    ?.reference,
                                                              )
                                                              .where(
                                                                'numero',
                                                                isEqualTo: _model
                                                                    .dropDownDepPreValue,
                                                              ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                _shouldSetState = true;
                                                _model.preguntaOcupadaX =
                                                    await queryModelosPreguntasEncuestaRecordCount(
                                                  queryBuilder:
                                                      (modelosPreguntasEncuestaRecord) =>
                                                          modelosPreguntasEncuestaRecord
                                                              .where(
                                                                'modeloEncuesta',
                                                                isEqualTo: widget
                                                                    .modelo
                                                                    ?.reference,
                                                              )
                                                              .where(
                                                                'dependeDe',
                                                                isEqualTo: _model
                                                                    .docPreguntaFlujo
                                                                    ?.reference,
                                                              ),
                                                );
                                                _shouldSetState = true;
                                                if (_model.preguntaOcupadaX! >
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
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
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
                                                                'La Pregunta de la que depende esta Pregunta ya ha sido utilizada, por favor modifique este Flujo seleccionando otra pregunta.',
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
                                                }
                                                if (_model.dropDownTipoValue ==
                                                    1) {
                                                  var modelosPreguntasEncuestaRecordReference4 =
                                                      ModelosPreguntasEncuestaRecord
                                                          .collection
                                                          .doc();
                                                  await modelosPreguntasEncuestaRecordReference4
                                                      .set(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    modeloEncuesta: widget
                                                        .modelo?.reference,
                                                    numero: valueOrDefault<int>(
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .length,
                                                          0,
                                                        ) +
                                                        1,
                                                    pregunta: (String cadena) {
                                                      return cadena.replaceAll(
                                                          ',', '');
                                                    }(_model
                                                        .textFieldPreguntaTextController
                                                        .text),
                                                    informacion: _model
                                                        .textFieldInfoTextController
                                                        .text,
                                                    dependeDe: null,
                                                    deTexto: true,
                                                    numRespuestas: 1,
                                                    multiSelect: false,
                                                  ));
                                                  _model.respuestaTexto =
                                                      ModelosPreguntasEncuestaRecord
                                                          .getDocumentFromData(
                                                              createModelosPreguntasEncuestaRecordData(
                                                                modeloEncuesta:
                                                                    widget
                                                                        .modelo
                                                                        ?.reference,
                                                                numero:
                                                                    valueOrDefault<
                                                                            int>(
                                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                              .length,
                                                                          0,
                                                                        ) +
                                                                        1,
                                                                pregunta: (String
                                                                    cadena) {
                                                                  return cadena
                                                                      .replaceAll(
                                                                          ',',
                                                                          '');
                                                                }(_model
                                                                    .textFieldPreguntaTextController
                                                                    .text),
                                                                informacion: _model
                                                                    .textFieldInfoTextController
                                                                    .text,
                                                                dependeDe: null,
                                                                deTexto: true,
                                                                numRespuestas:
                                                                    1,
                                                                multiSelect:
                                                                    false,
                                                              ),
                                                              modelosPreguntasEncuestaRecordReference4);
                                                  _shouldSetState = true;
                                                  if (_model.dependeFlujo) {
                                                    await _model.respuestaTexto!
                                                        .reference
                                                        .update(
                                                            createModelosPreguntasEncuestaRecordData(
                                                      dependeDe: _model
                                                          .docPreguntaFlujo
                                                          ?.reference,
                                                    ));
                                                  }
                                                  if (_model.dependePregunta) {
                                                    await _model.respuestaTexto!
                                                        .reference
                                                        .update(
                                                            createModelosPreguntasEncuestaRecordData(
                                                      dependeDe:
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .where((e) =>
                                                                  e.numero ==
                                                                  _model
                                                                      .dropDownDepPreValue)
                                                              .toList()
                                                              .firstOrNull
                                                              ?.reference,
                                                      dependeDeRespuesta: _model
                                                          .dropDownDepResValue,
                                                    ));
                                                  }
                                                } else if (_model
                                                        .dropDownTipoValue ==
                                                    2) {
                                                  var modelosPreguntasEncuestaRecordReference5 =
                                                      ModelosPreguntasEncuestaRecord
                                                          .collection
                                                          .doc();
                                                  await modelosPreguntasEncuestaRecordReference5
                                                      .set(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    modeloEncuesta: widget
                                                        .modelo?.reference,
                                                    numero: valueOrDefault<int>(
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .length,
                                                          0,
                                                        ) +
                                                        1,
                                                    pregunta: (String cadena) {
                                                      return cadena.replaceAll(
                                                          ',', '');
                                                    }(_model
                                                        .textFieldPreguntaTextController
                                                        .text),
                                                    informacion: _model
                                                        .textFieldInfoTextController
                                                        .text,
                                                    dependeDe: null,
                                                    deNumero: true,
                                                    numRespuestas: 1,
                                                    multiSelect: false,
                                                  ));
                                                  _model.respuestaNumero =
                                                      ModelosPreguntasEncuestaRecord
                                                          .getDocumentFromData(
                                                              createModelosPreguntasEncuestaRecordData(
                                                                modeloEncuesta:
                                                                    widget
                                                                        .modelo
                                                                        ?.reference,
                                                                numero:
                                                                    valueOrDefault<
                                                                            int>(
                                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                              .length,
                                                                          0,
                                                                        ) +
                                                                        1,
                                                                pregunta: (String
                                                                    cadena) {
                                                                  return cadena
                                                                      .replaceAll(
                                                                          ',',
                                                                          '');
                                                                }(_model
                                                                    .textFieldPreguntaTextController
                                                                    .text),
                                                                informacion: _model
                                                                    .textFieldInfoTextController
                                                                    .text,
                                                                dependeDe: null,
                                                                deNumero: true,
                                                                numRespuestas:
                                                                    1,
                                                                multiSelect:
                                                                    false,
                                                              ),
                                                              modelosPreguntasEncuestaRecordReference5);
                                                  _shouldSetState = true;
                                                  if (_model.dependeFlujo) {
                                                    await _model
                                                        .respuestaNumero!
                                                        .reference
                                                        .update(
                                                            createModelosPreguntasEncuestaRecordData(
                                                      dependeDe: _model
                                                          .docPreguntaFlujo
                                                          ?.reference,
                                                    ));
                                                  }
                                                  if (_model.dependePregunta) {
                                                    await _model
                                                        .respuestaNumero!
                                                        .reference
                                                        .update(
                                                            createModelosPreguntasEncuestaRecordData(
                                                      dependeDe:
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .where((e) =>
                                                                  e.numero ==
                                                                  _model
                                                                      .dropDownDepPreValue)
                                                              .toList()
                                                              .firstOrNull
                                                              ?.reference,
                                                      dependeDeRespuesta: _model
                                                          .dropDownDepResValue,
                                                    ));
                                                  }
                                                } else {
                                                  var modelosPreguntasEncuestaRecordReference6 =
                                                      ModelosPreguntasEncuestaRecord
                                                          .collection
                                                          .doc();
                                                  await modelosPreguntasEncuestaRecordReference6
                                                      .set(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    modeloEncuesta: widget
                                                        .modelo?.reference,
                                                    numero: valueOrDefault<int>(
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .length,
                                                          0,
                                                        ) +
                                                        1,
                                                    pregunta: (String cadena) {
                                                      return cadena.replaceAll(
                                                          ',', '');
                                                    }(_model
                                                        .textFieldPreguntaTextController
                                                        .text),
                                                    informacion: _model
                                                        .textFieldInfoTextController
                                                        .text,
                                                    dependeDe: null,
                                                    deRango: true,
                                                    numRespuestas: 1,
                                                    multiSelect: false,
                                                    rangoMinimo: int.tryParse(_model
                                                        .textFieldMinimoTextController
                                                        .text),
                                                    rangoMaximo: int.tryParse(_model
                                                        .textFieldMaximoTextController
                                                        .text),
                                                  ));
                                                  _model.respuestaRango =
                                                      ModelosPreguntasEncuestaRecord
                                                          .getDocumentFromData(
                                                              createModelosPreguntasEncuestaRecordData(
                                                                modeloEncuesta:
                                                                    widget
                                                                        .modelo
                                                                        ?.reference,
                                                                numero:
                                                                    valueOrDefault<
                                                                            int>(
                                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                              .length,
                                                                          0,
                                                                        ) +
                                                                        1,
                                                                pregunta: (String
                                                                    cadena) {
                                                                  return cadena
                                                                      .replaceAll(
                                                                          ',',
                                                                          '');
                                                                }(_model
                                                                    .textFieldPreguntaTextController
                                                                    .text),
                                                                informacion: _model
                                                                    .textFieldInfoTextController
                                                                    .text,
                                                                dependeDe: null,
                                                                deRango: true,
                                                                numRespuestas:
                                                                    1,
                                                                multiSelect:
                                                                    false,
                                                                rangoMinimo: int
                                                                    .tryParse(_model
                                                                        .textFieldMinimoTextController
                                                                        .text),
                                                                rangoMaximo: int
                                                                    .tryParse(_model
                                                                        .textFieldMaximoTextController
                                                                        .text),
                                                              ),
                                                              modelosPreguntasEncuestaRecordReference6);
                                                  _shouldSetState = true;
                                                  if (_model.dependeFlujo) {
                                                    await _model.respuestaRango!
                                                        .reference
                                                        .update(
                                                            createModelosPreguntasEncuestaRecordData(
                                                      dependeDe: _model
                                                          .docPreguntaFlujo
                                                          ?.reference,
                                                    ));
                                                  }
                                                  if (_model.dependePregunta) {
                                                    await _model.respuestaRango!
                                                        .reference
                                                        .update(
                                                            createModelosPreguntasEncuestaRecordData(
                                                      dependeDe:
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .where((e) =>
                                                                  e.numero ==
                                                                  _model
                                                                      .dropDownDepPreValue)
                                                              .toList()
                                                              .firstOrNull
                                                              ?.reference,
                                                      dependeDeRespuesta: _model
                                                          .dropDownDepResValue,
                                                    ));
                                                  }
                                                }
                                              } else {
                                                if (_model.dropDownTipoValue ==
                                                    1) {
                                                  var modelosPreguntasEncuestaRecordReference7 =
                                                      ModelosPreguntasEncuestaRecord
                                                          .collection
                                                          .doc();
                                                  await modelosPreguntasEncuestaRecordReference7
                                                      .set(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    modeloEncuesta: widget
                                                        .modelo?.reference,
                                                    numero: valueOrDefault<int>(
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .length,
                                                          0,
                                                        ) +
                                                        1,
                                                    pregunta: (String cadena) {
                                                      return cadena.replaceAll(
                                                          ',', '');
                                                    }(_model
                                                        .textFieldPreguntaTextController
                                                        .text),
                                                    informacion: _model
                                                        .textFieldInfoTextController
                                                        .text,
                                                    dependeDe: null,
                                                    deTexto: true,
                                                    numRespuestas: 1,
                                                    multiSelect: false,
                                                  ));
                                                  _model.respuestaTextoY =
                                                      ModelosPreguntasEncuestaRecord
                                                          .getDocumentFromData(
                                                              createModelosPreguntasEncuestaRecordData(
                                                                modeloEncuesta:
                                                                    widget
                                                                        .modelo
                                                                        ?.reference,
                                                                numero:
                                                                    valueOrDefault<
                                                                            int>(
                                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                              .length,
                                                                          0,
                                                                        ) +
                                                                        1,
                                                                pregunta: (String
                                                                    cadena) {
                                                                  return cadena
                                                                      .replaceAll(
                                                                          ',',
                                                                          '');
                                                                }(_model
                                                                    .textFieldPreguntaTextController
                                                                    .text),
                                                                informacion: _model
                                                                    .textFieldInfoTextController
                                                                    .text,
                                                                dependeDe: null,
                                                                deTexto: true,
                                                                numRespuestas:
                                                                    1,
                                                                multiSelect:
                                                                    false,
                                                              ),
                                                              modelosPreguntasEncuestaRecordReference7);
                                                  _shouldSetState = true;
                                                } else if (_model
                                                        .dropDownTipoValue ==
                                                    2) {
                                                  var modelosPreguntasEncuestaRecordReference8 =
                                                      ModelosPreguntasEncuestaRecord
                                                          .collection
                                                          .doc();
                                                  await modelosPreguntasEncuestaRecordReference8
                                                      .set(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    modeloEncuesta: widget
                                                        .modelo?.reference,
                                                    numero: valueOrDefault<int>(
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .length,
                                                          0,
                                                        ) +
                                                        1,
                                                    pregunta: (String cadena) {
                                                      return cadena.replaceAll(
                                                          ',', '');
                                                    }(_model
                                                        .textFieldPreguntaTextController
                                                        .text),
                                                    informacion: _model
                                                        .textFieldInfoTextController
                                                        .text,
                                                    dependeDe: null,
                                                    deNumero: true,
                                                    numRespuestas: 1,
                                                    multiSelect: false,
                                                  ));
                                                  _model.respuestaNumeroY =
                                                      ModelosPreguntasEncuestaRecord
                                                          .getDocumentFromData(
                                                              createModelosPreguntasEncuestaRecordData(
                                                                modeloEncuesta:
                                                                    widget
                                                                        .modelo
                                                                        ?.reference,
                                                                numero:
                                                                    valueOrDefault<
                                                                            int>(
                                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                              .length,
                                                                          0,
                                                                        ) +
                                                                        1,
                                                                pregunta: (String
                                                                    cadena) {
                                                                  return cadena
                                                                      .replaceAll(
                                                                          ',',
                                                                          '');
                                                                }(_model
                                                                    .textFieldPreguntaTextController
                                                                    .text),
                                                                informacion: _model
                                                                    .textFieldInfoTextController
                                                                    .text,
                                                                dependeDe: null,
                                                                deNumero: true,
                                                                numRespuestas:
                                                                    1,
                                                                multiSelect:
                                                                    false,
                                                              ),
                                                              modelosPreguntasEncuestaRecordReference8);
                                                  _shouldSetState = true;
                                                } else {
                                                  var modelosPreguntasEncuestaRecordReference9 =
                                                      ModelosPreguntasEncuestaRecord
                                                          .collection
                                                          .doc();
                                                  await modelosPreguntasEncuestaRecordReference9
                                                      .set(
                                                          createModelosPreguntasEncuestaRecordData(
                                                    modeloEncuesta: widget
                                                        .modelo?.reference,
                                                    numero: valueOrDefault<int>(
                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                              .length,
                                                          0,
                                                        ) +
                                                        1,
                                                    pregunta: (String cadena) {
                                                      return cadena.replaceAll(
                                                          ',', '');
                                                    }(_model
                                                        .textFieldPreguntaTextController
                                                        .text),
                                                    informacion: _model
                                                        .textFieldInfoTextController
                                                        .text,
                                                    dependeDe: null,
                                                    deRango: true,
                                                    numRespuestas: 1,
                                                    multiSelect: false,
                                                    rangoMinimo: int.tryParse(_model
                                                        .textFieldMinimoTextController
                                                        .text),
                                                    rangoMaximo: int.tryParse(_model
                                                        .textFieldMaximoTextController
                                                        .text),
                                                  ));
                                                  _model.respuestaRangoY =
                                                      ModelosPreguntasEncuestaRecord
                                                          .getDocumentFromData(
                                                              createModelosPreguntasEncuestaRecordData(
                                                                modeloEncuesta:
                                                                    widget
                                                                        .modelo
                                                                        ?.reference,
                                                                numero:
                                                                    valueOrDefault<
                                                                            int>(
                                                                          nuevaPreguntaEncuestaLibreModelosPreguntasEncuestaRecordList
                                                                              .length,
                                                                          0,
                                                                        ) +
                                                                        1,
                                                                pregunta: (String
                                                                    cadena) {
                                                                  return cadena
                                                                      .replaceAll(
                                                                          ',',
                                                                          '');
                                                                }(_model
                                                                    .textFieldPreguntaTextController
                                                                    .text),
                                                                informacion: _model
                                                                    .textFieldInfoTextController
                                                                    .text,
                                                                dependeDe: null,
                                                                deRango: true,
                                                                numRespuestas:
                                                                    1,
                                                                multiSelect:
                                                                    false,
                                                                rangoMinimo: int
                                                                    .tryParse(_model
                                                                        .textFieldMinimoTextController
                                                                        .text),
                                                                rangoMaximo: int
                                                                    .tryParse(_model
                                                                        .textFieldMaximoTextController
                                                                        .text),
                                                              ),
                                                              modelosPreguntasEncuestaRecordReference9);
                                                  _shouldSetState = true;
                                                }
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
                                                      titulo: 'Éxito!',
                                                      mensaje:
                                                          'Pregunta Creada con éxito!',
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            context.safePop();
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                          text: 'Crear Pregunta',
                                          icon: FaIcon(
                                            FontAwesomeIcons.solidNewspaper,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 200.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
