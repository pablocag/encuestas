import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/custom_alert_sin_link/custom_alert_sin_link_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'mi_perfil_model.dart';
export 'mi_perfil_model.dart';

class MiPerfilWidget extends StatefulWidget {
  const MiPerfilWidget({super.key});

  static String routeName = 'miPerfil';
  static String routePath = 'miPerfil';

  @override
  State<MiPerfilWidget> createState() => _MiPerfilWidgetState();
}

class _MiPerfilWidgetState extends State<MiPerfilWidget>
    with TickerProviderStateMixin {
  late MiPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiPerfilModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'miPerfil'});
    _model.txTCelularTextController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.txTCelularFocusNode ??= FocusNode();

    _model.txTCelularMask = MaskTextInputFormatter(mask: '##########');
    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
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
              logFirebaseEvent('MI_PERFIL_chevron_left_rounded_ICN_ON_TA');
              context.pop();
            },
          ),
          title: Text(
            'Mi Perfil',
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
          child: SingleChildScrollView(
            primary: false,
            controller: _model.columnController1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MI_PERFIL_PAGE_Image_nj7ddyeq_ON_TAP');
                            HapticFeedback.lightImpact();
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              imageQuality: 40,
                              allowPhoto: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              pickerFontFamily: 'Outfit',
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() =>
                                  _model.isDataUploading_uploadDataJ9a = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Subiendo Archivo...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading_uploadDataJ9a = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile_uploadDataJ9a =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl_uploadDataJ9a =
                                      downloadUrls.first;
                                });
                                showUploadMessage(
                                    context, 'Archivo cargado con éxito!');
                              } else {
                                safeSetState(() {});
                                showUploadMessage(
                                    context, 'Fallo en la carga de Archivo');
                                return;
                              }
                            }

                            await Future.delayed(
                              Duration(
                                milliseconds: 3000,
                              ),
                            );
                            if (_model.uploadedFileUrl_uploadDataJ9a != '') {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                photoUrl: _model.uploadedFileUrl_uploadDataJ9a,
                              ));
                              return;
                            } else {
                              return;
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                currentUserPhoto,
                                'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                              ),
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                              cacheWidth: 60,
                              cacheHeight: 60,
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ),
                      Expanded(
                        child: AuthUserStreamWidget(
                          builder: (context) =>
                              StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'uid',
                                isEqualTo: currentUserDocument?.padre?.id,
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
                                      color: FlutterFlowTheme.of(context).barra,
                                      size: 24.0,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> columnUsersRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnUsersRecord =
                                  columnUsersRecordList.isNotEmpty
                                      ? columnUsersRecordList.first
                                      : null;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: SelectionArea(
                                        child: AutoSizeText(
                                      '${valueOrDefault(currentUserDocument?.nombres, '')} ${valueOrDefault(currentUserDocument?.apPaterno, '')} ${valueOrDefault(currentUserDocument?.apMaterno, '')}',
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleMediumIsCustom,
                                          ),
                                    )),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: SelectionArea(
                                        child: Text(
                                      currentUserEmail,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleMediumIsCustom,
                                          ),
                                    )),
                                  ),
                                  if (!valueOrDefault<bool>(
                                          currentUserDocument?.root, false) &&
                                      valueOrDefault<bool>(
                                          currentUserDocument?.promotor, false))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: SelectionArea(
                                          child: Text(
                                        'Promotor de ${columnUsersRecord?.nombres} ${columnUsersRecord?.apPaterno} ${columnUsersRecord?.apMaterno}',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                      )),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) =>
                              StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where(
                                    'root',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'membresia',
                                    isEqualTo: currentUserDocument?.membresia,
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
                                      color: FlutterFlowTheme.of(context).barra,
                                      size: 24.0,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> columnRootUsersRecordList =
                                  snapshot.data!;
                              final columnRootUsersRecord =
                                  columnRootUsersRecordList.isNotEmpty
                                      ? columnRootUsersRecordList.first
                                      : null;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Borrar Cuenta',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(
                                        'God',
                                        isEqualTo: true,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .barra,
                                              size: 24.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          containerGodUsersRecordList =
                                          snapshot.data!;
                                      final containerGodUsersRecord =
                                          containerGodUsersRecordList.isNotEmpty
                                              ? containerGodUsersRecordList
                                                  .first
                                              : null;

                                      return Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: StreamBuilder<
                                            List<PromovidosRecord>>(
                                          stream: queryPromovidosRecord(
                                            queryBuilder: (promovidosRecord) =>
                                                promovidosRecord.where(
                                              'email',
                                              isEqualTo: currentUserEmail,
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
                                            List<PromovidosRecord>
                                                iconButtonPromovidosRecordList =
                                                snapshot.data!;
                                            final iconButtonPromovidosRecord =
                                                iconButtonPromovidosRecordList
                                                        .isNotEmpty
                                                    ? iconButtonPromovidosRecordList
                                                        .first
                                                    : null;

                                            return FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons
                                                    .cancel_presentation_rounded,
                                                color: Color(0xFFA1231D),
                                                size: 28.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'MI_PERFIL_cancel_presentation_rounded_IC');
                                                var _shouldSetState = false;
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Borrar Cuenta'),
                                                              content: Text(
                                                                  '¿Realmente desea Eliminar su Cuenta? Se borrarán todos sus Datos'),
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
                                                  if (currentUserDocument
                                                          ?.padre !=
                                                      null) {
                                                    // Todos los usuarios y promovidos pasan al nodo PADRE
                                                    await actions
                                                        .updateHijosPromovidos(
                                                      currentUserDocument!
                                                          .padre!,
                                                      (currentUserDocument
                                                                  ?.hijoaPromovidos
                                                                  .toList() ??
                                                              [])
                                                          .toList(),
                                                    );
                                                    await actions
                                                        .updateHijosPromotores(
                                                      currentUserDocument!
                                                          .padre!,
                                                      (currentUserDocument
                                                                  ?.hijos
                                                                  .toList() ??
                                                              [])
                                                          .toList(),
                                                    );

                                                    await currentUserDocument!
                                                        .padre!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'Hijos': FieldValue
                                                              .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    if (iconButtonPromovidosRecord !=
                                                        null) {
                                                      await currentUserDocument!
                                                          .padre!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'HijoaPromovidos':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              iconButtonPromovidosRecord
                                                                  .reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                    await actions
                                                        .updateHijosPromovidosPadre(
                                                      currentUserReference!,
                                                      currentUserDocument!
                                                          .padre!,
                                                    );
                                                    await actions
                                                        .updateHijosPromotoresPadre(
                                                      currentUserReference!,
                                                      currentUserDocument!
                                                          .padre!,
                                                    );
                                                  } else {
                                                    if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.root,
                                                        false)) {
                                                      // Todos los usuarios y promovidos psan al usuario GOD
                                                      await actions
                                                          .updateHijosPromovidos(
                                                        containerGodUsersRecord!
                                                            .reference,
                                                        (currentUserDocument
                                                                    ?.hijoaPromovidos
                                                                    .toList() ??
                                                                [])
                                                            .toList(),
                                                      );
                                                      await actions
                                                          .updateHijosPromotores(
                                                        containerGodUsersRecord
                                                            .reference,
                                                        (currentUserDocument
                                                                    ?.hijos
                                                                    .toList() ??
                                                                [])
                                                            .toList(),
                                                      );

                                                      await containerGodUsersRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'Hijos': FieldValue
                                                                .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      if (iconButtonPromovidosRecord !=
                                                          null) {
                                                        await containerGodUsersRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'HijoaPromovidos':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                iconButtonPromovidosRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                      await actions
                                                          .updateHijosPromovidosPadre(
                                                        currentUserReference!,
                                                        containerGodUsersRecord
                                                            .reference,
                                                      );
                                                      await actions
                                                          .updateHijosPromotoresPadre(
                                                        currentUserReference!,
                                                        containerGodUsersRecord
                                                            .reference,
                                                      );
                                                    } else {
                                                      // Todos los usuarios y promovidos psan al usuario GOD
                                                      await actions
                                                          .updateHijosPromovidos(
                                                        columnRootUsersRecord!
                                                            .reference,
                                                        (currentUserDocument
                                                                    ?.hijoaPromovidos
                                                                    .toList() ??
                                                                [])
                                                            .toList(),
                                                      );
                                                      await actions
                                                          .updateHijosPromotores(
                                                        columnRootUsersRecord
                                                            .reference,
                                                        (currentUserDocument
                                                                    ?.hijos
                                                                    .toList() ??
                                                                [])
                                                            .toList(),
                                                      );

                                                      await columnRootUsersRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'Hijos': FieldValue
                                                                .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      if (iconButtonPromovidosRecord !=
                                                          null) {
                                                        await columnRootUsersRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'HijoaPromovidos':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                iconButtonPromovidosRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                      await actions
                                                          .updateHijosPromovidosPadre(
                                                        currentUserReference!,
                                                        columnRootUsersRecord
                                                            .reference,
                                                      );
                                                      await actions
                                                          .updateHijosPromotoresPadre(
                                                        currentUserReference!,
                                                        columnRootUsersRecord
                                                            .reference,
                                                      );
                                                    }
                                                  }

                                                  if (iconButtonPromovidosRecord !=
                                                      null) {
                                                    await iconButtonPromovidosRecord
                                                        .reference
                                                        .delete();
                                                  }
                                                  _model.referenciasEliminadas =
                                                      await actions
                                                          .deleteReferenciasUsuario(
                                                    currentUserReference!,
                                                  );
                                                  _shouldSetState = true;
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x00000000),
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
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
                                                                'Cuenta Eliminada',
                                                            mensaje:
                                                                'Su cuenta ha sido Eliminada de nuestros registros. Además se elimaron ${valueOrDefault<String>(
                                                              formatNumber(
                                                                _model
                                                                    .referenciasEliminadas,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .periodDecimal,
                                                              ),
                                                              '0',
                                                            )} Referencias en todos los módulos.',
                                                            alerta: true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  await authManager
                                                      .deleteUser(context);

                                                  context.goNamed(
                                                      WelcomePageWidget
                                                          .routeName);

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
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (valueOrDefault<bool>(
                    currentUserDocument?.tieneMembresia, false))
                  AuthUserStreamWidget(
                    builder: (context) => FutureBuilder<MembresiasRecord>(
                      future: MembresiasRecord.getDocumentOnce(
                          currentUserDocument!.membresia!),
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

                        final rowMembresiasRecord = snapshot.data!;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      rowMembresiasRecord.usuario!),
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

                                    final columnUsersRecord = snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Membresía',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleMediumIsCustom,
                                              ),
                                        ),
                                        Text(
                                          rowMembresiasRecord.membresiaID,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                        ),
                                        Text(
                                          '${columnUsersRecord.nombres} ${columnUsersRecord.apPaterno} ${columnUsersRecord.apMaterno}',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            rowMembresiasRecord.descripcion,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallIsCustom,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 15.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.qr_code_rounded,
                                      color: FlutterFlowTheme.of(context).barra,
                                      size: 42.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MI_PERFIL_qr_code_rounded_ICN_ON_TAP');
                                      HapticFeedback.lightImpact();

                                      context
                                          .pushNamed(MiQRCodeWidget.routeName);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                Divider(
                  thickness: 1.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: SingleChildScrollView(
                        controller: _model.columnController2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!valueOrDefault<bool>(
                                currentUserDocument?.tieneMembresia, false))
                              Padding(
                                padding: EdgeInsets.all(10.0),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Html(
                                            data:
                                                containerNoPromotorTextosRecord!
                                                    .texto,
                                            onLinkTap: (url, _, __) =>
                                                launchURL(url!),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.tieneMembresia, false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 10.0, 5.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => TextFormField(
                                    controller: _model.txTCelularTextController,
                                    focusNode: _model.txTCelularFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.txTCelularTextController',
                                      Duration(milliseconds: 2000),
                                      () => safeSetState(() {}),
                                    ),
                                    autofocus: false,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Teléfono',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      suffixIcon: _model
                                              .txTCelularTextController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.txTCelularTextController
                                                    ?.clear();
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    keyboardType: TextInputType.phone,
                                    validator: _model
                                        .txTCelularTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [_model.txTCelularMask],
                                  ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.tieneMembresia, false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MI_PERFIL_PAGE_ACTUALIZAR_BTN_ON_TAP');
                                      HapticFeedback.lightImpact();

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        phoneNumber: valueOrDefault<String>(
                                          _model.txTCelularTextController.text,
                                          '0000000000',
                                        ),
                                      ));
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
                                              child: CustomAlertSinLinkWidget(
                                                titulo: 'Éxito',
                                                mensaje: 'Perfil Actualizado!',
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: 'Actualizar',
                                    icon: Icon(
                                      Icons.save,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 250.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                              ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.tieneMembresia, false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 15.0, 0.0, 30.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (valueOrDefault(
                                                  currentUserDocument?.pinCode,
                                                  '') ==
                                              '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'MI_PERFIL_CREAR_MI_P_I_N_CODE_BTN_ON_TAP');
                                              var _shouldSetState = false;
                                              HapticFeedback.lightImpact();
                                              while (true) {
                                                _model.nuevoPINL = await actions
                                                    .crearPINCode();
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
                                                      .update(
                                                          createUsersRecordData(
                                                    pinCode: _model.nuevoPINL,
                                                  ));
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              }
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
                                                            'PIN Code creado con éxito!',
                                                        mensaje:
                                                            'Utilice su PIN Code para compartirlo y que sus amigos puedan activarse como miembros de esta Red Social Privada!',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            text: 'Crear mi PIN Code',
                                            icon: Icon(
                                              Icons.pin,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmallIsCustom,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            'PIN Code:',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            valueOrDefault(
                                                currentUserDocument?.pinCode,
                                                ''),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          )),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
