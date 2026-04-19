import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'compartir_a_p_p_model.dart';
export 'compartir_a_p_p_model.dart';

class CompartirAPPWidget extends StatefulWidget {
  const CompartirAPPWidget({super.key});

  @override
  State<CompartirAPPWidget> createState() => _CompartirAPPWidgetState();
}

class _CompartirAPPWidgetState extends State<CompartirAPPWidget> {
  late CompartirAPPModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompartirAPPModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConfigRecord>>(
      stream: queryConfigRecord(
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
                color: FlutterFlowTheme.of(context).barra,
                size: 24.0,
              ),
            ),
          );
        }
        List<ConfigRecord> containerConfigRecordList = snapshot.data!;
        final containerConfigRecord = containerConfigRecordList.isNotEmpty
            ? containerConfigRecordList.first
            : null;

        return Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: SingleChildScrollView(
            controller: _model.columnController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Image.asset(
                                    'assets/images/logo_Encuestas_sin_fondo.png',
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    'Android',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.shareAltSquare,
                                      color: Colors.black,
                                      size: 36.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'COMPARTIR_A_P_P_shareAltSquare_ICN_ON_TA');
                                      await Share.share(
                                        containerConfigRecord!.urlAndroid,
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              child: custom_widgets.PrettyQRCode(
                                width: 100.0,
                                height: 100.0,
                                texto: containerConfigRecord?.urlAndroid,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Image.asset(
                                    'assets/images/logo_Encuestas_sin_fondo.png',
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    'IOS',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.shareAltSquare,
                                      color: Colors.black,
                                      size: 36.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'COMPARTIR_A_P_P_shareAltSquare_ICN_ON_TA');
                                      await Share.share(
                                        containerConfigRecord!.urlIOS,
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              child: custom_widgets.PrettyQRCode(
                                width: 100.0,
                                height: 100.0,
                                texto: containerConfigRecord?.urlIOS,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (valueOrDefault(currentUserDocument?.pinCode, '') != '')
                  AuthUserStreamWidget(
                    builder: (context) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _model.rowController,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (valueOrDefault(
                                      currentUserDocument?.pinCode, '') ==
                                  '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'COMPARTIR_A_P_P_CREAR_MI_P_I_N_CODE_BTN_');
                                  var _shouldSetState = false;
                                  HapticFeedback.lightImpact();
                                  while (true) {
                                    _model.nuevoPINL =
                                        await actions.crearPINCode();
                                    _shouldSetState = true;
                                    _model.countPINL =
                                        await queryUsersRecordCount(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(
                                        'pinCode',
                                        isEqualTo: _model.nuevoPINL,
                                      ),
                                    );
                                    _shouldSetState = true;
                                    if (_model.countPINL == 0) {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        pinCode: _model.nuevoPINL,
                                      ));
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CustomAlertWidget(
                                          titulo: 'PIN Code creado con éxito!',
                                          mensaje:
                                              'Utilice su PIN Code para compartirlo y que sus amigos puedan activarse como miembros de esta Red Social Privada!',
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'Crear mi PIN Code',
                                icon: Icon(
                                  Icons.pin,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).barra,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          if (valueOrDefault(
                                      currentUserDocument?.pinCode, '') !=
                                  '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Text(
                                'PIN Code:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                          if (valueOrDefault(
                                      currentUserDocument?.pinCode, '') !=
                                  '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault(
                                    currentUserDocument?.pinCode, ''),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              )),
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
