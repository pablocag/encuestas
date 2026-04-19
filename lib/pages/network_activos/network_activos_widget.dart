import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'network_activos_model.dart';
export 'network_activos_model.dart';

class NetworkActivosWidget extends StatefulWidget {
  const NetworkActivosWidget({super.key});

  static String routeName = 'networkActivos';
  static String routePath = 'networkActivos';

  @override
  State<NetworkActivosWidget> createState() => _NetworkActivosWidgetState();
}

class _NetworkActivosWidgetState extends State<NetworkActivosWidget> {
  late NetworkActivosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NetworkActivosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'networkActivos'});
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

          final networkActivosMembresiasRecord = snapshot.data!;

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
                        'NETWORK_ACTIVOS_chevron_left_rounded_ICN');
                    context.pop();
                  },
                ),
                title: Text(
                  'Red de Contactos en Línea',
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
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: SingleChildScrollView(
                      controller: _model.columnController1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: SingleChildScrollView(
                                  controller: _model.columnController2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'NETWORK_ACTIVOS_CHECAR_USUARIOS_ACTIVOS_');
                                            var _shouldSetState = false;
                                            try {
                                              final result =
                                                  await FirebaseFunctions
                                                          .instanceFor(
                                                              region:
                                                                  'us-central1')
                                                      .httpsCallable(
                                                          'checkUsuariosOnLine')
                                                      .call({});
                                              _model.cloudFunctionqz9 =
                                                  CheckUsuariosOnLineCloudFunctionCallResponse(
                                                data: UsuariosOnLineStruct
                                                    .fromMap(result.data),
                                                succeeded: true,
                                                resultAsString:
                                                    result.data.toString(),
                                                jsonBody: result.data,
                                              );
                                            } on FirebaseFunctionsException catch (error) {
                                              _model.cloudFunctionqz9 =
                                                  CheckUsuariosOnLineCloudFunctionCallResponse(
                                                errorCode: error.code,
                                                succeeded: false,
                                              );
                                            }

                                            _shouldSetState = true;
                                            if (_model
                                                .cloudFunctionqz9!.succeeded!) {
                                              _model.updateListaStruct(
                                                (e) => e
                                                  ..mails = (getJsonField(
                                                    _model.cloudFunctionqz9!
                                                        .jsonBody,
                                                    r'''$.mails''',
                                                    true,
                                                  ) as List?)!
                                                      .map<String>(
                                                          (e) => e.toString())
                                                      .toList()
                                                      .cast<String>()
                                                      .toList(),
                                              );
                                              safeSetState(() {});
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
                                                            'Total en línea',
                                                        mensaje: formatNumber(
                                                          _model.lista?.mails
                                                              .length,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
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
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                          text:
                                              'Checar Usuarios Activos en la última Hora',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
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
                                      Builder(
                                        builder: (context) {
                                          final listaEnLinea = _model
                                                  .lista?.mails
                                                  .map((e) => e)
                                                  .toList()
                                                  .toList() ??
                                              [];
                                          if (listaEnLinea.isEmpty) {
                                            return NoHayElementosWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listaEnLinea.length,
                                            itemBuilder:
                                                (context, listaEnLineaIndex) {
                                              final listaEnLineaItem =
                                                  listaEnLinea[
                                                      listaEnLineaIndex];
                                              return FutureBuilder<
                                                  List<UsersRecord>>(
                                                future: queryUsersRecordOnce(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.where(
                                                    'email',
                                                    isEqualTo: listaEnLineaItem,
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
                                                  List<UsersRecord>
                                                      listTileUsersRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final listTileUsersRecord =
                                                      listTileUsersRecordList
                                                              .isNotEmpty
                                                          ? listTileUsersRecordList
                                                              .first
                                                          : null;

                                                  return InkWell(
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
                                                          'NETWORK_ACTIVOS_ListTile_egci0mku_ON_TAP');
                                                      HapticFeedback
                                                          .lightImpact();

                                                      context.pushNamed(
                                                        EncuestadorDetalleWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'promotor':
                                                              serializeParam(
                                                            listTileUsersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.person,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .success,
                                                        ),
                                                        title: Text(
                                                          '${listTileUsersRecord?.nombres} ${listTileUsersRecord?.apPaterno} ${listTileUsersRecord?.apMaterno}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLargeIsCustom,
                                                              ),
                                                        ),
                                                        subtitle: Text(
                                                          listTileUsersRecord!
                                                              .email,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                        ),
                                                        trailing: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: false,
                                                      ),
                                                    ),
                                                  );
                                                },
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
