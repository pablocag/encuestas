import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/compartir_a_p_p/compartir_a_p_p_widget.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/dark_light_switch_large/dark_light_switch_large_widget.dart';
import '/components/membresia_activada/membresia_activada_widget.dart';
import '/components/tooltip_card/tooltip_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'homePage';
  static String routePath = 'homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_homePage_ON_INIT_STATE');
      FFAppState().email = currentUserEmail;
      safeSetState(() {});
      _model.internet = true;
      safeSetState(() {});
      if (!FFAppState().cuentas.contains(currentUserEmail)) {
        FFAppState().addToCuentas(currentUserEmail);
        safeSetState(() {});
      }
      if (valueOrDefault<bool>(currentUserDocument?.tieneMembresia, false)) {
        _model.membresiaActiva = await actions.checarMembresiaActiva(
          currentUserDocument!.membresia!,
        );
        if (_model.membresiaActiva!) {
          if (FFAppState().version < getRemoteConfigInt('version')) {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: CustomAlertWidget(
                      titulo: 'Actualización Disponible!',
                      mensaje:
                          'Actualmente, cuentas con la Versión ${formatNumber(
                        FFAppState().version,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.periodDecimal,
                      )} de Prometheus. Existe una nueva versión (Versión ${formatNumber(
                        getRemoteConfigInt('version'),
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.periodDecimal,
                      )}) de la App, por lo que requieres actualizarla cuanto antes. Gracias',
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          }
        } else {
          context.goNamed(MembresiaInactivaWidget.routeName);
        }

        if (valueOrDefault<bool>(currentUserDocument?.promotor, false) &&
            !valueOrDefault<bool>(currentUserDocument?.root, false) &&
            !valueOrDefault<bool>(currentUserDocument?.god, false)) {
          _model.padrePromotor =
              await UsersRecord.getDocumentOnce(currentUserDocument!.padre!);

          await currentUserReference!.update(createUsersRecordData(
            nivel: _model.padrePromotor!.nivel + 1,
          ));
          _model.yoPromovido = await queryPromovidosRecordOnce(
            queryBuilder: (promovidosRecord) => promovidosRecord.where(
              'userRef',
              isEqualTo: currentUserReference,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);

          await _model.yoPromovido!.reference.update(createPromovidosRecordData(
            nivel: _model.padrePromotor!.nivel + 1,
          ));
        }
      }
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 600),
        callback: (timer) async {
          _model.hayInternet = await actions.checkInternetConnection();
          _model.internet = valueOrDefault<bool>(
            _model.hayInternet,
            false,
          );
          safeSetState(() {});
        },
        startImmediately: true,
      );
    });

    _model.pinCodePromotorFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 700.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 900.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1000.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1000.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1000.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1000.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-5.0, -5.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-5.0, -5.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation': AnimationInfo(
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

    return StreamBuilder<List<PromovidosRecord>>(
      stream: queryPromovidosRecord(
        queryBuilder: (promovidosRecord) => promovidosRecord.where(
          'email',
          isEqualTo: currentUserEmail != '' ? currentUserEmail : null,
        ),
        singleRecord: true,
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
        List<PromovidosRecord> homePagePromovidosRecordList = snapshot.data!;
        final homePagePromovidosRecord = homePagePromovidosRecordList.isNotEmpty
            ? homePagePromovidosRecordList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              endDrawer: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: Drawer(
                  elevation: 16.0,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.internet ?? true)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 10.0),
                                child: SingleChildScrollView(
                                  controller: _model.columnController2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if ((valueOrDefault(
                                                  currentUserDocument?.nivel,
                                                  0) <=
                                              0) &&
                                          valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.tieneMembresia,
                                              false) &&
                                          !valueOrDefault<bool>(
                                              currentUserDocument?.god,
                                              false) &&
                                          valueOrDefault<bool>(
                                              currentUserDocument?.activo,
                                              false))
                                        Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                StreamBuilder<MembresiasRecord>(
                                                  stream: MembresiasRecord
                                                      .getDocument(
                                                          currentUserDocument!
                                                              .membresia!),
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

                                                    final buttonMembresiasRecord =
                                                        snapshot.data!;

                                                    return FFButtonWidget(
                                                      onPressed: !valueOrDefault<
                                                                  bool>(
                                                              currentUserDocument
                                                                  ?.activo,
                                                              false)
                                                          ? null
                                                          : () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_NUMERALIA_BTN_ON_TAP');
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              Navigator.pop(
                                                                  context);

                                                              context.pushNamed(
                                                                NumeraliaWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'membresia':
                                                                      serializeParam(
                                                                    buttonMembresiasRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'membresia':
                                                                      buttonMembresiasRecord,
                                                                },
                                                              );
                                                            },
                                                      text: 'Numeralia',
                                                      icon: Icon(
                                                        Icons.bar_chart_rounded,
                                                        size: 18.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 180.0,
                                                        height: 35.0,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                        elevation: 5.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                          currentUserDocument?.god, false))
                                        Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                StreamBuilder<MembresiasRecord>(
                                                  stream: MembresiasRecord
                                                      .getDocument(
                                                          currentUserDocument!
                                                              .membresia!),
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

                                                    final buttonMembresiasRecord =
                                                        snapshot.data!;

                                                    return FFButtonWidget(
                                                      onPressed: !valueOrDefault<
                                                                  bool>(
                                                              currentUserDocument
                                                                  ?.activo,
                                                              false)
                                                          ? null
                                                          : () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_RED_ACIVA_BTN_ON_TAP');
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              Navigator.pop(
                                                                  context);

                                                              context.pushNamed(
                                                                  NetworkActivosWidget
                                                                      .routeName);
                                                            },
                                                      text: 'Red Aciva',
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .connectdevelop,
                                                        size: 18.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 180.0,
                                                        height: 35.0,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                        elevation: 5.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if ((valueOrDefault(
                                                  currentUserDocument?.nivel,
                                                  0) <=
                                              0) &&
                                          valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.tieneMembresia,
                                              false) &&
                                          !valueOrDefault<bool>(
                                              currentUserDocument?.god,
                                              false) &&
                                          valueOrDefault<bool>(
                                              currentUserDocument?.activo,
                                              false))
                                        Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                StreamBuilder<MembresiasRecord>(
                                              stream:
                                                  MembresiasRecord.getDocument(
                                                      currentUserDocument!
                                                          .membresia!),
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

                                                final rowMembresiasRecord =
                                                    snapshot.data!;

                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons.pollH,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18.0,
                                                      ),
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
                                                        valueOrDefault<String>(
                                                          '${formatNumber(
                                                            rowMembresiasRecord
                                                                .paqueteEncuestas,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .periodDecimal,
                                                          )} Encuestas Disponibles',
                                                          'No tiene Encuestas Disponibles',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      if ((valueOrDefault(
                                                  currentUserDocument?.nivel,
                                                  0) <=
                                              0) &&
                                          valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.tieneMembresia,
                                              false) &&
                                          !valueOrDefault<bool>(
                                              currentUserDocument?.god,
                                              false) &&
                                          valueOrDefault<bool>(
                                              currentUserDocument?.activo,
                                              false))
                                        Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                StreamBuilder<MembresiasRecord>(
                                              stream:
                                                  MembresiasRecord.getDocument(
                                                      currentUserDocument!
                                                          .membresia!),
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

                                                final rowMembresiasRecord =
                                                    snapshot.data!;

                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.person_add,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18.0,
                                                      ),
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
                                                        valueOrDefault<String>(
                                                          '${formatNumber(
                                                            rowMembresiasRecord
                                                                .paquetePersonas,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .periodDecimal,
                                                          )} Personas Disponibles',
                                                          'No tiene Personas Disponibles',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                          currentUserDocument?.activo, false))
                                        Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Row_qs5vd1a0_ON_TAP');
                                                FFAppState().email =
                                                    currentUserEmail;
                                                safeSetState(() {});
                                                Navigator.pop(context);

                                                context.pushNamed(
                                                    MiPerfilWidget.routeName);
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Icon(
                                                      Icons.person,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Mi Perfil',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child:
                                            FutureBuilder<List<TextosRecord>>(
                                          future: queryTextosRecordOnce(
                                            queryBuilder: (textosRecord) =>
                                                textosRecord.where(
                                              'titulo',
                                              isEqualTo: 'Aviso de Privacidad',
                                            ),
                                            singleRecord: true,
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
                                            List<TextosRecord>
                                                rowTextosRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final rowTextosRecord =
                                                rowTextosRecordList.isNotEmpty
                                                    ? rowTextosRecordList.first
                                                    : null;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Row_48war4pe_ON_TAP');
                                                Navigator.pop(context);

                                                context.pushNamed(
                                                  AcuerdosWidget.routeName,
                                                  queryParameters: {
                                                    'texto': serializeParam(
                                                      rowTextosRecord
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Icon(
                                                      Icons.privacy_tip,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Aviso de Privacidad',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child:
                                            FutureBuilder<List<TextosRecord>>(
                                          future: queryTextosRecordOnce(
                                            queryBuilder: (textosRecord) =>
                                                textosRecord.where(
                                              'titulo',
                                              isEqualTo: 'EULA/CLUF',
                                            ),
                                            singleRecord: true,
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
                                            List<TextosRecord>
                                                rowTextosRecordList =
                                                snapshot.data!;
                                            final rowTextosRecord =
                                                rowTextosRecordList.isNotEmpty
                                                    ? rowTextosRecordList.first
                                                    : null;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Row_iulivnx8_ON_TAP');
                                                Navigator.pop(context);

                                                context.pushNamed(
                                                  AcuerdosWidget.routeName,
                                                  queryParameters: {
                                                    'texto': serializeParam(
                                                      rowTextosRecord
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .shekelSign,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Licencia de Usuario Final',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child:
                                            FutureBuilder<List<TextosRecord>>(
                                          future: queryTextosRecordOnce(
                                            queryBuilder: (textosRecord) =>
                                                textosRecord.where(
                                              'titulo',
                                              isEqualTo: 'Acerca de...',
                                            ),
                                            singleRecord: true,
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
                                            List<TextosRecord>
                                                rowTextosRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final rowTextosRecord =
                                                rowTextosRecordList.isNotEmpty
                                                    ? rowTextosRecordList.first
                                                    : null;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Row_9qnvlrir_ON_TAP');
                                                Navigator.pop(context);

                                                context.pushNamed(
                                                  AcuerdosWidget.routeName,
                                                  queryParameters: {
                                                    'texto': serializeParam(
                                                      rowTextosRecord
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .info_outline_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Acerca de...',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 10.0, 5.0, 15.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_PAGE_Row_sgjy1y3o_ON_TAP');
                                FFAppState().email = currentUserEmail;
                                safeSetState(() {});
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(WelcomePageWidget.routeName,
                                    context.mounted);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.logout_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 40.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Cerrar Sesión',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.god, false))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_ADMINISTRADOR_BTN_ON_TAP');
                                          HapticFeedback.lightImpact();

                                          context.pushNamed(
                                              GodPageWidget.routeName);
                                        },
                                        text: 'Administrador',
                                        icon: FaIcon(
                                          FontAwesomeIcons.code,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .barra,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 5.0, 10.0, 8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: wrapWithModel(
                                      model: _model.darkLightSwitchLargeModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: DarkLightSwitchLargeWidget(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).barra,
                automaticallyImplyLeading: false,
                title: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Encuestas Prometheus',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineMediumIsCustom,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 3.0, 5.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3.0, 0.0, 3.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Image_jq47qx0l_ON_TAP');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: valueOrDefault<String>(
                                                    currentUserPhoto,
                                                    'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                  ),
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                            ),
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                ),
                                                width: 48.0,
                                                height: 48.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 3.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 0.0, 2.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_PAGE_Text_xabik9ls_ON_TAP');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    if (_model.internet!) {
                                                      if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.activo,
                                                          false)) {
                                                        context.pushNamed(
                                                            MiPerfilWidget
                                                                .routeName);

                                                        return;
                                                      } else {
                                                        return;
                                                      }
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                  child: AutoSizeText(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.nombres,
                                                        ''),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 3.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_PAGE_Text_p7dgu5uw_ON_TAP');
                                                            HapticFeedback
                                                                .lightImpact();
                                                            if (_model
                                                                .internet!) {
                                                              if (valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.activo,
                                                                  false)) {
                                                                context.pushNamed(
                                                                    MiPerfilWidget
                                                                        .routeName);

                                                                return;
                                                              } else {
                                                                return;
                                                              }
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          child: AutoSizeText(
                                                            '${valueOrDefault(currentUserDocument?.apPaterno, '')} ${valueOrDefault(currentUserDocument?.apMaterno, '')}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (_model.internet ?? true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 5.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FutureBuilder<int>(
                                              future:
                                                  queryNotificacionesRecordCount(
                                                queryBuilder:
                                                    (notificacionesRecord) =>
                                                        notificacionesRecord
                                                            .where(
                                                  'destinatarios',
                                                  arrayContains:
                                                      currentUserReference,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .barra,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int containerDestinatariosCount =
                                                    snapshot.data!;

                                                return Container(
                                                  height: 50.0,
                                                  decoration: BoxDecoration(),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryNotificacionesRecordCount(
                                                      queryBuilder:
                                                          (notificacionesRecord) =>
                                                              notificacionesRecord
                                                                  .where(
                                                        'leidoPor',
                                                        arrayContains:
                                                            currentUserReference,
                                                      ),
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
                                                      int containerLeidoPorCount =
                                                          snapshot.data!;

                                                      return Container(
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (containerDestinatariosCount !=
                                                                containerLeidoPorCount)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Nuevos\nMensajes!',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'textOnPageLoadAnimation']!),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_Icon_ckwrgylu_ON_TAP');
                                                                      HapticFeedback
                                                                          .lightImpact();
                                                                      if (valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.activo,
                                                                          false)) {
                                                                        context.pushNamed(
                                                                            NotificacionesWidget.routeName);

                                                                        return;
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    },
                                                                    onLongPress:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_Icon_ckwrgylu_ON_LONG_PRESS');
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            false,
                                                                        avoidOverflow:
                                                                            true,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(-1.0, 1.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: TooltipCardWidget(
                                                                                texto: 'Mensajes',
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .notifications_active,
                                                                      color: containerDestinatariosCount !=
                                                                              containerLeidoPorCount
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .success,
                                                                      size:
                                                                          36.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_PAGE_PAGE_Icon_1dnmqn1o_ON_TAP');
                                                                        HapticFeedback
                                                                            .lightImpact();
                                                                        if (valueOrDefault<bool>(
                                                                            currentUserDocument?.activo,
                                                                            false)) {
                                                                          context
                                                                              .pushNamed(MiQRCodeWidget.routeName);

                                                                          return;
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      },
                                                                      onLongPress:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_Icon_1dnmqn1o_ON_LONG_PRESS');
                                                                        await showAlignedDialog(
                                                                          context:
                                                                              context,
                                                                          isGlobal:
                                                                              false,
                                                                          avoidOverflow:
                                                                              true,
                                                                          targetAnchor:
                                                                              AlignmentDirectional(-1.0, 1.0).resolve(Directionality.of(context)),
                                                                          followerAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Material(
                                                                              color: Colors.transparent,
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: TooltipCardWidget(
                                                                                  texto: 'Activo/Inactivo',
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .person_pin_circle_outlined,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          valueOrDefault<bool>(currentUserDocument?.activo, false)
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).error,
                                                                          FlutterFlowTheme.of(context)
                                                                              .success,
                                                                        ),
                                                                        size:
                                                                            36.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _model.columnQureyPadreScrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.tieneMembresia, false))
                                  AuthUserStreamWidget(
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.promotor,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 10.0, 8.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: StreamBuilder<
                                                      MembresiasRecord>(
                                                    stream: FFAppState()
                                                        .membresiaLogo(
                                                      requestFn: () =>
                                                          MembresiasRecord.getDocument(
                                                              currentUserDocument!
                                                                  .membresia!),
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

                                                      final rowMembresiasRecord =
                                                          snapshot.data!;

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Encuestas Disponibles: ${valueOrDefault<String>(
                                                              formatNumber(
                                                                rowMembresiasRecord
                                                                    .paqueteEncuestas,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .periodDecimal,
                                                              ),
                                                              '0',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: () {
                                                                    if (rowMembresiasRecord
                                                                            .paqueteEncuestas <
                                                                        50) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    } else if (rowMembresiasRecord
                                                                            .paqueteEncuestas <
                                                                        100) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .colorPromotor;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation1']!),
                                          ),
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.promotor,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 10.0, 8.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: StreamBuilder<
                                                      MembresiasRecord>(
                                                    stream: FFAppState()
                                                        .membresiaLogo(
                                                      requestFn: () =>
                                                          MembresiasRecord.getDocument(
                                                              currentUserDocument!
                                                                  .membresia!),
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

                                                      final rowMembresiasRecord =
                                                          snapshot.data!;

                                                      return Row(
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
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: StreamBuilder<
                                                                MembresiasRecord>(
                                                              stream: FFAppState()
                                                                  .membresiaLogo(
                                                                requestFn: () =>
                                                                    MembresiasRecord.getDocument(
                                                                        currentUserDocument!
                                                                            .membresia!),
                                                              ),
                                                              builder: (context,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .barra,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final buttonConINEMembresiasRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return FFButtonWidget(
                                                                  onPressed: !valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.activo,
                                                                          false)
                                                                      ? null
                                                                      : () async {
                                                                          logFirebaseEvent(
                                                                              'HOME_PAGE_PAGE_ButtonConINE_ON_TAP');
                                                                          HapticFeedback
                                                                              .lightImpact();
                                                                          if (buttonConINEMembresiasRecord.paquetePersonas <=
                                                                              0) {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: CustomAlertWidget(
                                                                                      titulo: 'Límite Alcanzado',
                                                                                      mensaje: 'Se ha alcanzado el Límite de Personas en su Membresía, para más información comuníquese con el Administrador de Prometheus',
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            return;
                                                                          } else {
                                                                            context.pushNamed(MisEncuestadoresWidget.routeName);

                                                                            return;
                                                                          }
                                                                        },
                                                                  text:
                                                                      'Mis Encuestadores',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .person_2,
                                                                    size: 32.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        250.0,
                                                                    height:
                                                                        40.0,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .barra,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    disabledColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation2']!),
                                          ),
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.promotor,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 5.0),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: FFButtonWidget(
                                                          onPressed: (!_model
                                                                      .internet! ||
                                                                  !valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.activo,
                                                                      false))
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_MENSAJE_A_MIS_ENCUESTADORES_BTN_ON_');
                                                                  HapticFeedback
                                                                      .lightImpact();
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.root,
                                                                      false)) {
                                                                    context.pushNamed(
                                                                        NuevoMensajeRootWidget
                                                                            .routeName);

                                                                    return;
                                                                  } else {
                                                                    context.pushNamed(
                                                                        NuevoMensajeWidget
                                                                            .routeName);

                                                                    return;
                                                                  }
                                                                },
                                                          text:
                                                              'Mensaje a mis Encuestadores',
                                                          icon: Icon(
                                                            Icons.message_sharp,
                                                            size: 32.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 250.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation3']!),
                                          ),
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.promotor,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Row(
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
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: FFButtonWidget(
                                                          onPressed: (!_model
                                                                      .internet! ||
                                                                  !valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.activo,
                                                                      false))
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_REPORTES_DE_CAMPO_BTN_ON_TAP');
                                                                  HapticFeedback
                                                                      .lightImpact();
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.root,
                                                                      false)) {
                                                                    context.pushNamed(
                                                                        IncidenciasRootWidget
                                                                            .routeName);

                                                                    return;
                                                                  } else {
                                                                    context.pushNamed(
                                                                        IncidenciasWidget
                                                                            .routeName);

                                                                    return;
                                                                  }
                                                                },
                                                          text:
                                                              'Reportes de Campo',
                                                          icon: Icon(
                                                            Icons.work_rounded,
                                                            size: 32.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 250.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation4']!),
                                          ),
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.promotor,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 5.0),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: FFButtonWidget(
                                                          onPressed: (!_model
                                                                      .internet! ||
                                                                  !valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.activo,
                                                                      false))
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_PUBLICACIONES_Y_NOTICIAS_BTN_ON_TAP');
                                                                  HapticFeedback
                                                                      .lightImpact();
                                                                  FFAppState()
                                                                          .fechaCreacionUsuario =
                                                                      homePagePromovidosRecord
                                                                          ?.fecha;
                                                                  safeSetState(
                                                                      () {});

                                                                  context.pushNamed(
                                                                      NoticiasWidget
                                                                          .routeName);
                                                                },
                                                          text:
                                                              'Publicaciones y Noticias',
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .photoVideo,
                                                            size: 32.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 250.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor4,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation5']!),
                                          ),
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.promotor,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 3.0),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: FFButtonWidget(
                                                          onPressed: !valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.activo,
                                                                  false)
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_ENCUESTAS_DE_CAMPO_BTN_ON_TAP');
                                                                  HapticFeedback
                                                                      .lightImpact();

                                                                  context.pushNamed(
                                                                      ModuloEncuestasWidget
                                                                          .routeName);
                                                                },
                                                          text:
                                                              'Encuestas de Campo',
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .voteYea,
                                                            size: 32.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 250.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation6']!),
                                          ),
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.promotor,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 3.0),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: FFButtonWidget(
                                                          onPressed: !valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.activo,
                                                                  false)
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_COMPRAR_ENCUESTAS_BTN_ON_TAP');
                                                                  HapticFeedback
                                                                      .lightImpact();

                                                                  context.pushNamed(
                                                                      EncuestasComprarWidget
                                                                          .routeName);
                                                                },
                                                          text:
                                                              'Comprar Encuestas',
                                                          icon: Icon(
                                                            Icons
                                                                .shopping_cart_rounded,
                                                            size: 32.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 250.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation7']!),
                                          ),
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.promotor,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 10.0, 8.0, 3.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Botón de Pánico',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onLongPress:
                                                              () async {
                                                            logFirebaseEvent(
                                                                'HOME_Image_xir2xlan_ON_LONG_PRESS');
                                                            currentUserLocationValue =
                                                                await getCurrentUserLocation(
                                                                    defaultLocation:
                                                                        LatLng(
                                                                            0.0,
                                                                            0.0));
                                                            HapticFeedback
                                                                .vibrate();
                                                            _model.alertaTodos =
                                                                await queryUsersRecordOnce(
                                                              queryBuilder:
                                                                  (usersRecord) =>
                                                                      usersRecord
                                                                          .where(
                                                                            'membresia',
                                                                            isEqualTo:
                                                                                currentUserDocument?.membresia,
                                                                          )
                                                                          .where(
                                                                            'activo',
                                                                            isEqualTo:
                                                                                true,
                                                                          ),
                                                            );

                                                            await NotificacionesRecord
                                                                .collection
                                                                .doc()
                                                                .set({
                                                              ...createNotificacionesRecordData(
                                                                envidadoPor:
                                                                    currentUserReference,
                                                                mensaje:
                                                                    'Necesito AYUDA URGENTE!, Soy ${currentUserDisplayName} y me encuentro en: ${currentUserLocationValue?.toString()}, mi Teléfono es: ${currentPhoneNumber}',
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                gps:
                                                                    currentUserLocationValue,
                                                                tel:
                                                                    currentPhoneNumber,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'destinatarios': _model
                                                                      .alertaTodos
                                                                      ?.map((e) =>
                                                                          e.reference)
                                                                      .toList(),
                                                                },
                                                              ),
                                                            });
                                                            triggerPushNotification(
                                                              notificationTitle:
                                                                  'Necesito AYUDA URGENTE!',
                                                              notificationText:
                                                                  'Necesito AYUDA URGENTE!, Soy ${currentUserDisplayName} y me encuentro en: ${currentUserLocationValue?.toString()}, mi Teléfono es: ${currentPhoneNumber}',
                                                              notificationImageUrl:
                                                                  'https://firebasestorage.googleapis.com/v0/b/encuestas-prometheus-9tzwei.appspot.com/o/Icon-user.png?alt=media&token=f198a005-4b8e-43ca-94e1-a08be5217675',
                                                              notificationSound:
                                                                  'default',
                                                              userRefs: _model
                                                                  .alertaTodos!
                                                                  .map((e) => e
                                                                      .reference)
                                                                  .toList(),
                                                              initialPageName:
                                                                  'notificaciones',
                                                              parameterData: {},
                                                            );
                                                            await actions
                                                                .pushlocalNotificacion(
                                                              'Alerta enviada!',
                                                              'Se ha enviado una notificación a todos los usuarios!',
                                                            );
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        CustomAlertWidget(
                                                                      titulo:
                                                                          'Botón de Pánico Activado',
                                                                      mensaje:
                                                                          'Se ha alertado a todos los Usuarios',
                                                                      alerta:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        45.0),
                                                            child: Image.asset(
                                                              'assets/images/alerta.png',
                                                              width: 90.0,
                                                              height: 90.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Mantenga oprimido este botón\n para Solicitar Ayuda',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation8']!),
                                          ),
                                      ],
                                    ),
                                  ),
                                if (!valueOrDefault<bool>(
                                    currentUserDocument?.tieneMembresia, false))
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) =>
                                          StreamBuilder<List<TextosRecord>>(
                                        stream: queryTextosRecord(
                                          queryBuilder: (textosRecord) =>
                                              textosRecord.where(
                                            'titulo',
                                            isEqualTo: 'noesPromotor',
                                          ),
                                          singleRecord: true,
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
                                          List<TextosRecord>
                                              containerNoPromotorTextosRecordList =
                                              snapshot.data!;
                                          final containerNoPromotorTextosRecord =
                                              containerNoPromotorTextosRecordList
                                                      .isNotEmpty
                                                  ? containerNoPromotorTextosRecordList
                                                      .first
                                                  : null;

                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 8.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.75,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: SingleChildScrollView(
                                                controller:
                                                    _model.columnController1,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Html(
                                                      data:
                                                          containerNoPromotorTextosRecord!
                                                              .texto,
                                                      onLinkTap: (url, _, __) =>
                                                          launchURL(url!),
                                                    ),
                                                    Text(
                                                      'Si usted cuenta con el número PIN, escríbalo aquí para activar su membresía',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  8.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: PinCodeTextField(
                                                        autoDisposeControllers:
                                                            false,
                                                        appContext: context,
                                                        length: 8,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        enableActiveFill: false,
                                                        autoFocus: false,
                                                        focusNode: _model
                                                            .pinCodePromotorFocusNode,
                                                        enablePinAutofill:
                                                            false,
                                                        errorTextSpace: 16.0,
                                                        showCursor: true,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        obscureText: false,
                                                        hintCharacter: '●',
                                                        keyboardType:
                                                            TextInputType
                                                                .visiblePassword,
                                                        pinTheme: PinTheme(
                                                          fieldHeight: 44.0,
                                                          fieldWidth: 38.0,
                                                          borderWidth: 1.0,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          shape:
                                                              PinCodeFieldShape
                                                                  .box,
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          inactiveColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          selectedColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                        controller: _model
                                                            .pinCodePromotor,
                                                        onChanged: (_) {},
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        validator: _model
                                                            .pinCodePromotorValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child:
                                                            FutureBuilder<int>(
                                                          future:
                                                              queryPromovidosRecordCount(
                                                            queryBuilder:
                                                                (promovidosRecord) =>
                                                                    promovidosRecord
                                                                        .where(
                                                              'email',
                                                              isEqualTo:
                                                                  currentUserEmail,
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
                                                            int rowCount =
                                                                snapshot.data!;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_VALIDAR_P_I_N_BTN_ON_TAP');
                                                                      currentUserLocationValue = await getCurrentUserLocation(
                                                                          defaultLocation: LatLng(
                                                                              0.0,
                                                                              0.0));
                                                                      var _shouldSetState =
                                                                          false;
                                                                      _model.pinCode = _model
                                                                          .pinCodePromotor!
                                                                          .text;
                                                                      safeSetState(
                                                                          () {});
                                                                      if (!_model
                                                                          .pinValido) {
                                                                        if (rowCount >
                                                                            0) {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            barrierColor:
                                                                                Color(0x00000000),
                                                                            isDismissible:
                                                                                false,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: CustomAlertWidget(
                                                                                    titulo: 'email!',
                                                                                    mensaje: 'Este correo electrónico ya existe!',
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
                                                                          _model.userPromotor =
                                                                              await queryUsersRecordOnce(
                                                                            queryBuilder: (usersRecord) =>
                                                                                usersRecord.where(
                                                                              'pinCode',
                                                                              isEqualTo: _model.pinCode,
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          _shouldSetState =
                                                                              true;
                                                                          if (_model.userPromotor !=
                                                                              null) {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: CustomAlertWidget(
                                                                                      titulo: 'Promotor Encontrado',
                                                                                      mensaje: 'Se ha encontrado a: ${_model.userPromotor?.nombres} ${_model.userPromotor?.apPaterno} ${_model.userPromotor?.apMaterno} con el PIN: ${_model.pinCode}',
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            if (_model.userPromotor?.activo ==
                                                                                true) {
                                                                              var promovidosRecordReference = PromovidosRecord.collection.doc();
                                                                              await promovidosRecordReference.set(createPromovidosRecordData(
                                                                                nombres: valueOrDefault(currentUserDocument?.nombres, ''),
                                                                                apPaterno: valueOrDefault(currentUserDocument?.apPaterno, ''),
                                                                                apMaterno: valueOrDefault(currentUserDocument?.apMaterno, ''),
                                                                                fechaNac: currentUserDocument?.fechaNac,
                                                                                email: currentUserEmail,
                                                                                padre: _model.userPromotor?.reference,
                                                                                phoneNumber: currentPhoneNumber,
                                                                                nivel: _model.userPromotor?.god == true ? -1 : (_model.userPromotor!.nivel + 1),
                                                                                userRef: null,
                                                                                promotor: false,
                                                                                membresia: _model.userPromotor?.membresia,
                                                                                photoUrl: currentUserPhoto,
                                                                                diaNac: functions.diaNacimiento(currentUserDocument?.fechaNac),
                                                                                mesNac: functions.mesNacimiento(currentUserDocument?.fechaNac),
                                                                                fecha: getCurrentTimestamp,
                                                                                gps: currentUserLocationValue,
                                                                                obs: 'Creado con PIN: ${_model.pinCode}',
                                                                              ));
                                                                              _model.nuevoPromovido = PromovidosRecord.getDocumentFromData(
                                                                                  createPromovidosRecordData(
                                                                                    nombres: valueOrDefault(currentUserDocument?.nombres, ''),
                                                                                    apPaterno: valueOrDefault(currentUserDocument?.apPaterno, ''),
                                                                                    apMaterno: valueOrDefault(currentUserDocument?.apMaterno, ''),
                                                                                    fechaNac: currentUserDocument?.fechaNac,
                                                                                    email: currentUserEmail,
                                                                                    padre: _model.userPromotor?.reference,
                                                                                    phoneNumber: currentPhoneNumber,
                                                                                    nivel: _model.userPromotor?.god == true ? -1 : (_model.userPromotor!.nivel + 1),
                                                                                    userRef: null,
                                                                                    promotor: false,
                                                                                    membresia: _model.userPromotor?.membresia,
                                                                                    photoUrl: currentUserPhoto,
                                                                                    diaNac: functions.diaNacimiento(currentUserDocument?.fechaNac),
                                                                                    mesNac: functions.mesNacimiento(currentUserDocument?.fechaNac),
                                                                                    fecha: getCurrentTimestamp,
                                                                                    gps: currentUserLocationValue,
                                                                                    obs: 'Creado con PIN: ${_model.pinCode}',
                                                                                  ),
                                                                                  promovidosRecordReference);
                                                                              _shouldSetState = true;

                                                                              await _model.userPromotor!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'HijoaPromovidos': FieldValue.arrayUnion([
                                                                                      _model.nuevoPromovido?.reference
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              await actions.restarPersonasMembresia(
                                                                                _model.userPromotor!.membresia!,
                                                                              );
                                                                              triggerPushNotification(
                                                                                notificationTitle: 'Nuevo Promotor con PIN!',
                                                                                notificationText: '${valueOrDefault(currentUserDocument?.nombres, '')} ${valueOrDefault(currentUserDocument?.apPaterno, '')} ${valueOrDefault(currentUserDocument?.apMaterno, '')} se ha registrado exitósamente con tu PIN, ahora tienes un nuevo Encuestador!',
                                                                                notificationSound: 'default',
                                                                                userRefs: [
                                                                                  _model.userPromotor!.reference
                                                                                ],
                                                                                initialPageName: 'misEncuestadores',
                                                                                parameterData: {},
                                                                              );
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: CustomAlertWidget(
                                                                                        titulo: 'PIN Validado!',
                                                                                        mensaje: 'Todo Listo! Su Encuestador ${_model.userPromotor?.nombres} ${_model.userPromotor?.apPaterno} ${_model.userPromotor?.apMaterno} le da la Bienvenida! Solo oprima el botón \"Activar Membresía\"',
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            } else {
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
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: CustomAlertWidget(
                                                                                        titulo: 'Promotor Inactivo!',
                                                                                        mensaje: 'El Encuestador con este PIN no se encuentra actualmente activo en la Plataforma.',
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          } else {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: CustomAlertWidget(
                                                                                      titulo: 'PIN Inválido!',
                                                                                      mensaje: 'Este PIN no existe en nuestros Registros',
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }
                                                                        }
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: CustomAlertWidget(
                                                                                  titulo: 'PIN Válidado!',
                                                                                  mensaje: 'El PIN ya fué validado con anterioridad',
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                    },
                                                                    text:
                                                                        'Validar PIN',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .barra,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  borderRadius:
                                                                      8.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .redoAlt,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HOME_PAGE_PAGE_redoAlt_ICN_ON_TAP');
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .pinCodePromotor
                                                                          ?.clear();
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              MembresiasRecord>>(
                                                        stream:
                                                            queryMembresiasRecord(
                                                          queryBuilder:
                                                              (membresiasRecord) =>
                                                                  membresiasRecord
                                                                      .where(
                                                            'usuario',
                                                            isEqualTo:
                                                                currentUserReference,
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
                                                          List<MembresiasRecord>
                                                              rowMembresiasRecordList =
                                                              snapshot.data!;
                                                          final rowMembresiasRecord =
                                                              rowMembresiasRecordList
                                                                      .isNotEmpty
                                                                  ? rowMembresiasRecordList
                                                                      .first
                                                                  : null;

                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              if (!valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.tieneMembresia,
                                                                  false))
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            PromovidosRecord>>(
                                                                      stream:
                                                                          queryPromovidosRecord(
                                                                        queryBuilder:
                                                                            (promovidosRecord) =>
                                                                                promovidosRecord.where(
                                                                          'email',
                                                                          isEqualTo: currentUserEmail != ''
                                                                              ? currentUserEmail
                                                                              : null,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
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
                                                                        List<PromovidosRecord>
                                                                            containerPromovidosRecordList =
                                                                            snapshot.data!;
                                                                        final containerPromovidosRecord = containerPromovidosRecordList.isNotEmpty
                                                                            ? containerPromovidosRecordList.first
                                                                            : null;

                                                                        return Container(
                                                                          width:
                                                                              230.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(5.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('HOME_PAGE_PAGE_ButtonMembresia_ON_TAP');
                                                                                currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                var _shouldSetState = false;
                                                                                HapticFeedback.heavyImpact();
                                                                                if (homePagePromovidosRecord?.nivel == -1) {
                                                                                  if (rowMembresiasRecord != null) {
                                                                                    await currentUserReference!.update(createUsersRecordData(
                                                                                      promotor: true,
                                                                                      membresia: rowMembresiasRecord.reference,
                                                                                      tieneMembresia: true,
                                                                                    ));
                                                                                    _model.promovidoEncontrado2 = await queryPromovidosRecordOnce(
                                                                                      queryBuilder: (promovidosRecord) => promovidosRecord.where(
                                                                                        'userRef',
                                                                                        isEqualTo: currentUserReference,
                                                                                      ),
                                                                                      singleRecord: true,
                                                                                    ).then((s) => s.firstOrNull);
                                                                                    _shouldSetState = true;
                                                                                    if (_model.promovidoEncontrado2?.reference != null) {
                                                                                      await _model.promovidoEncontrado2!.reference.update(createPromovidosRecordData(
                                                                                        membresia: rowMembresiasRecord.reference,
                                                                                      ));
                                                                                    } else {
                                                                                      await PromovidosRecord.collection.doc().set(createPromovidosRecordData(
                                                                                            nombres: valueOrDefault(currentUserDocument?.nombres, ''),
                                                                                            apPaterno: valueOrDefault(currentUserDocument?.apPaterno, ''),
                                                                                            apMaterno: valueOrDefault(currentUserDocument?.apMaterno, ''),
                                                                                            fechaNac: currentUserDocument?.fechaNac,
                                                                                            email: currentUserEmail,
                                                                                            padre: currentUserDocument?.padre,
                                                                                            phoneNumber: currentPhoneNumber,
                                                                                            userRef: currentUserReference,
                                                                                            nivel: valueOrDefault(currentUserDocument?.nivel, 0),
                                                                                            promotor: true,
                                                                                            membresia: currentUserDocument?.membresia,
                                                                                            photoUrl: currentUserPhoto,
                                                                                            diaNac: functions.diaNacimiento(currentUserDocument?.fechaNac),
                                                                                            mesNac: functions.mesNacimiento(currentUserDocument?.fechaNac),
                                                                                            fecha: getCurrentTimestamp,
                                                                                            gps: currentUserLocationValue,
                                                                                          ));
                                                                                    }

                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      barrierColor: Color(0x00000000),
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(context).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: MembresiaActivadaWidget(),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));

                                                                                    _model.membresiaActiva11 = await actions.checarMembresiaActiva(
                                                                                      currentUserDocument!.membresia!,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if (_model.membresiaActiva!) {
                                                                                      if (FFAppState().version < getRemoteConfigInt('version')) {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          enableDrag: false,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(context).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: CustomAlertWidget(
                                                                                                  titulo: 'Actualización Disponible!',
                                                                                                  mensaje: 'Actualmente, cuentas con la Versión ${formatNumber(
                                                                                                    FFAppState().version,
                                                                                                    formatType: FormatType.decimal,
                                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                                  )} de Prometheus. Existe una nueva versión (Versión ${formatNumber(
                                                                                                    getRemoteConfigInt('version'),
                                                                                                    formatType: FormatType.decimal,
                                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                                  )}) de la App, por lo que requieres actualizarla cuanto antes. Gracias',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));

                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      } else {
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                    } else {
                                                                                      context.goNamed(MembresiaInactivaWidget.routeName);

                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }
                                                                                  } else {
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
                                                                                            FocusScope.of(context).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: CustomAlertWidget(
                                                                                              titulo: 'Se requiere de una Membresía Activa',
                                                                                              mensaje: 'Para habilitar todas las funcionalidades de Prometheus, usted requiere ser parte de una Estructura u obtener una Membresía. Para mayor información puede enviar un correo a promehteus@daangu.com. Muchas gracias.',
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));

                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                } else {
                                                                                  if (containerPromovidosRecord != null) {
                                                                                    await containerPromovidosRecord.reference.update(createPromovidosRecordData(
                                                                                      fechaNac: currentUserDocument?.fechaNac,
                                                                                      phoneNumber: currentPhoneNumber,
                                                                                      userRef: currentUserReference,
                                                                                      nombres: valueOrDefault(currentUserDocument?.nombres, ''),
                                                                                      apPaterno: valueOrDefault(currentUserDocument?.apPaterno, ''),
                                                                                      apMaterno: valueOrDefault(currentUserDocument?.apMaterno, ''),
                                                                                      promotor: true,
                                                                                      membresia: homePagePromovidosRecord?.membresia,
                                                                                      diaNac: functions.diaNacimiento(currentUserDocument?.fechaNac),
                                                                                      mesNac: functions.mesNacimiento(currentUserDocument?.fechaNac),
                                                                                    ));

                                                                                    await currentUserReference!.update(createUsersRecordData(
                                                                                      nivel: containerPromovidosRecord.nivel,
                                                                                      padre: containerPromovidosRecord.padre,
                                                                                      promotor: true,
                                                                                      membresia: containerPromovidosRecord.membresia,
                                                                                      photoUrl: containerPromovidosRecord.photoUrl,
                                                                                      tieneMembresia: true,
                                                                                    ));

                                                                                    await homePagePromovidosRecord!.padre!.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'Hijos': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                          'rating': FieldValue.increment(1),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      barrierColor: Color(0x00000000),
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(context).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: MembresiaActivadaWidget(),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));

                                                                                    _model.membresiaActiva2 = await actions.checarMembresiaActiva(
                                                                                      currentUserDocument!.membresia!,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if (_model.membresiaActiva2!) {
                                                                                      if (FFAppState().version < getRemoteConfigInt('version')) {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          enableDrag: false,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(context).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: CustomAlertWidget(
                                                                                                  titulo: 'Actualización Disponible!',
                                                                                                  mensaje: 'Actualmente, cuentas con la Versión ${formatNumber(
                                                                                                    FFAppState().version,
                                                                                                    formatType: FormatType.decimal,
                                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                                  )} de Prometheus. Existe una nueva versión (Versión ${formatNumber(
                                                                                                    getRemoteConfigInt('version'),
                                                                                                    formatType: FormatType.decimal,
                                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                                  )}) de la App, por lo que requieres actualizarla cuanto antes. Gracias',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));

                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      } else {
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                    } else {
                                                                                      context.goNamed(MembresiaInactivaWidget.routeName);

                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }
                                                                                  } else {
                                                                                    if (rowMembresiasRecord != null) {
                                                                                      await currentUserReference!.update(createUsersRecordData(
                                                                                        root: true,
                                                                                        membresia: rowMembresiasRecord.reference,
                                                                                        promotor: true,
                                                                                        tieneMembresia: true,
                                                                                      ));
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        barrierColor: Color(0x00000000),
                                                                                        enableDrag: false,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(context).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: MembresiaActivadaWidget(),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));

                                                                                      _model.membresiaActiva3 = await actions.checarMembresiaActiva(
                                                                                        currentUserDocument!.membresia!,
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if (_model.membresiaActiva3!) {
                                                                                        if (FFAppState().version < getRemoteConfigInt('version')) {
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(context).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: Padding(
                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                  child: CustomAlertWidget(
                                                                                                    titulo: 'Actualización Disponible!',
                                                                                                    mensaje: 'Actualmente, cuentas con la Versión ${formatNumber(
                                                                                                      FFAppState().version,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    )} de Prometheus. Existe una nueva versión (Versión ${formatNumber(
                                                                                                      getRemoteConfigInt('version'),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                    )}) de la App, por lo que requieres actualizarla cuanto antes. Gracias',
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));

                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                          return;
                                                                                        } else {
                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                          return;
                                                                                        }
                                                                                      } else {
                                                                                        context.goNamed(MembresiaInactivaWidget.routeName);

                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                    } else {
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
                                                                                              FocusScope.of(context).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: CustomAlertWidget(
                                                                                                titulo: 'Membresía',
                                                                                                mensaje: 'Para habilitar todas las funcionalidades de Prometheus, usted requiere ser parte de una Estructura u obtener una Membresía. Para mayor información puede enviar un correo a promehteus@daangu.com. Muchas gracias.',
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));

                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }
                                                                                  }
                                                                                }

                                                                                if (_shouldSetState) safeSetState(() {});
                                                                              },
                                                                              text: 'Activar Membresía',
                                                                              icon: Icon(
                                                                                Icons.card_membership_rounded,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: 230.0,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: Colors.white,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                    ),
                                                                                elevation: 2.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation1']!),
                                                                          ),
                                                                        );
                                                                      },
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'O si lo que desea es Registrar una nueva Membresía, Pulse el siguiente Botón...',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              MembresiasRecord>>(
                                                        stream:
                                                            queryMembresiasRecord(
                                                          queryBuilder:
                                                              (membresiasRecord) =>
                                                                  membresiasRecord
                                                                      .where(
                                                            'usuario',
                                                            isEqualTo:
                                                                currentUserReference,
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
                                                          List<MembresiasRecord>
                                                              rowMembresiasRecordList =
                                                              snapshot.data!;
                                                          final rowMembresiasRecord =
                                                              rowMembresiasRecordList
                                                                      .isNotEmpty
                                                                  ? rowMembresiasRecordList
                                                                      .first
                                                                  : null;

                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              if (!valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.tieneMembresia,
                                                                  false))
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          230.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(5.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('HOME_PAGE_PAGE_ButtonMembresia_ON_TAP');
                                                                            HapticFeedback.heavyImpact();

                                                                            context.pushNamed(NuevaMembresiaComprarWidget.routeName);
                                                                          },
                                                                          text:
                                                                              'Adquirir mi propia Membresía',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.add_shopping_cart,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                230.0,
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: Colors.white,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            elevation:
                                                                                2.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation2']!),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.only(),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 1.0,
                                ),
                              ),
                              child: Visibility(
                                visible: valueOrDefault<bool>(
                                    currentUserDocument?.tieneMembresia, false),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 15.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (!valueOrDefault<bool>(
                                                      currentUserDocument?.root,
                                                      false) &&
                                                  !valueOrDefault<bool>(
                                                      currentUserDocument?.god,
                                                      false) &&
                                                  _model.internet!)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 3.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Nivel',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumIsCustom,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(3.0),
                                                        child: Text(
                                                          formatNumber(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.nivel,
                                                                0),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .periodDecimal,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (valueOrDefault<bool>(
                                                      currentUserDocument?.root,
                                                      false) ||
                                                  valueOrDefault<bool>(
                                                      currentUserDocument?.god,
                                                      false))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 3.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Nivel',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumIsCustom,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(3.0),
                                                        child: Text(
                                                          'Raiz',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (valueOrDefault<bool>(
                                                _model.internet,
                                                false,
                                              ))
                                                Expanded(
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Builder(
                                                          builder: (context) =>
                                                              Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        5.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onLongPress:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'HOME_IconButtonShare_ON_LONG_PRESS');
                                                                await showAlignedDialog(
                                                                  context:
                                                                      context,
                                                                  isGlobal:
                                                                      false,
                                                                  avoidOverflow:
                                                                      true,
                                                                  targetAnchor: AlignmentDirectional(
                                                                          -1.0,
                                                                          1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  followerAnchor: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            TooltipCardWidget(
                                                                          texto:
                                                                              'Compartir App',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    8.0,
                                                                borderWidth:
                                                                    0.0,
                                                                buttonSize:
                                                                    50.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .barra,
                                                                disabledColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .shareSquare,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: !valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.activo,
                                                                        false)
                                                                    ? null
                                                                    : () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_PAGE_PAGE_IconButtonShare_ON_TAP');
                                                                        HapticFeedback
                                                                            .heavyImpact();
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          barrierColor:
                                                                              Color(0x00000000),
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: CompartirAPPWidget(),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'iconButtonOnPageLoadAnimation']!),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
