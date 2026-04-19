import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'modelo_preguntas_encuesta_model.dart';
export 'modelo_preguntas_encuesta_model.dart';

class ModeloPreguntasEncuestaWidget extends StatefulWidget {
  const ModeloPreguntasEncuestaWidget({
    super.key,
    required this.modelo,
  });

  final ModelosEncuestasRecord? modelo;

  static String routeName = 'modeloPreguntasEncuesta';
  static String routePath = 'modeloPreguntasEncuesta';

  @override
  State<ModeloPreguntasEncuestaWidget> createState() =>
      _ModeloPreguntasEncuestaWidgetState();
}

class _ModeloPreguntasEncuestaWidgetState
    extends State<ModeloPreguntasEncuestaWidget> with TickerProviderStateMixin {
  late ModeloPreguntasEncuestaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModeloPreguntasEncuestaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'modeloPreguntasEncuesta'});
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
              logFirebaseEvent('MODELO_PREGUNTAS_ENCUESTA_chevron_left_r');
              context.pop();
            },
          ),
          title: Text(
            'Preguntas de la Encuesta',
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
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
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
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: SingleChildScrollView(
                                controller: _model.columnController1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      widget.modelo!.titulo,
                                      textAlign: TextAlign.center,
                                      maxLines: 5,
                                      minFontSize: 12.0,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleSmallIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: SingleChildScrollView(
                                controller: _model.columnController2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      widget.modelo!.descripcion,
                                      textAlign: TextAlign.center,
                                      maxLines: 10,
                                      minFontSize: 9.0,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 8.0,
                                borderWidth: 2.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MODELO_PREGUNTAS_ENCUESTA_add_ICN_ON_TAP');
                                  var _shouldSetState = false;
                                  HapticFeedback.lightImpact();
                                  _model.estaEncuestaUsadaI =
                                      await queryEncuestasRecordCount(
                                    queryBuilder: (encuestasRecord) =>
                                        encuestasRecord.where(
                                      'modeloEncuesta',
                                      isEqualTo: widget.modelo?.reference,
                                    ),
                                  );
                                  _shouldSetState = true;
                                  if (_model.estaEncuestaUsadaI! > 0) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: CustomAlertWidget(
                                              titulo: 'Encuesta en Uso!',
                                              mensaje:
                                                  'Existen Encuestas levantadas con este Modelo, por lo que no puede editar.',
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    context.pushNamed(
                                      ModuloPreguntasEncuestasWidget.routeName,
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

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<ModelosPreguntasEncuestaRecord>>(
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
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              listViewModelosPreguntasEncuestaRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewModelosPreguntasEncuestaRecord =
                                listViewModelosPreguntasEncuestaRecordList[
                                    listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Container(
                                width: double.infinity,
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
                                        'MODELO_PREGUNTAS_ENCUESTA_ListTile_zujc2');
                                    if (listViewModelosPreguntasEncuestaRecord
                                            .numRespuestas !=
                                        1) {
                                      context.pushNamed(
                                        EditarPreguntaEncuestaWidget.routeName,
                                        queryParameters: {
                                          'pregunta': serializeParam(
                                            listViewModelosPreguntasEncuestaRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'pregunta':
                                              listViewModelosPreguntasEncuestaRecord,
                                        },
                                      );
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
                                                'MODELO_PREGUNTAS_ENCUESTA_SlidableAction');
                                            var _shouldSetState = false;
                                            _model.otrasRespuestas =
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
                                                            'numero',
                                                            isGreaterThan:
                                                                listViewModelosPreguntasEncuestaRecord
                                                                    .numero,
                                                          ),
                                            );
                                            _shouldSetState = true;
                                            _model.hayEncuestas =
                                                await queryEncuestasRecordCount(
                                              queryBuilder: (encuestasRecord) =>
                                                  encuestasRecord.where(
                                                'modeloEncuesta',
                                                isEqualTo:
                                                    widget.modelo?.reference,
                                              ),
                                            );
                                            _shouldSetState = true;
                                            if (_model.hayEncuestas! > 0) {
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: CustomAlertWidget(
                                                        titulo:
                                                            'Encuesta en Uso!',
                                                        mensaje:
                                                            'Existen Encuestas levantadas con este Modelo, por lo que no puede eliminar.',
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
                                            if (_model.otrasRespuestas! > 0) {
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: CustomAlertWidget(
                                                        titulo:
                                                            'Preguntas subsecuentes!',
                                                        mensaje:
                                                            'Existen Preguntas subsecuentes!, Por favor elimine desde la última Pregunta.',
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
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen1 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen1)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen2 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen2)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen3 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen3)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen4 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen4)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen5 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen5)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen6 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen6)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen7 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen7)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen8 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen8)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen9 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen9)
                                                    .delete();
                                              }
                                              if (listViewModelosPreguntasEncuestaRecord
                                                          .imagen10 !=
                                                      '') {
                                                await FirebaseStorage.instance
                                                    .refFromURL(
                                                        listViewModelosPreguntasEncuestaRecord
                                                            .imagen10)
                                                    .delete();
                                              }
                                              await listViewModelosPreguntasEncuestaRecord
                                                  .reference
                                                  .delete();
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
                                          '${formatNumber(
                                            listViewModelosPreguntasEncuestaRecord
                                                .numero,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.periodDecimal,
                                          )} ${listViewModelosPreguntasEncuestaRecord.pregunta}',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
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
                                          '${formatNumber(
                                            listViewModelosPreguntasEncuestaRecord
                                                .numRespuestas,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.periodDecimal,
                                          )} Respuestas, ${listViewModelosPreguntasEncuestaRecord.multiSelect ? 'Multiselección, ' : ' '}${listViewModelosPreguntasEncuestaRecord.dependeDe?.id != null && listViewModelosPreguntasEncuestaRecord.dependeDe?.id != '' ? ' Dependiente' : ' '}',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelMediumIsCustom,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .colorPromotor,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
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
    );
  }
}
