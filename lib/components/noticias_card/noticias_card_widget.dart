import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comentario/comentario_widget.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/noticias_comentarios/noticias_comentarios_widget.dart';
import '/components/noticias_likes/noticias_likes_widget.dart';
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
import 'noticias_card_model.dart';
export 'noticias_card_model.dart';

class NoticiasCardWidget extends StatefulWidget {
  const NoticiasCardWidget({
    super.key,
    this.noticia,
  });

  final NoticiasRecord? noticia;

  @override
  State<NoticiasCardWidget> createState() => _NoticiasCardWidgetState();
}

class _NoticiasCardWidgetState extends State<NoticiasCardWidget> {
  late NoticiasCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoticiasCardModel());

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
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.noticia!.enviadoPor!),
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

          final containerUsersRecord = snapshot.data!;

          return Material(
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
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                child: SingleChildScrollView(
                  controller: _model.columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'NOTICIAS_CARD_COMP_Image_uy3ektvs_ON_TAP');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    valueOrDefault<String>(
                                                      containerUsersRecord
                                                          .photoUrl,
                                                      'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: valueOrDefault<String>(
                                                    containerUsersRecord
                                                        .photoUrl,
                                                    'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                  ),
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: valueOrDefault<String>(
                                              containerUsersRecord.photoUrl,
                                              'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                            ),
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  containerUsersRecord.photoUrl,
                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                ),
                                                width: 48.0,
                                                height: 48.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
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
                                                  '${containerUsersRecord.nombres} ${containerUsersRecord.apPaterno} ${containerUsersRecord.apMaterno}',
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  3.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          "d/M/y",
                                                          widget.noticia!
                                                              .timestamp!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
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
                                                                      .secondaryText,
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
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        "jm",
                                                        widget.noticia!
                                                            .timestamp!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
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
                                                                    .secondaryText,
                                                                fontSize: 12.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 3.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    disabledIconColor:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    icon: Icon(
                                      Icons.thumb_up_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      size: 34.0,
                                    ),
                                    onPressed: (widget.noticia?.enviadoPor ==
                                            currentUserReference)
                                        ? null
                                        : () async {
                                            logFirebaseEvent(
                                                'NOTICIAS_CARD_COMP_IconButtonLike_ON_TAP');
                                            HapticFeedback.heavyImpact();
                                            if (!widget.noticia!.likes
                                                .contains(
                                                    currentUserReference)) {
                                              await widget.noticia!.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'likes':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }
                                          },
                                  ),
                                ],
                              ),
                            ),
                            if ((widget.noticia?.enviadoPor ==
                                    currentUserReference) ||
                                valueOrDefault<bool>(
                                    currentUserDocument?.root, false))
                              AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<IncidenciasRecord>>(
                                  stream: queryIncidenciasRecord(
                                    queryBuilder: (incidenciasRecord) =>
                                        incidenciasRecord.where(
                                      'noticia',
                                      isEqualTo: widget.noticia?.reference,
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
                                            color: FlutterFlowTheme.of(context)
                                                .barra,
                                            size: 24.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<IncidenciasRecord>
                                        columnIncidenciasRecordList =
                                        snapshot.data!;
                                    final columnIncidenciasRecord =
                                        columnIncidenciasRecordList.isNotEmpty
                                            ? columnIncidenciasRecordList.first
                                            : null;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                'NOTICIAS_CARD_phonelink_erase_rounded_IC');
                                            HapticFeedback.lightImpact();
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Eliminar Noticia'),
                                                          content: Text(
                                                              'Deseas Eliminar esta Noticia?'),
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
                                              await widget.noticia!.reference
                                                  .delete();
                                              if (columnIncidenciasRecord !=
                                                  null) {
                                                await columnIncidenciasRecord
                                                    .reference
                                                    .update({
                                                  ...createIncidenciasRecordData(
                                                    esNoticia: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'noticia':
                                                          FieldValue.delete(),
                                                    },
                                                  ),
                                                });
                                              }
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
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
                                                          'Noticia Eliminada!',
                                                      mensaje:
                                                          'La Noticia ha sido Eliminada correctamente.',
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              context.safePop();
                                              return;
                                            } else {
                                              return;
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 3.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'NOTICIAS_CARD_COMP_Text_yf3lq6te_ON_TAP');
                                      HapticFeedback.lightImpact();
                                      if (widget.noticia!.likes.length <= 0) {
                                        return;
                                      }

                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: NoticiasLikesWidget(
                                              noticia: widget.noticia,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      return;
                                    },
                                    child: Text(
                                      'Likes',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 3.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'NOTICIAS_CARD_COMP_Text_krcser9i_ON_TAP');
                                      HapticFeedback.lightImpact();
                                      if (widget.noticia!.likes.length <= 0) {
                                        return;
                                      }

                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: NoticiasLikesWidget(
                                              noticia: widget.noticia,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      return;
                                    },
                                    child: Text(
                                      formatNumber(
                                        widget.noticia!.likes.length,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'NOTICIAS_CARD_COMP_TextComentar_ON_TAP');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ComentarioWidget(
                                        noticia: widget.noticia!,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Text(
                                'Comentar',
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
                            if (widget.noticia!.comentarios.length > 0)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'NOTICIAS_CARD_TextVerComentarios_ON_TAP');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: NoticiasComentariosWidget(
                                          noticia: widget.noticia,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Text(
                                  'Ver comentarios...',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 12.0,
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
                      Divider(
                        height: 10.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 3.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'NOTICIAS_CARD_Container_6r7qzhhh_ON_TAP');
                                if (functions.textToLink(
                                            widget.noticia?.texto) !=
                                        null &&
                                    functions.textToLink(
                                            widget.noticia?.texto) !=
                                        '') {
                                  await launchURL(functions
                                      .textToLink(widget.noticia?.texto)!);
                                  return;
                                } else {
                                  return;
                                }
                              },
                              child: custom_widgets.ReadMoreTextWidget(
                                width: double.infinity,
                                height: 70.0,
                                texto: widget.noticia!.texto,
                                trimL: 3,
                                colorTexto:
                                    FlutterFlowTheme.of(context).primaryText,
                                colorClick:
                                    FlutterFlowTheme.of(context).tertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (widget.noticia?.tipo == 'FOTO')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 3.0, 5.0, 3.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NOTICIAS_CARD_COMP_Image_41nj2803_ON_TAP');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: CachedNetworkImage(
                                      fadeInDuration: Duration(milliseconds: 0),
                                      fadeOutDuration:
                                          Duration(milliseconds: 0),
                                      imageUrl: widget.noticia!.foto,
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: widget.noticia!.foto,
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: widget.noticia!.foto,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 0),
                                  fadeOutDuration: Duration(milliseconds: 0),
                                  imageUrl: widget.noticia!.foto,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget.noticia?.tipo == 'VIDEO')
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 3.0, 5.0, 3.0),
                            child: FlutterFlowVideoPlayer(
                              path: widget.noticia!.video,
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
        },
      ),
    );
  }
}
