import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_search/text_search.dart';
import 'asigna_encuestadores_model.dart';
export 'asigna_encuestadores_model.dart';

class AsignaEncuestadoresWidget extends StatefulWidget {
  const AsignaEncuestadoresWidget({super.key});

  static String routeName = 'asignaEncuestadores';
  static String routePath = 'asignaEncuestadores';

  @override
  State<AsignaEncuestadoresWidget> createState() =>
      _AsignaEncuestadoresWidgetState();
}

class _AsignaEncuestadoresWidgetState extends State<AsignaEncuestadoresWidget> {
  late AsignaEncuestadoresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsignaEncuestadoresModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'asignaEncuestadores'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ASIGNA_ENCUESTADORES_asignaEncuestadores');
      _model.showAll = true;
      _model.encuestadores = false;
      safeSetState(() {});
    });

    _model.switchValue = false;
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
              logFirebaseEvent('ASIGNA_ENCUESTADORES_chevron_left_rounde');
              context.pop();
            },
          ),
          title: Text(
            'Encuestadores Activos',
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
          child: AuthUserStreamWidget(
            builder: (context) => StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
                queryBuilder: (usersRecord) => usersRecord
                    .where(
                      'membresia',
                      isEqualTo: currentUserDocument?.membresia,
                    )
                    .where(
                      'activo',
                      isEqualTo: true,
                    )
                    .where(
                      'God',
                      isEqualTo: false,
                    )
                    .orderBy('Nombres')
                    .orderBy('ApPaterno')
                    .orderBy('ApMaterno'),
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
                List<UsersRecord> containerUsersRecordList = snapshot.data!
                    .where((u) => u.uid != currentUserUid)
                    .toList();

                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FutureBuilder<int>(
                            future: queryUsersRecordCount(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where(
                                    'membresia',
                                    isEqualTo: currentUserDocument?.membresia,
                                  )
                                  .where(
                                    'Encuestador',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'God',
                                    isEqualTo: false,
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
                                      color: FlutterFlowTheme.of(context).barra,
                                      size: 24.0,
                                    ),
                                  ),
                                );
                              }
                              int containerCount = snapshot.data!;

                              return Material(
                                color: Colors.transparent,
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Total de Encuestadores: ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallIsCustom,
                                                  ),
                                            ),
                                            Text(
                                              formatNumber(
                                                containerCount,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallIsCustom,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Switch.adaptive(
                                              value: _model.switchValue!,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .switchValue = newValue);
                                                if (newValue) {
                                                  logFirebaseEvent(
                                                      'ASIGNA_ENCUESTADORES_Switch_ijj7st30_ON_');
                                                  _model.encuestadores = true;
                                                  _model.showAll = false;
                                                  safeSetState(() {});
                                                } else {
                                                  logFirebaseEvent(
                                                      'ASIGNA_ENCUESTADORES_Switch_ijj7st30_ON_');
                                                  _model.encuestadores = false;
                                                  _model.showAll = true;
                                                  safeSetState(() {});
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            Text(
                                              'Encuestadores',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
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
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 1000),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Buscar',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodySmallIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    suffixIcon: _model
                                            .textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController?.clear();
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              if (_model.textController.text != '')
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 15.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ASIGNA_ENCUESTADORES_search_rounded_ICN_');
                                    safeSetState(() {
                                      _model.simpleSearchResults = TextSearch(
                                        containerUsersRecordList
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record, [
                                                record.nombres,
                                                record.apPaterno,
                                                record.apMaterno,
                                                record.email,
                                                record.phoneNumber
                                              ]),
                                            )
                                            .toList(),
                                      )
                                          .search(_model.textController.text)
                                          .map((r) => r.object)
                                          .toList();
                                      ;
                                    });
                                    _model.showAll = false;
                                    safeSetState(() {});
                                  },
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((_model.textController.text == '') &&
                                    _model.encuestadores)
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord
                                                  .where(
                                                    'membresia',
                                                    isEqualTo:
                                                        currentUserDocument
                                                            ?.membresia,
                                                  )
                                                  .where(
                                                    'Encuestador',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'God',
                                                    isEqualTo: false,
                                                  )
                                                  .where(
                                                    'activo',
                                                    isEqualTo: true,
                                                  )
                                                  .orderBy('Nombres')
                                                  .orderBy('ApPaterno')
                                                  .orderBy('ApMaterno'),
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
                                          List<UsersRecord>
                                              listViewEncuestadoresUsersRecordList =
                                              snapshot.data!
                                                  .where((u) =>
                                                      u.uid != currentUserUid)
                                                  .toList();
                                          if (listViewEncuestadoresUsersRecordList
                                              .isEmpty) {
                                            return Center(
                                              child: Container(
                                                width: double.infinity,
                                                height: 300.0,
                                                child: NoHayElementosWidget(),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewEncuestadoresUsersRecordList
                                                    .length,
                                            itemBuilder: (context,
                                                listViewEncuestadoresIndex) {
                                              final listViewEncuestadoresUsersRecord =
                                                  listViewEncuestadoresUsersRecordList[
                                                      listViewEncuestadoresIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 10.0, 5.0),
                                                child: InkWell(
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
                                                        'ASIGNA_ENCUESTADORES_Container_4k27y7bn_');
                                                    HapticFeedback
                                                        .lightImpact();

                                                    context.pushNamed(
                                                      EncuestadorDetalleWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'promotor':
                                                            serializeParam(
                                                          listViewEncuestadoresUsersRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 80.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .colorPromotor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ASIGNA_ENCUESTADORES_Image_4yvje0bi_ON_T');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              listViewEncuestadoresUsersRecord.photoUrl,
                                                                              'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: valueOrDefault<
                                                                              String>(
                                                                            listViewEncuestadoresUsersRecord.photoUrl,
                                                                            'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a' +
                                                                                '$listViewEncuestadoresIndex',
                                                                          ),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: valueOrDefault<
                                                                        String>(
                                                                      listViewEncuestadoresUsersRecord
                                                                          .photoUrl,
                                                                      'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a' +
                                                                          '$listViewEncuestadoresIndex',
                                                                    ),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewEncuestadoresUsersRecord
                                                                              .photoUrl,
                                                                          'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                                        ),
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ASIGNA_ENCUESTADORES_Column_ip8wo73e_ON_');

                                                                    context
                                                                        .pushNamed(
                                                                      EncuestadorDetalleWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'promotor':
                                                                            serializeParam(
                                                                          listViewEncuestadoresUsersRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${listViewEncuestadoresUsersRecord.nombres} ${listViewEncuestadoresUsersRecord.apPaterno} ${listViewEncuestadoresUsersRecord.apMaterno}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        listViewEncuestadoresUsersRecord
                                                                            .phoneNumber,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              if (listViewEncuestadoresUsersRecord
                                                                  .encuestador)
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onLongPress:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ASIGNA_ENCUESTADORES_Icon_omsoh4d6_ON_LO');
                                                                          HapticFeedback
                                                                              .lightImpact();

                                                                          await listViewEncuestadoresUsersRecord
                                                                              .reference
                                                                              .update(createUsersRecordData(
                                                                            adminEncuestas:
                                                                                !listViewEncuestadoresUsersRecord.adminEncuestas,
                                                                          ));
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
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
                                                                                    titulo: 'Éxito!',
                                                                                    mensaje: 'Rol de Admin Encuestador Actualizado!',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .admin_panel_settings_outlined,
                                                                          color: listViewEncuestadoresUsersRecord.adminEncuestas
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              32.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
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
                                                                      onLongPress:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'ASIGNA_ENCUESTADORES_Icon_q96rlbrq_ON_LO');
                                                                        HapticFeedback
                                                                            .lightImpact();

                                                                        await listViewEncuestadoresUsersRecord
                                                                            .reference
                                                                            .update(createUsersRecordData(
                                                                          encuestador:
                                                                              !listViewEncuestadoresUsersRecord.encuestador,
                                                                        ));
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
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
                                                                                  titulo: 'Éxito!',
                                                                                  mensaje: 'Rol de Encuestador Actualizado!',
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .idBadge,
                                                                        color: listViewEncuestadoresUsersRecord.encuestador
                                                                            ? FlutterFlowTheme.of(context).success
                                                                            : FlutterFlowTheme.of(context).error,
                                                                        size:
                                                                            32.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
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
                                        },
                                      ),
                                    ),
                                  ),
                                if ((_model.textController.text == '') &&
                                    !_model.encuestadores)
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord
                                                  .where(
                                                    'membresia',
                                                    isEqualTo:
                                                        currentUserDocument
                                                            ?.membresia,
                                                  )
                                                  .where(
                                                    'Encuestador',
                                                    isEqualTo: false,
                                                  )
                                                  .where(
                                                    'God',
                                                    isEqualTo: false,
                                                  )
                                                  .where(
                                                    'activo',
                                                    isEqualTo: true,
                                                  )
                                                  .orderBy('Nombres')
                                                  .orderBy('ApPaterno')
                                                  .orderBy('ApMaterno'),
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
                                          List<UsersRecord>
                                              listViewNoEncuestadoressUsersRecordList =
                                              snapshot.data!
                                                  .where((u) =>
                                                      u.uid != currentUserUid)
                                                  .toList();
                                          if (listViewNoEncuestadoressUsersRecordList
                                              .isEmpty) {
                                            return Center(
                                              child: Container(
                                                width: double.infinity,
                                                height: 300.0,
                                                child: NoHayElementosWidget(),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewNoEncuestadoressUsersRecordList
                                                    .length,
                                            itemBuilder: (context,
                                                listViewNoEncuestadoressIndex) {
                                              final listViewNoEncuestadoressUsersRecord =
                                                  listViewNoEncuestadoressUsersRecordList[
                                                      listViewNoEncuestadoressIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 10.0, 5.0),
                                                child: InkWell(
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
                                                        'ASIGNA_ENCUESTADORES_Container_of7q651k_');
                                                    HapticFeedback
                                                        .lightImpact();

                                                    context.pushNamed(
                                                      EncuestadorDetalleWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'promotor':
                                                            serializeParam(
                                                          listViewNoEncuestadoressUsersRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 80.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .colorPromotor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ASIGNA_ENCUESTADORES_Image_megkwzxa_ON_T');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              listViewNoEncuestadoressUsersRecord.photoUrl,
                                                                              'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: valueOrDefault<
                                                                              String>(
                                                                            listViewNoEncuestadoressUsersRecord.photoUrl,
                                                                            'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a' +
                                                                                '$listViewNoEncuestadoressIndex',
                                                                          ),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: valueOrDefault<
                                                                        String>(
                                                                      listViewNoEncuestadoressUsersRecord
                                                                          .photoUrl,
                                                                      'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a' +
                                                                          '$listViewNoEncuestadoressIndex',
                                                                    ),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewNoEncuestadoressUsersRecord
                                                                              .photoUrl,
                                                                          'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                                        ),
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ASIGNA_ENCUESTADORES_Column_fgeb3cin_ON_');

                                                                    context
                                                                        .pushNamed(
                                                                      EncuestadorDetalleWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'promotor':
                                                                            serializeParam(
                                                                          listViewNoEncuestadoressUsersRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${listViewNoEncuestadoressUsersRecord.nombres} ${listViewNoEncuestadoressUsersRecord.apPaterno} ${listViewNoEncuestadoressUsersRecord.apMaterno}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        listViewNoEncuestadoressUsersRecord
                                                                            .phoneNumber,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              if (listViewNoEncuestadoressUsersRecord
                                                                  .encuestador)
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onLongPress:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ASIGNA_ENCUESTADORES_Icon_76rr9ooc_ON_LO');
                                                                          HapticFeedback
                                                                              .lightImpact();

                                                                          await listViewNoEncuestadoressUsersRecord
                                                                              .reference
                                                                              .update(createUsersRecordData(
                                                                            adminEncuestas:
                                                                                !listViewNoEncuestadoressUsersRecord.adminEncuestas,
                                                                          ));
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
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
                                                                                    titulo: 'Éxito!',
                                                                                    mensaje: 'Rol de Admin Encuestador Actualizado!',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .admin_panel_settings_outlined,
                                                                          color: listViewNoEncuestadoressUsersRecord.adminEncuestas
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              32.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
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
                                                                      onLongPress:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'ASIGNA_ENCUESTADORES_Icon_jiydi96t_ON_LO');
                                                                        HapticFeedback
                                                                            .lightImpact();

                                                                        await listViewNoEncuestadoressUsersRecord
                                                                            .reference
                                                                            .update(createUsersRecordData(
                                                                          encuestador:
                                                                              !listViewNoEncuestadoressUsersRecord.encuestador,
                                                                        ));
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
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
                                                                                  titulo: 'Éxito!',
                                                                                  mensaje: 'Rol de Encuestador Actualizado!',
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .idBadge,
                                                                        color: listViewNoEncuestadoressUsersRecord.encuestador
                                                                            ? FlutterFlowTheme.of(context).success
                                                                            : FlutterFlowTheme.of(context).error,
                                                                        size:
                                                                            32.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
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
                                        },
                                      ),
                                    ),
                                  ),
                                if ((_model.textController.text != '') &&
                                    !_model.showAll!)
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final busquedaRED = _model
                                              .simpleSearchResults
                                              .toList();
                                          if (busquedaRED.isEmpty) {
                                            return Center(
                                              child: Container(
                                                width: double.infinity,
                                                height: 300.0,
                                                child: NoHayElementosWidget(),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: busquedaRED.length,
                                            itemBuilder:
                                                (context, busquedaREDIndex) {
                                              final busquedaREDItem =
                                                  busquedaRED[busquedaREDIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 10.0, 5.0),
                                                child: InkWell(
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
                                                        'ASIGNA_ENCUESTADORES_Container_9tgnalzc_');
                                                    HapticFeedback
                                                        .lightImpact();

                                                    context.pushNamed(
                                                      EncuestadorDetalleWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'promotor':
                                                            serializeParam(
                                                          busquedaREDItem
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 80.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .colorPromotor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ASIGNA_ENCUESTADORES_Image_enr0sfzc_ON_T');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              busquedaREDItem.photoUrl,
                                                                              'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: valueOrDefault<
                                                                              String>(
                                                                            busquedaREDItem.photoUrl,
                                                                            'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a' +
                                                                                '$busquedaREDIndex',
                                                                          ),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: valueOrDefault<
                                                                        String>(
                                                                      busquedaREDItem
                                                                          .photoUrl,
                                                                      'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a' +
                                                                          '$busquedaREDIndex',
                                                                    ),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          busquedaREDItem
                                                                              .photoUrl,
                                                                          'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/Icon-user.png?alt=media&token=80efdbc3-14c4-46fc-a52a-ca7bedf72c4a',
                                                                        ),
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ASIGNA_ENCUESTADORES_Column_sgbfgr9u_ON_');

                                                                    context
                                                                        .pushNamed(
                                                                      EncuestadorDetalleWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'promotor':
                                                                            serializeParam(
                                                                          busquedaREDItem
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${busquedaREDItem.nombres} ${busquedaREDItem.apPaterno} ${busquedaREDItem.apMaterno}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        busquedaREDItem
                                                                            .phoneNumber,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              if (busquedaREDItem
                                                                  .encuestador)
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onLongPress:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ASIGNA_ENCUESTADORES_Icon_17i7flge_ON_LO');
                                                                          HapticFeedback
                                                                              .lightImpact();

                                                                          await busquedaREDItem
                                                                              .reference
                                                                              .update(createUsersRecordData(
                                                                            adminEncuestas:
                                                                                !busquedaREDItem.adminEncuestas,
                                                                          ));
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
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
                                                                                    titulo: 'Éxito!',
                                                                                    mensaje: 'Rol de Admin Encuestador Actualizado!',
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .admin_panel_settings_outlined,
                                                                          color: busquedaREDItem.adminEncuestas
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              32.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
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
                                                                      onLongPress:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'ASIGNA_ENCUESTADORES_Icon_dowyafam_ON_LO');
                                                                        HapticFeedback
                                                                            .lightImpact();

                                                                        await busquedaREDItem
                                                                            .reference
                                                                            .update(createUsersRecordData(
                                                                          encuestador:
                                                                              !busquedaREDItem.encuestador,
                                                                        ));
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
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
                                                                                  titulo: 'Éxito!',
                                                                                  mensaje: 'Rol de Encuestador Actualizado!',
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .idBadge,
                                                                        color: busquedaREDItem.encuestador
                                                                            ? FlutterFlowTheme.of(context).success
                                                                            : FlutterFlowTheme.of(context).error,
                                                                        size:
                                                                            32.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
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
                                        },
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
