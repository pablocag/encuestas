import '/backend/backend.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/components/tooltip_card/tooltip_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'resultados_encuesta_aplicada_model.dart';
export 'resultados_encuesta_aplicada_model.dart';

class ResultadosEncuestaAplicadaWidget extends StatefulWidget {
  const ResultadosEncuestaAplicadaWidget({
    super.key,
    required this.modelo,
  });

  final ModelosEncuestasRecord? modelo;

  static String routeName = 'resultadosEncuestaAplicada';
  static String routePath = 'resultadosEncuestaAplicada';

  @override
  State<ResultadosEncuestaAplicadaWidget> createState() =>
      _ResultadosEncuestaAplicadaWidgetState();
}

class _ResultadosEncuestaAplicadaWidgetState
    extends State<ResultadosEncuestaAplicadaWidget> {
  late ResultadosEncuestaAplicadaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultadosEncuestaAplicadaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'resultadosEncuestaAplicada'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_resultadosE');
      _model.instantTimerPage = InstantTimer.periodic(
        duration: Duration(milliseconds: 10000),
        callback: (timer) async {
          safeSetState(() {});
        },
        startImmediately: true,
      );
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
    context.watch<FFAppState>();

    return StreamBuilder<List<EncuestasRecord>>(
      stream: queryEncuestasRecord(
        queryBuilder: (encuestasRecord) => encuestasRecord.where(
          'modeloEncuesta',
          isEqualTo: widget.modelo?.reference,
        ),
        singleRecord: true,
      )..listen((snapshot) {
          List<EncuestasRecord> resultadosEncuestaAplicadaEncuestasRecordList =
              snapshot;
          final resultadosEncuestaAplicadaEncuestasRecord =
              resultadosEncuestaAplicadaEncuestasRecordList.isNotEmpty
                  ? resultadosEncuestaAplicadaEncuestasRecordList.first
                  : null;
          if (_model.resultadosEncuestaAplicadaPreviousSnapshot != null &&
              !const ListEquality(EncuestasRecordDocumentEquality()).equals(
                  resultadosEncuestaAplicadaEncuestasRecordList,
                  _model.resultadosEncuestaAplicadaPreviousSnapshot)) {
            () async {
              logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_resultadosE');

              safeSetState(() {});

              safeSetState(() {});
            }();
          }
          _model.resultadosEncuestaAplicadaPreviousSnapshot = snapshot;
        }),
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
        List<EncuestasRecord> resultadosEncuestaAplicadaEncuestasRecordList =
            snapshot.data!;
        final resultadosEncuestaAplicadaEncuestasRecord =
            resultadosEncuestaAplicadaEncuestasRecordList.isNotEmpty
                ? resultadosEncuestaAplicadaEncuestasRecordList.first
                : null;

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
                buttonSize: 54.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_chevron_lef');
                  _model.instantTimerPage?.cancel();
                  context.pop();
                },
              ),
              title: Text(
                'Resultados de Encuesta',
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 0.0),
                        child: Row(
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
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/ENCUESTAS.png',
                                width: 100.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: FutureBuilder<int>(
                          future: queryEncuestasRecordCount(
                            queryBuilder: (encuestasRecord) => encuestasRecord
                                .where(
                                  'modeloEncuesta',
                                  isEqualTo: widget.modelo?.reference,
                                )
                                .where(
                                  'terminada',
                                  isEqualTo: true,
                                ),
                          ),
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
                            int rowCount = snapshot.data!;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Total: ${formatNumber(
                                      rowCount,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'RESULTADOS_ENCUESTA_APLICADA_VER_ENCUEST');
                                    HapticFeedback.lightImpact();

                                    context.pushNamed(
                                      EncuestasAplicadasPorModeloWidget
                                          .routeName,
                                      queryParameters: {
                                        'modelo': serializeParam(
                                          widget.modelo?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: ' Ver Encuestas',
                                  icon: Icon(
                                    Icons.view_list,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.mapMarkedAlt,
                                      color: FlutterFlowTheme.of(context)
                                          .customVerde,
                                      size: 32.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'RESULTADOS_ENCUESTA_APLICADA_mapMarkedAl');

                                      context.pushNamed(
                                        MapaModeloEncuestaWidget.routeName,
                                        queryParameters: {
                                          'modelo': serializeParam(
                                            widget.modelo,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'modelo': widget.modelo,
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: StreamBuilder<
                              List<ModelosPreguntasEncuestaRecord>>(
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
                              List<ModelosPreguntasEncuestaRecord>
                                  listViewModelosPreguntasEncuestaRecordList =
                                  snapshot.data!;
                              if (listViewModelosPreguntasEncuestaRecordList
                                  .isEmpty) {
                                return NoHayElementosWidget();
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewModelosPreguntasEncuestaRecordList
                                        .length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewModelosPreguntasEncuestaRecord =
                                      listViewModelosPreguntasEncuestaRecordList[
                                          listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (!valueOrDefault<bool>(
                                                listViewModelosPreguntasEncuestaRecord
                                                    .deTexto,
                                                false,
                                              ) &&
                                              !valueOrDefault<bool>(
                                                listViewModelosPreguntasEncuestaRecord
                                                    .deNumero,
                                                false,
                                              ) &&
                                              !valueOrDefault<bool>(
                                                listViewModelosPreguntasEncuestaRecord
                                                    .deRango,
                                                false,
                                              ))
                                            SingleChildScrollView(
                                              controller: _model
                                                  .columnOpcionScrollController,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          listViewModelosPreguntasEncuestaRecord
                                                              .numero
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listViewModelosPreguntasEncuestaRecord
                                                                    .pregunta,
                                                                maxLines: 6,
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      2)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta1',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController1,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).colorPromovido,
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_i8xis2');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController2,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '1',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta1,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      2)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta2',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController3,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).colorPromotor,
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_ds2tgj');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController4,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '2',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      3)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta3',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController5,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFE1A588),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_rhvw2a');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController6,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '3',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta3,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      4)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta4',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController7,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFA5B2C0),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_liuztz');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController8,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '4',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta4,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      5)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta5',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController9,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFF7CB9FA),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_4azbei');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController10,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '5',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta5,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      6)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta6',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController11,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFF6888D),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_utmxa9');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController12,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '6',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta6,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      7)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta7',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController13,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFEDE970),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_hr0d8a');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController14,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '7',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta7,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      8)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta8',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController15,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFF5FF0B7),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_mnwx6q');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController16,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '8',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta8,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas >=
                                                      9)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta9',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController17,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFE77DEF),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_jkc4ij');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController18,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '9',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta9,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      10)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta10',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController19,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFF079BB),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_eb5iyq');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController20,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '10',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta10,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      11)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta11',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController21,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).colorPromovido,
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_itfb3i');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController22,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '11',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta11,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      12)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta12',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController23,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).colorPromotor,
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_1ry0uc');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController24,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '12',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta12,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      13)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta13',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController25,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).colorPromotor,
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_0cnm96');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController26,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '13',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta13,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      14)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta14',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController27,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFA5B2C0),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_mao3qc');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController28,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '14',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta14,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      15)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta15',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController29,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFF7CB9FA),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_vyxtjo');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController30,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '15',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta15,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      16)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta16',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController31,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFF6888D),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_5e1asu');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController32,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '16',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta16,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      17)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta17',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController33,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFEDE970),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_785x5m');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController34,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '17',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta17,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      18)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta18',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController35,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFF5FF0B7),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_tt31mp');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController36,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '18',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta18,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      19)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta19',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController37,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFE77DEF),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_kwky4z');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController38,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '19',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta19,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewModelosPreguntasEncuestaRecord
                                                          .numRespuestas ==
                                                      20)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryRespuestasEncuestasRecordCount(
                                                              queryBuilder:
                                                                  (respuestasEncuestasRecord) =>
                                                                      respuestasEncuestasRecord
                                                                          .where(
                                                                'pregunta',
                                                                isEqualTo:
                                                                    listViewModelosPreguntasEncuestaRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int stackCount =
                                                                  snapshot
                                                                      .data!;

                                                              return Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryRespuestasEncuestasRecordCount(
                                                                        queryBuilder: (respuestasEncuestasRecord) => respuestasEncuestasRecord
                                                                            .where(
                                                                              'pregunta',
                                                                              isEqualTo: listViewModelosPreguntasEncuestaRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'respuesta20',
                                                                              isEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).barra,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int containerCount =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            controller:
                                                                                _model.rowController39,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: containerCount / stackCount,
                                                                                      width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                      lineHeight: 28.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: Color(0xFFF079BB),
                                                                                      backgroundColor: Colors.white,
                                                                                      barRadius: Radius.circular(8.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESULTADOS_ENCUESTA_APLICADA_Text_piis6d');
                                                                                        await showAlignedDialog(
                                                                                          context: context,
                                                                                          isGlobal: false,
                                                                                          avoidOverflow: true,
                                                                                          targetAnchor: AlignmentDirectional(-1.0, 0.0).resolve(Directionality.of(context)),
                                                                                          followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          builder: (dialogContext) {
                                                                                            return Material(
                                                                                              color: Colors.transparent,
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: TooltipCardWidget(
                                                                                                  texto: '${valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      containerCount,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  )} Respuestas',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            (int respuestas, int total) {
                                                                                              return total == 0 ? 0 : respuestas / total;
                                                                                            }(containerCount, stackCount),
                                                                                            formatType: FormatType.custom,
                                                                                            format: '###.##%',
                                                                                            locale: '',
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    controller:
                                                                        _model
                                                                            .rowController40,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '20',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewModelosPreguntasEncuestaRecord.respuesta20,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          if (listViewModelosPreguntasEncuestaRecord
                                                  .deNumero ||
                                              listViewModelosPreguntasEncuestaRecord
                                                  .deRango)
                                            SingleChildScrollView(
                                              controller: _model
                                                  .columnNumeroScrollController,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          listViewModelosPreguntasEncuestaRecord
                                                              .numero
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listViewModelosPreguntasEncuestaRecord
                                                                    .pregunta,
                                                                maxLines: 6,
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        FutureBuilder<int>(
                                                          future:
                                                              queryRespuestasEncuestasRecordCount(
                                                            queryBuilder:
                                                                (respuestasEncuestasRecord) =>
                                                                    respuestasEncuestasRecord
                                                                        .where(
                                                              'pregunta',
                                                              isEqualTo:
                                                                  listViewModelosPreguntasEncuestaRecord
                                                                      .reference,
                                                            ),
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
                                                            int stackCount =
                                                                snapshot.data!;

                                                            return Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          RespuestasEncuestasRecord>>(
                                                                    future:
                                                                        queryRespuestasEncuestasRecordOnce(
                                                                      queryBuilder:
                                                                          (respuestasEncuestasRecord) =>
                                                                              respuestasEncuestasRecord.where(
                                                                        'pregunta',
                                                                        isEqualTo:
                                                                            listViewModelosPreguntasEncuestaRecord.reference,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            child:
                                                                                SpinKitThreeBounce(
                                                                              color: FlutterFlowTheme.of(context).barra,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<RespuestasEncuestasRecord>
                                                                          containerRespuestasEncuestasRecordList =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        height:
                                                                            32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          controller:
                                                                              _model.rowController41,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  'Promedio: ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    formatNumber(
                                                                                      (int respuestas, int total) {
                                                                                        return total == 0 ? 0 : respuestas / total;
                                                                                      }(functions.sumarValoresLista(containerRespuestasEncuestasRecordList.map((e) => e.respuestaNumero).toList()), stackCount),
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                    ),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
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
