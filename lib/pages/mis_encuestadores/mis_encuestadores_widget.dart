import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/list_encuestadores/list_encuestadores_widget.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'mis_encuestadores_model.dart';
export 'mis_encuestadores_model.dart';

class MisEncuestadoresWidget extends StatefulWidget {
  const MisEncuestadoresWidget({super.key});

  static String routeName = 'misEncuestadores';
  static String routePath = 'misEncuestadores';

  @override
  State<MisEncuestadoresWidget> createState() => _MisEncuestadoresWidgetState();
}

class _MisEncuestadoresWidgetState extends State<MisEncuestadoresWidget> {
  late MisEncuestadoresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MisEncuestadoresModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'misEncuestadores'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord
            .where(
              'Padre',
              isEqualTo: currentUserReference,
            )
            .orderBy('Nombres')
            .orderBy('ApPaterno')
            .orderBy('ApMaterno'),
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
        List<UsersRecord> misEncuestadoresUsersRecordList =
            snapshot.data!.where((u) => u.uid != currentUserUid).toList();

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
                buttonSize: 58.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 28.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('MIS_ENCUESTADORES_chevron_left_rounded_I');
                  context.pop();
                },
              ),
              title: AuthUserStreamWidget(
                builder: (context) => Text(
                  valueOrDefault<bool>(currentUserDocument?.root, false)
                      ? 'Mis Encuestadores'
                      : 'Mis Encuestadores *',
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
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                controller: _model.columnController1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: SingleChildScrollView(
                        controller: _model.columnController2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              controller: _model.columnController3,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        logFirebaseEvent(
                                            'MIS_ENCUESTADORES_ListView_pn41j2j1_ON_P');
                                        HapticFeedback.lightImpact();

                                        safeSetState(() {});
                                      },
                                      child: PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          UsersRecord>(
                                        pagingController:
                                            _model.setListViewController(
                                          UsersRecord.collection
                                              .where(
                                                'Padre',
                                                isEqualTo: currentUserReference,
                                              )
                                              .orderBy('Nombres')
                                              .orderBy('ApPaterno')
                                              .orderBy('ApMaterno'),
                                        ),
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                UsersRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              Center(
                                            child: Container(
                                              width: double.infinity,
                                              height: 300.0,
                                              child: NoHayElementosWidget(),
                                            ),
                                          ),
                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewUsersRecord = _model
                                                .listViewPagingController!
                                                .itemList![listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 3.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'MIS_ENCUESTADORES_Container_hw6jrpv7_ON_');
                                                  HapticFeedback.lightImpact();

                                                  context.pushNamed(
                                                    EncuestadorDetalleWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'promotor':
                                                          serializeParam(
                                                        listViewUsersRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .listEncuestadoresModels
                                                      .getModel(
                                                    listViewUsersRecord.uid,
                                                    listViewIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      ListEncuestadoresWidget(
                                                    key: Key(
                                                      'Keyhw6_${listViewUsersRecord.uid}',
                                                    ),
                                                    idHijo: listViewUsersRecord
                                                        .reference,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
