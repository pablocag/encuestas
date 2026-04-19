import '/backend/backend.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'encuestas_aplicadas_por_modelo_model.dart';
export 'encuestas_aplicadas_por_modelo_model.dart';

class EncuestasAplicadasPorModeloWidget extends StatefulWidget {
  const EncuestasAplicadasPorModeloWidget({
    super.key,
    required this.modelo,
  });

  final DocumentReference? modelo;

  static String routeName = 'encuestasAplicadasPorModelo';
  static String routePath = 'encuestasAplicadasPorModelo';

  @override
  State<EncuestasAplicadasPorModeloWidget> createState() =>
      _EncuestasAplicadasPorModeloWidgetState();
}

class _EncuestasAplicadasPorModeloWidgetState
    extends State<EncuestasAplicadasPorModeloWidget> {
  late EncuestasAplicadasPorModeloModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EncuestasAplicadasPorModeloModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'encuestasAplicadasPorModelo'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              logFirebaseEvent('ENCUESTAS_APLICADAS_POR_MODELO_chevron_l');
              context.pop();
            },
          ),
          title: Text(
            'Encuestas Aplicadas por Modelo',
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 140.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 0.0),
                        child: FutureBuilder<ModelosEncuestasRecord>(
                          future: ModelosEncuestasRecord.getDocumentOnce(
                              widget.modelo!),
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

                            final rowModelosEncuestasRecord = snapshot.data!;

                            return Row(
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
                                FutureBuilder<int>(
                                  future: queryEncuestasRecordCount(
                                    queryBuilder: (encuestasRecord) =>
                                        encuestasRecord
                                            .where(
                                              'modeloEncuesta',
                                              isEqualTo: widget.modelo,
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
                                            color: FlutterFlowTheme.of(context)
                                                .barra,
                                            size: 24.0,
                                          ),
                                        ),
                                      );
                                    }
                                    int rowCount = snapshot.data!;

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
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
                                                            isEqualTo:
                                                                widget.modelo,
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
                                                      color:
                                                          FlutterFlowTheme.of(
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

                                              return Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: StreamBuilder<
                                                    List<EncuestasRecord>>(
                                                  stream: queryEncuestasRecord(
                                                    queryBuilder:
                                                        (encuestasRecord) =>
                                                            encuestasRecord
                                                                .where(
                                                                  'modeloEncuesta',
                                                                  isEqualTo:
                                                                      widget
                                                                          .modelo,
                                                                )
                                                                .where(
                                                                  'terminada',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .orderBy(
                                                                    'fechaCreacion'),
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
                                                    List<EncuestasRecord>
                                                        containerEncuestasRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: StreamBuilder<
                                                          List<
                                                              RespuestasEncuestasRecord>>(
                                                        stream:
                                                            queryRespuestasEncuestasRecord(
                                                          queryBuilder: (respuestasEncuestasRecord) =>
                                                              respuestasEncuestasRecord
                                                                  .orderBy(
                                                                      'encuesta')
                                                                  .orderBy(
                                                                      'fechaCreacion'),
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
                                                          List<RespuestasEncuestasRecord>
                                                              containerRespuestasEncuestasRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Visibility(
                                                              visible:
                                                                  rowCount > 0,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      36.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      50.0,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .fileCsv,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 36.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ENCUESTAS_APLICADAS_POR_MODELO_fileCsv_I');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Descargar'),
                                                                                  content: Text('¿Desea Descargar esta Encuesta?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancelar'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Confirmar'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      await actions
                                                                          .downloadEncuestasAsCSV(
                                                                        rowModelosEncuestasRecord
                                                                            .titulo,
                                                                        containerEncuestasRecordList
                                                                            .toList(),
                                                                        containerRespuestasEncuestasRecordList
                                                                            .toList(),
                                                                        containerModelosPreguntasEncuestaRecordList
                                                                            .toList(),
                                                                      );
                                                                      return;
                                                                    } else {
                                                                      return;
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/ENCUESTAS.png',
                                            width: 100.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: FutureBuilder<int>(
                          future: (_model.firestoreRequestCompleter1 ??=
                                  Completer<int>()
                                    ..complete(queryEncuestasRecordCount(
                                      queryBuilder: (encuestasRecord) =>
                                          encuestasRecord
                                              .where(
                                                'modeloEncuesta',
                                                isEqualTo: widget.modelo,
                                              )
                                              .where(
                                                'terminada',
                                                isEqualTo: true,
                                              ),
                                    )))
                              .future,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Text(
                                    'Terminadas:',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    formatNumber(
                                      rowCount,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: FutureBuilder<int>(
                          future: (_model.firestoreRequestCompleter2 ??=
                                  Completer<int>()
                                    ..complete(queryEncuestasRecordCount(
                                      queryBuilder: (encuestasRecord) =>
                                          encuestasRecord
                                              .where(
                                                'modeloEncuesta',
                                                isEqualTo: widget.modelo,
                                              )
                                              .where(
                                                'terminada',
                                                isEqualTo: false,
                                              ),
                                    )))
                              .future,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Text(
                                    'Sin Terminar:',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    formatNumber(
                                      rowCount,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      StreamBuilder<List<EncuestasRecord>>(
                        stream: queryEncuestasRecord(
                          queryBuilder: (encuestasRecord) => encuestasRecord
                              .where(
                                'modeloEncuesta',
                                isEqualTo: widget.modelo,
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
                          List<EncuestasRecord> containerEncuestasRecordList =
                              snapshot.data!;

                          return Container(
                            height: 28.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Text(
                                      'Realizadas Hoy:',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleSmallIsCustom,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      formatNumber(
                                        functions.fechasHoy(
                                            containerEncuestasRecordList
                                                .map((e) => e.fechaTerminado)
                                                .withoutNulls
                                                .toList()),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleSmallIsCustom,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: StreamBuilder<List<EncuestasRecord>>(
                      stream: queryEncuestasRecord(
                        queryBuilder: (encuestasRecord) => encuestasRecord
                            .where(
                              'modeloEncuesta',
                              isEqualTo: widget.modelo,
                            )
                            .where(
                              'terminada',
                              isEqualTo: true,
                            )
                            .orderBy('fechaCreacion', descending: true),
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
                        List<EncuestasRecord> listViewEncuestasRecordList =
                            snapshot.data!;
                        if (listViewEncuestasRecordList.isEmpty) {
                          return NoHayElementosWidget();
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewEncuestasRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewEncuestasRecord =
                                listViewEncuestasRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewEncuestasRecord.usuario!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .barra,
                                          size: 24.0,
                                        ),
                                      ),
                                    );
                                  }

                                  final containerUsersRecord = snapshot.data!;

                                  return Container(
                                    width: 100.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ENCUESTAS_APLICADAS_POR_MODELO_ListTile_');
                                        HapticFeedback.lightImpact();
                                        if (listViewEncuestasRecord.terminada) {
                                          context.pushNamed(
                                            EncuestaTerminadaWidget.routeName,
                                            queryParameters: {
                                              'encuesta': serializeParam(
                                                listViewEncuestasRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'encuesta':
                                                  listViewEncuestasRecord,
                                            },
                                          );

                                          return;
                                        } else {
                                          return;
                                        }
                                      },
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          extentRatio: 0.25,
                                          children: [
                                            SlidableAction(
                                              label: 'Eliminar',
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              icon: Icons.folder_delete_rounded,
                                              onPressed: (_) async {
                                                logFirebaseEvent(
                                                    'ENCUESTAS_APLICADAS_POR_MODELO_SlidableA');
                                                var _shouldSetState = false;
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Está seguro?'),
                                                              content: Text(
                                                                  '¿Desea Eliminar esta Encuesta?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancelar'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirmar'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  _model.respuestaParaBorrar =
                                                      await queryRespuestasEncuestasRecordOnce(
                                                    queryBuilder:
                                                        (respuestasEncuestasRecord) =>
                                                            respuestasEncuestasRecord
                                                                .where(
                                                      'encuesta',
                                                      isEqualTo:
                                                          listViewEncuestasRecord
                                                              .reference,
                                                    ),
                                                  );
                                                  _shouldSetState = true;
                                                  await actions
                                                      .batchDeleteRespuestasEncuesta(
                                                    _model.respuestaParaBorrar!
                                                        .map((e) => e.reference)
                                                        .toList(),
                                                  );
                                                  await listViewEncuestasRecord
                                                      .reference
                                                      .delete();
                                                  safeSetState(() => _model
                                                          .firestoreRequestCompleter1 =
                                                      null);
                                                  await _model
                                                      .waitForFirestoreRequestCompleted1();
                                                  safeSetState(() => _model
                                                          .firestoreRequestCompleter2 =
                                                      null);
                                                  await _model
                                                      .waitForFirestoreRequestCompleted2();
                                                } else {
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            title: Text(
                                              '${dateTimeFormat(
                                                "d/M/y",
                                                listViewEncuestasRecord
                                                    .fechaCreacion,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} ${dateTimeFormat(
                                                "Hm",
                                                listViewEncuestasRecord
                                                    .fechaCreacion,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}'
                                                  .maybeHandleOverflow(
                                                maxChars: 50,
                                                replacement: '…',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: Colors.black,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallIsCustom,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              '${containerUsersRecord.nombres} ${containerUsersRecord.apPaterno} ${containerUsersRecord.apMaterno}'
                                                  .maybeHandleOverflow(
                                                maxChars: 50,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 28.0,
                                            ),
                                            tileColor: !listViewEncuestasRecord
                                                    .terminada
                                                ? FlutterFlowTheme.of(context)
                                                    .colorPromotor
                                                : FlutterFlowTheme.of(context)
                                                    .colorPromovido,
                                            dense: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
    );
  }
}
