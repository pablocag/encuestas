import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/custom_alert_sin_link/custom_alert_sin_link_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'list_encuestadores_model.dart';
export 'list_encuestadores_model.dart';

class ListEncuestadoresWidget extends StatefulWidget {
  const ListEncuestadoresWidget({
    super.key,
    this.idHijo,
  });

  final DocumentReference? idHijo;

  @override
  State<ListEncuestadoresWidget> createState() =>
      _ListEncuestadoresWidgetState();
}

class _ListEncuestadoresWidgetState extends State<ListEncuestadoresWidget>
    with TickerProviderStateMixin {
  late ListEncuestadoresModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListEncuestadoresModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.idHijo!),
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

          final userListUsersRecord = snapshot.data!;

          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).colorPromotor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'LIST_ENCUESTADORES_Image_i112mse9_ON_TAP');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: FlutterFlowExpandedImageView(
                              image: Image.network(
                                valueOrDefault<String>(
                                  userListUsersRecord.photoUrl,
                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                ),
                                fit: BoxFit.contain,
                              ),
                              allowRotation: false,
                              tag: valueOrDefault<String>(
                                userListUsersRecord.photoUrl,
                                'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                              ),
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      onDoubleTap: () async {
                        logFirebaseEvent(
                            'LIST_ENCUESTADORES_Image_i112mse9_ON_DOU');
                        _model.idPromovido = await queryPromovidosRecordOnce(
                          queryBuilder: (promovidosRecord) =>
                              promovidosRecord.where(
                            'userRef',
                            isEqualTo: userListUsersRecord.reference,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: CustomAlertSinLinkWidget(
                                titulo: 'ID Promovido',
                                mensaje: _model.idPromovido?.reference.id,
                              ),
                            );
                          },
                        );

                        safeSetState(() {});
                      },
                      onLongPress: () async {
                        logFirebaseEvent(
                            'LIST_ENCUESTADORES_Image_i112mse9_ON_LON');
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: CustomAlertSinLinkWidget(
                                titulo: 'ID Promotor',
                                mensaje: userListUsersRecord.uid,
                              ),
                            );
                          },
                        );
                      },
                      child: Hero(
                        tag: valueOrDefault<String>(
                          userListUsersRecord.photoUrl,
                          'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                        ),
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              userListUsersRecord.photoUrl,
                              'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                            ),
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '${userListUsersRecord.nombres} ${userListUsersRecord.apPaterno} ${userListUsersRecord.apMaterno}',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 3.0, 5.0, 0.0),
                          child: Text(
                            '${valueOrDefault<String>(
                              formatNumber(
                                userListUsersRecord.hijos.length,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                              ),
                              '0',
                            )} Encuestadores',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 3.0, 5.0, 0.0),
                          child: Text(
                            '${valueOrDefault<String>(
                              formatNumber(
                                userListUsersRecord.hijoaPromovidos.length,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                              ),
                              '0',
                            )} Candidatos',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 3.0, 5.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => FutureBuilder<int>(
                              future: queryEncuestasRecordCount(
                                queryBuilder: (encuestasRecord) =>
                                    encuestasRecord.where(Filter.or(
                                  Filter(
                                    'membresia',
                                    isEqualTo: currentUserDocument?.membresia,
                                  ),
                                  Filter(
                                    'usuario',
                                    isEqualTo: userListUsersRecord.reference,
                                  ),
                                  Filter(
                                    'terminada',
                                    isEqualTo: true,
                                  ),
                                )),
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
                                            FlutterFlowTheme.of(context).barra,
                                        size: 24.0,
                                      ),
                                    ),
                                  );
                                }
                                int textCount = snapshot.data!;

                                return Text(
                                  '${formatNumber(
                                    textCount,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.periodDecimal,
                                  )} Encuestas Aplicadas',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onLongPress: () async {
                      logFirebaseEvent(
                          'LIST_ENCUESTADORES_Icon_eegeo0br_ON_LONG');

                      await userListUsersRecord.reference
                          .update(createUsersRecordData(
                        activo: !userListUsersRecord.activo,
                      ));
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: CustomAlertWidget(
                              titulo: 'Promotor Actualizado!',
                              mensaje:
                                  'El estatus del Promotor ha sido modificado',
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: FaIcon(
                      FontAwesomeIcons.solidCircle,
                      color: userListUsersRecord.activo
                          ? FlutterFlowTheme.of(context).success
                          : FlutterFlowTheme.of(context).error,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
        },
      ),
    );
  }
}
