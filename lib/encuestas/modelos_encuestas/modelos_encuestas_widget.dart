import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'modelos_encuestas_model.dart';
export 'modelos_encuestas_model.dart';

class ModelosEncuestasWidget extends StatefulWidget {
  const ModelosEncuestasWidget({super.key});

  static String routeName = 'modelosEncuestas';
  static String routePath = 'modelosEncuestas';

  @override
  State<ModelosEncuestasWidget> createState() => _ModelosEncuestasWidgetState();
}

class _ModelosEncuestasWidgetState extends State<ModelosEncuestasWidget>
    with TickerProviderStateMixin {
  late ModelosEncuestasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModelosEncuestasModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'modelosEncuestas'});
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
              logFirebaseEvent('MODELOS_ENCUESTAS_chevron_left_rounded_I');
              context.pop();
            },
          ),
          title: Text(
            'Modelos de Encuestas',
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
                  height: 120.0,
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
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      'assets/images/ENCUESTAS.png',
                                      width: 100.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation2']!),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                                      'MODELOS_ENCUESTAS_PAGE_add_ICN_ON_TAP');
                                  HapticFeedback.lightImpact();

                                  context.pushNamed(
                                      NuevoModeloEncuestaWidget.routeName);
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
                  child: AuthUserStreamWidget(
                    builder: (context) =>
                        StreamBuilder<List<ModelosEncuestasRecord>>(
                      stream: queryModelosEncuestasRecord(
                        queryBuilder: (modelosEncuestasRecord) =>
                            modelosEncuestasRecord
                                .where(
                                  'membresia',
                                  isEqualTo: currentUserDocument?.membresia,
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
                        List<ModelosEncuestasRecord>
                            listViewModelosEncuestasRecordList = snapshot.data!;
                        if (listViewModelosEncuestasRecordList.isEmpty) {
                          return NoHayElementosWidget();
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewModelosEncuestasRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewModelosEncuestasRecord =
                                listViewModelosEncuestasRecordList[
                                    listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: StreamBuilder<
                                  List<ModelosPreguntasEncuestaRecord>>(
                                stream: queryModelosPreguntasEncuestaRecord(
                                  queryBuilder:
                                      (modelosPreguntasEncuestaRecord) =>
                                          modelosPreguntasEncuestaRecord
                                              .where(
                                                'modeloEncuesta',
                                                isEqualTo:
                                                    listViewModelosEncuestasRecord
                                                        .reference,
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
                                          color: FlutterFlowTheme.of(context)
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
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: FutureBuilder<int>(
                                      future:
                                          queryModelosPreguntasEncuestaRecordCount(
                                        queryBuilder:
                                            (modelosPreguntasEncuestaRecord) =>
                                                modelosPreguntasEncuestaRecord
                                                    .where(
                                          'modeloEncuesta',
                                          isEqualTo:
                                              listViewModelosEncuestasRecord
                                                  .reference,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .barra,
                                                size: 24.0,
                                              ),
                                            ),
                                          );
                                        }
                                        int listTileCount = snapshot.data!;

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MODELOS_ENCUESTAS_ListTile_m992fz4j_ON_T');

                                            context.pushNamed(
                                              ModeloPreguntasEncuestaWidget
                                                  .routeName,
                                              queryParameters: {
                                                'modelo': serializeParam(
                                                  listViewModelosEncuestasRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'modelo':
                                                    listViewModelosEncuestasRecord,
                                              },
                                            );
                                          },
                                          onLongPress: () async {
                                            logFirebaseEvent(
                                                'MODELOS_ENCUESTAS_ListTile_m992fz4j_ON_L');
                                            var _shouldSetState = false;
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Clonar Modelo'),
                                                          content: Text(
                                                              '¿Desea Clonar este Modelo de Encuesta?'),
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
                                              var modelosEncuestasRecordReference =
                                                  ModelosEncuestasRecord
                                                      .collection
                                                      .doc();
                                              await modelosEncuestasRecordReference
                                                  .set(
                                                      createModelosEncuestasRecordData(
                                                descripcion:
                                                    listViewModelosEncuestasRecord
                                                        .descripcion,
                                                pitch:
                                                    listViewModelosEncuestasRecord
                                                        .pitch,
                                                fechaCreacion:
                                                    getCurrentTimestamp,
                                                activa: false,
                                                membresia: currentUserDocument
                                                    ?.membresia,
                                                titulo:
                                                    'Copia de ${listViewModelosEncuestasRecord.titulo} ${dateTimeFormat(
                                                  "d/M/y",
                                                  getCurrentTimestamp,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )}, ${dateTimeFormat(
                                                  "jms",
                                                  getCurrentTimestamp,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )}',
                                              ));
                                              _model.copiaModelo =
                                                  ModelosEncuestasRecord
                                                      .getDocumentFromData(
                                                          createModelosEncuestasRecordData(
                                                            descripcion:
                                                                listViewModelosEncuestasRecord
                                                                    .descripcion,
                                                            pitch:
                                                                listViewModelosEncuestasRecord
                                                                    .pitch,
                                                            fechaCreacion:
                                                                getCurrentTimestamp,
                                                            activa: false,
                                                            membresia:
                                                                currentUserDocument
                                                                    ?.membresia,
                                                            titulo:
                                                                'Copia de ${listViewModelosEncuestasRecord.titulo} ${dateTimeFormat(
                                                              "d/M/y",
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}, ${dateTimeFormat(
                                                              "jms",
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                          ),
                                                          modelosEncuestasRecordReference);
                                              _shouldSetState = true;
                                              await actions
                                                  .batchCloneModeloRespuestas(
                                                _model.copiaModelo!.reference,
                                                listViewModelosEncuestasRecord
                                                    .reference,
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
                                                            'Modelo Clonado!',
                                                        mensaje:
                                                            'Se ha creado un nuevo Modelo, llamado \"${_model.copiaModelo?.titulo}\".',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              safeSetState(() {});
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 1.0,
                                              children: [
                                                SlidableAction(
                                                  label: 'Eliminar',
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  icon: Icons
                                                      .folder_delete_rounded,
                                                  onPressed: (_) async {
                                                    logFirebaseEvent(
                                                        'MODELOS_ENCUESTAS_SlidableActionWidget_z');
                                                    var _shouldSetState = false;
                                                    _model.respuestas =
                                                        await queryModelosPreguntasEncuestaRecordCount(
                                                      queryBuilder:
                                                          (modelosPreguntasEncuestaRecord) =>
                                                              modelosPreguntasEncuestaRecord
                                                                  .where(
                                                        'modeloEncuesta',
                                                        isEqualTo:
                                                            listViewModelosEncuestasRecord
                                                                .reference,
                                                      ),
                                                    );
                                                    _shouldSetState = true;
                                                    if (_model.respuestas! >
                                                        0) {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Esta Encuesta contiene Preguntas'),
                                                                    content: Text(
                                                                        '¿Desear Eliminarla de todas maneras?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancelar'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
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
                                                        await actions
                                                            .batchDeleteModelosRespuestas(
                                                          listViewModelosEncuestasRecord
                                                              .reference,
                                                        );
                                                      } else {
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    }
                                                    await listViewModelosEncuestasRecord
                                                        .reference
                                                        .delete();
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                ),
                                                SlidableAction(
                                                  label: 'Editar',
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  icon: FontAwesomeIcons.edit,
                                                  onPressed: (_) async {
                                                    logFirebaseEvent(
                                                        'MODELOS_ENCUESTAS_SlidableActionWidget_s');
                                                    _model.tieneEncuestas =
                                                        await queryEncuestasRecordCount(
                                                      queryBuilder:
                                                          (encuestasRecord) =>
                                                              encuestasRecord
                                                                  .where(
                                                        'modeloEncuesta',
                                                        isEqualTo:
                                                            listViewModelosEncuestasRecord
                                                                .reference,
                                                      ),
                                                    );
                                                    if (_model.tieneEncuestas! >
                                                        0) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
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
                                                                    'Tiene Encuestas Aplicadas!',
                                                                mensaje:
                                                                    'Este Modelo ya cuenta con Encuestas Aplicadas, por lo que no puede ser modificada!',
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      context.pushNamed(
                                                        EditarModeloEncuestaWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'modelo':
                                                              serializeParam(
                                                            listViewModelosEncuestasRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                ),
                                                SlidableAction(
                                                  label: 'Activar',
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                  icon: Icons
                                                      .notifications_active_outlined,
                                                  onPressed: (_) async {
                                                    logFirebaseEvent(
                                                        'MODELOS_ENCUESTAS_SlidableActionWidget_2');

                                                    await listViewModelosEncuestasRecord
                                                        .reference
                                                        .update(
                                                            createModelosEncuestasRecordData(
                                                      activa:
                                                          !listViewModelosEncuestasRecord
                                                              .activa,
                                                    ));
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
                                                                  'Modelo Actualizado',
                                                              mensaje: !listViewModelosEncuestasRecord
                                                                      .activa
                                                                  ? 'El Modelo ha sido Activado!'
                                                                  : 'El Modelo ha sido Desactivado!',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                ),
                                                SlidableAction(
                                                  label: 'Archivo',
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary600,
                                                  icon:
                                                      FontAwesomeIcons.fileCsv,
                                                  onPressed: (_) async {
                                                    logFirebaseEvent(
                                                        'MODELOS_ENCUESTAS_SlidableActionWidget_k');
                                                    if (isWeb) {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Descargar'),
                                                                    content: Text(
                                                                        '¿Desea Descargar este Modelo?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancelar'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
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
                                                        if (listTileCount > 0) {
                                                          await actions
                                                              .downloadModeloEncuestaAsCSV(
                                                            listViewModelosEncuestasRecord
                                                                .titulo,
                                                            containerModelosPreguntasEncuestaRecordList
                                                                .toList(),
                                                          );
                                                          return;
                                                        } else {
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
                                                                        'Sin Preguntas',
                                                                    mensaje:
                                                                        'Este Modelo aún no tiene Preguntas.',
                                                                    alerta:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          return;
                                                        }
                                                      } else {
                                                        return;
                                                      }
                                                    } else {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
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
                                                                    'Solo Disponible en Web',
                                                                mensaje:
                                                                    'Esta Opción solo está disponible en Web vía Google Chrome en:  prometheus.daangu.com',
                                                                alerta: true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      return;
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: ListTile(
                                                title: Text(
                                                  '${listViewModelosEncuestasRecord.titulo}, ${formatNumber(
                                                    listTileCount,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType: DecimalType
                                                        .periodDecimal,
                                                  )} Preguntas',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: listViewModelosEncuestasRecord
                                                                    .activa
                                                                ? Colors.black
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                ),
                                                subtitle: Text(
                                                  listViewModelosEncuestasRecord
                                                      .descripcion,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            color: listViewModelosEncuestasRecord
                                                                    .activa
                                                                ? Colors.black
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumIsCustom,
                                                          ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    listViewModelosEncuestasRecord
                                                            .activa
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .colorPromotor
                                                        : Colors.white,
                                                dense: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
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
