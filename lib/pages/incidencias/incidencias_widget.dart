import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/incidente_card/incidente_card_widget.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'incidencias_model.dart';
export 'incidencias_model.dart';

class IncidenciasWidget extends StatefulWidget {
  const IncidenciasWidget({super.key});

  static String routeName = 'incidencias';
  static String routePath = 'incidencias';

  @override
  State<IncidenciasWidget> createState() => _IncidenciasWidgetState();
}

class _IncidenciasWidgetState extends State<IncidenciasWidget>
    with TickerProviderStateMixin {
  late IncidenciasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncidenciasModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'incidencias'});
    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -100.0),
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
              logFirebaseEvent('INCIDENCIAS_chevron_left_rounded_ICN_ON_');
              context.pop();
            },
          ),
          title: Text(
            'Reporte de Campo',
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
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: SingleChildScrollView(
              controller: _model.columnController1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!valueOrDefault<bool>(currentUserDocument?.root, false))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 20.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/images/logo_Encuestas_sin_fondo.png',
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation']!),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'Nuevo Reporte',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleMediumIsCustom,
                                    ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: 30.0,
                              borderWidth: 8.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'INCIDENCIAS_PAGE_add_ICN_ON_TAP');
                                HapticFeedback.lightImpact();

                                context.pushNamed(NuevoReporteWidget.routeName);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      controller: _model.columnController2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.85,
                            decoration: BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => RefreshIndicator(
                                onRefresh: () async {
                                  logFirebaseEvent(
                                      'INCIDENCIAS_ListViewRoot_ON_PULL_TO_REFR');
                                  HapticFeedback.heavyImpact();

                                  safeSetState(() {});
                                },
                                child: PagedListView<DocumentSnapshot<Object?>?,
                                    IncidenciasRecord>(
                                  pagingController:
                                      _model.setListViewRootController(
                                    IncidenciasRecord.collection
                                        .where(
                                          'membresia',
                                          isEqualTo:
                                              currentUserDocument?.membresia,
                                        )
                                        .where(
                                          'Destinatarios',
                                          arrayContains: currentUserReference,
                                        )
                                        .orderBy('timestamp', descending: true),
                                  ),
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate: PagedChildBuilderDelegate<
                                      IncidenciasRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .barra,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .barra,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    noItemsFoundIndicatorBuilder: (_) =>
                                        Container(
                                      width: double.infinity,
                                      height: 300.0,
                                      child: NoHayElementosWidget(),
                                    ),
                                    itemBuilder:
                                        (context, _, listViewRootIndex) {
                                      final listViewRootIncidenciasRecord =
                                          _model.listViewRootPagingController!
                                              .itemList![listViewRootIndex];
                                      return wrapWithModel(
                                        model:
                                            _model.incidenteCardModels.getModel(
                                          listViewRootIncidenciasRecord
                                              .reference.id,
                                          listViewRootIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: IncidenteCardWidget(
                                          key: Key(
                                            'Keymds_${listViewRootIncidenciasRecord.reference.id}',
                                          ),
                                          incidente:
                                              listViewRootIncidenciasRecord,
                                        ),
                                      );
                                    },
                                  ),
                                ),
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
