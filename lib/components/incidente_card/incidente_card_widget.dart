import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'incidente_card_model.dart';
export 'incidente_card_model.dart';

class IncidenteCardWidget extends StatefulWidget {
  const IncidenteCardWidget({
    super.key,
    this.incidente,
  });

  final IncidenciasRecord? incidente;

  @override
  State<IncidenteCardWidget> createState() => _IncidenteCardWidgetState();
}

class _IncidenteCardWidgetState extends State<IncidenteCardWidget> {
  late IncidenteCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncidenteCardModel());

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
      padding: EdgeInsets.all(10.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: FutureBuilder<UsersRecord>(
                    future: UsersRecord.getDocumentOnce(
                        widget.incidente!.enviadoPor!),
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

                      final rowUsersRecord = snapshot.data!;

                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.network(
                                            rowUsersRecord.photoUrl,
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  rowUsersRecord.displayName,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                    "d/M h:mm a",
                                                    widget
                                                        .incidente!.timestamp!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                ),
                                                InkWell(
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
                                                        'INCIDENTE_CARD_COMP_Text_u565zprw_ON_TAP');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    await launchUrl(Uri(
                                                      scheme: 'tel',
                                                      path: rowUsersRecord
                                                          .phoneNumber,
                                                    ));
                                                  },
                                                  child: Text(
                                                    rowUsersRecord.phoneNumber,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (!valueOrDefault<bool>(
                                                currentUserDocument?.root,
                                                false) &&
                                            !widget.incidente!.destinatarios
                                                .contains(
                                                    currentUserDocument?.padre))
                                          AuthUserStreamWidget(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    borderRadius: 8.0,
                                                    borderWidth: 2.0,
                                                    buttonSize: 50.0,
                                                    icon: Icon(
                                                      Icons.upgrade_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 32.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'INCIDENTE_CARD_upgrade_rounded_ICN_ON_TA');
                                                      HapticFeedback
                                                          .lightImpact();
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Escalar Reporte'),
                                                                    content: Text(
                                                                        'Deseas Escalar este Reporte a tu Promotor de nivel superior?'),
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
                                                        await widget.incidente!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'Destinatarios':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserDocument
                                                                    ?.padre
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        triggerPushNotification(
                                                          notificationTitle:
                                                              'Reporte de campo de: ${currentUserDisplayName}',
                                                          notificationText:
                                                              'Tengo un nuevo Reporte de Campo!',
                                                          notificationSound:
                                                              'default',
                                                          userRefs: [
                                                            currentUserDocument!
                                                                .padre!
                                                          ],
                                                          initialPageName:
                                                              'incidencias',
                                                          parameterData: {},
                                                        );
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  CustomAlertWidget(
                                                                titulo:
                                                                    'Reporte Escalado!',
                                                                mensaje:
                                                                    'Este Reporte ha sido escalado a su Promotor de nivel superior',
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  'Escalar',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (!valueOrDefault<bool>(
                                          widget.incidente?.esNoticia,
                                          false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord
                                                        .where(
                                                          'Padre',
                                                          isEqualTo: widget
                                                              .incidente
                                                              ?.enviadoPor,
                                                        )
                                                        .where(
                                                          'activo',
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .barra,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    containerUsersRecordList =
                                                    snapshot.data!;

                                                return Container(
                                                  width: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      StreamBuilder<
                                                          List<UsersRecord>>(
                                                        stream:
                                                            queryUsersRecord(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                                        'Padre',
                                                                        isEqualTo:
                                                                            rowUsersRecord.padre,
                                                                      )
                                                                      .where(
                                                                        'activo',
                                                                        isEqualTo:
                                                                            true,
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
                                                          List<UsersRecord>
                                                              iconButtonUsersRecordList =
                                                              snapshot.data!;

                                                          return FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            borderRadius: 8.0,
                                                            borderWidth: 2.0,
                                                            buttonSize: 50.0,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .photoVideo,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 28.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'INCIDENTE_CARD_photoVideo_ICN_ON_TAP');
                                                              var _shouldSetState =
                                                                  false;
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Publicar Reporte'),
                                                                            content:
                                                                                Text('Deseas Publicar este Reporte?'),
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
                                                                var noticiasRecordReference =
                                                                    NoticiasRecord
                                                                        .collection
                                                                        .doc();
                                                                await noticiasRecordReference
                                                                    .set(
                                                                        createNoticiasRecordData(
                                                                  enviadoPor:
                                                                      rowUsersRecord
                                                                          .reference,
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                  texto: widget
                                                                      .incidente
                                                                      ?.texto,
                                                                  tipo: 'FOTO',
                                                                  foto: widget
                                                                      .incidente
                                                                      ?.foto,
                                                                  membresia:
                                                                      currentUserDocument
                                                                          ?.membresia,
                                                                ));
                                                                _model.noticiaFoto =
                                                                    NoticiasRecord
                                                                        .getDocumentFromData(
                                                                            createNoticiasRecordData(
                                                                              enviadoPor: rowUsersRecord.reference,
                                                                              timestamp: getCurrentTimestamp,
                                                                              texto: widget.incidente?.texto,
                                                                              tipo: 'FOTO',
                                                                              foto: widget.incidente?.foto,
                                                                              membresia: currentUserDocument?.membresia,
                                                                            ),
                                                                            noticiasRecordReference);
                                                                _shouldSetState =
                                                                    true;

                                                                await widget
                                                                    .incidente!
                                                                    .reference
                                                                    .update(
                                                                        createIncidenciasRecordData(
                                                                  esNoticia:
                                                                      true,
                                                                  noticia: _model
                                                                      .noticiaFoto
                                                                      ?.reference,
                                                                ));

                                                                _model
                                                                    .updatePage(
                                                                        () {});
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          CustomAlertWidget(
                                                                        titulo:
                                                                            'Noticia Publicada!',
                                                                        mensaje:
                                                                            'La noticia ha sido publicada exitosamente!.',
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));

                                                                triggerPushNotification(
                                                                  notificationTitle:
                                                                      'Reporte de campo de: ${currentUserDisplayName}',
                                                                  notificationText:
                                                                      'Tengo un nuevo Reporte de Campo!',
                                                                  notificationSound:
                                                                      'default',
                                                                  userRefs: iconButtonUsersRecordList
                                                                      .map((e) =>
                                                                          e.reference)
                                                                      .toList(),
                                                                  initialPageName:
                                                                      'incidencias',
                                                                  parameterData: {},
                                                                );
                                                                triggerPushNotification(
                                                                  notificationTitle:
                                                                      'Reporte de campo de: ${currentUserDisplayName}',
                                                                  notificationText:
                                                                      'Tengo un nuevo Reporte de Campo!',
                                                                  notificationSound:
                                                                      'default',
                                                                  userRefs: containerUsersRecordList
                                                                      .map((e) =>
                                                                          e.reference)
                                                                      .toList(),
                                                                  initialPageName:
                                                                      'incidencias',
                                                                  parameterData: {},
                                                                );
                                                              } else {
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      Text(
                                                        'Publicar',
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
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (widget.incidente!.destinatarios
                                  .contains(currentUserReference) ||
                              valueOrDefault<bool>(
                                  currentUserDocument?.root, false))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.phonelink_erase_rounded,
                                        color: Color(0xFFA1231D),
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'INCIDENTE_CARD_phonelink_erase_rounded_I');
                                        HapticFeedback.lightImpact();
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Eliminar Reporte'),
                                                      content: Text(
                                                          'Deseas Eliminar este Reporte?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child:
                                                              Text('Cancelar'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirmar'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await widget.incidente!.reference
                                              .delete();
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0x00000000),
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CustomAlertWidget(
                                                  titulo:
                                                      'Incidencia Eliminada!',
                                                  mensaje:
                                                      'La Incidencia ha sido Eliminada correctamente.',
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        } else {
                                          return;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 3.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'INCIDENTE_CARD_Container_0xs20ejo_ON_TAP');
                          if (functions.textToLink(widget.incidente?.texto) !=
                                  null &&
                              functions.textToLink(widget.incidente?.texto) !=
                                  '') {
                            await launchURL(functions
                                .textToLink(widget.incidente?.texto)!);
                            return;
                          } else {
                            return;
                          }
                        },
                        child: custom_widgets.ReadMoreTextWidget(
                          width: double.infinity,
                          height: 70.0,
                          texto: widget.incidente!.texto,
                          trimL: 3,
                          colorTexto: FlutterFlowTheme.of(context).primaryText,
                          colorClick: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.incidente?.tipo == 'FOTO')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 3.0, 10.0, 3.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'INCIDENTE_CARD_Image_ii45872v_ON_TAP');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: FlutterFlowExpandedImageView(
                              image: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: widget.incidente!.foto,
                                fit: BoxFit.contain,
                              ),
                              allowRotation: false,
                              tag: widget.incidente!.foto,
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: widget.incidente!.foto,
                        transitionOnUserGestures: true,
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: widget.incidente!.foto,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                if (widget.incidente?.tipo == 'VIDEO')
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 3.0, 10.0, 3.0),
                      child: FlutterFlowVideoPlayer(
                        path: widget.incidente!.video,
                        videoType: VideoType.network,
                        aspectRatio: 1.7,
                        autoPlay: false,
                        looping: false,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                        lazyLoad: true,
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
