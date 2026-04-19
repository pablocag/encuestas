import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'encuestas_comprar_model.dart';
export 'encuestas_comprar_model.dart';

class EncuestasComprarWidget extends StatefulWidget {
  const EncuestasComprarWidget({super.key});

  static String routeName = 'encuestasComprar';
  static String routePath = 'encuestasComprar';

  @override
  State<EncuestasComprarWidget> createState() => _EncuestasComprarWidgetState();
}

class _EncuestasComprarWidgetState extends State<EncuestasComprarWidget>
    with TickerProviderStateMixin {
  late EncuestasComprarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EncuestasComprarModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'encuestasComprar'});
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
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<MembresiasRecord>(
        stream: MembresiasRecord.getDocument(currentUserDocument!.membresia!),
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

          final encuestasComprarMembresiasRecord = snapshot.data!;

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
                    logFirebaseEvent(
                        'ENCUESTAS_COMPRAR_chevron_left_rounded_I');
                    context.pop();
                  },
                ),
                title: Text(
                  'Adquirir Paquete de  Encuestas',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: !FlutterFlowTheme.of(context)
                            .headlineMediumIsCustom,
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
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: SingleChildScrollView(
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 5.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/logo_Encuestas_sin_fondo.png',
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ).animateOnPageLoad(
                                    animationsMap['imageOnPageLoadAnimation']!),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Aplicación de Encuestas con georeferencia',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 5.0, 10.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Encuestas Disponibles: ${formatNumber(
                                      encuestasComprarMembresiasRecord
                                          .paqueteEncuestas,
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
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final purchaseIDs = revenue_cat
                                  .offerings!.current!.availablePackages
                                  .toList();
                              if (purchaseIDs.isEmpty) {
                                return NoHayElementosWidget();
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: purchaseIDs.length,
                                itemBuilder: (context, purchaseIDsIndex) {
                                  final purchaseIDsItem =
                                      purchaseIDs[purchaseIDsIndex];
                                  return Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 3.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ENCUESTAS_COMPRAR_ListTile_9bisc3gi_ON_T');
                                          var _shouldSetState = false;
                                          HapticFeedback.lightImpact();
                                          _model.isPurchaseSuccessful =
                                              await revenue_cat.purchasePackage(
                                                  purchaseIDsItem.identifier);
                                          _shouldSetState = true;
                                          if (_model.isPurchaseSuccessful!) {
                                            await encuestasComprarMembresiasRecord
                                                .reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'PaqueteEncuestas':
                                                      FieldValue.increment(() {
                                                    if (purchaseIDsItem
                                                            .storeProduct
                                                            .identifier ==
                                                        'encuestas_300') {
                                                      return 300;
                                                    } else if (purchaseIDsItem
                                                            .storeProduct
                                                            .identifier ==
                                                        'encuestas_500') {
                                                      return 500;
                                                    } else if (purchaseIDsItem
                                                            .storeProduct
                                                            .identifier ==
                                                        'encuestas_1000') {
                                                      return 1000;
                                                    } else if (purchaseIDsItem
                                                            .storeProduct
                                                            .identifier ==
                                                        'encuestas_1500') {
                                                      return 1500;
                                                    } else {
                                                      return 0;
                                                    }
                                                  }()),
                                                },
                                              ),
                                            });
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: CustomAlertWidget(
                                                      titulo: 'Compra Exitosa',
                                                      mensaje:
                                                          'Su compra ha sido completada y su Paquete agregado!, Muchas gracias!',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: CustomAlertWidget(
                                                      titulo:
                                                          'Compra sin completar',
                                                      mensaje:
                                                          'NO se ha completado su compra',
                                                      alerta: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.question_answer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 32.0,
                                            ),
                                            title: Text(
                                              purchaseIDsItem
                                                  .storeProduct.description,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLargeIsCustom,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              purchaseIDsItem
                                                  .storeProduct.priceString,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.shopping_cart_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 28.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
