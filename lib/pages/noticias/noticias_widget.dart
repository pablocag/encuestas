import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_hay_elementos/no_hay_elementos_widget.dart';
import '/components/noticias_card/noticias_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'noticias_model.dart';
export 'noticias_model.dart';

class NoticiasWidget extends StatefulWidget {
  const NoticiasWidget({super.key});

  static String routeName = 'noticias';
  static String routePath = 'noticias';

  @override
  State<NoticiasWidget> createState() => _NoticiasWidgetState();
}

class _NoticiasWidgetState extends State<NoticiasWidget>
    with TickerProviderStateMixin {
  late NoticiasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoticiasModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'noticias'});
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
              logFirebaseEvent('NOTICIAS_chevron_left_rounded_ICN_ON_TAP');

              context.goNamed(HomePageWidget.routeName);
            },
          ),
          title: Text(
            'Publicaciones y Noticias',
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
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 10.0, 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/images/logo_Encuestas_sin_fondo.png',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Text(
                          'Publicar una nueva Noticia',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primaryText,
                        borderRadius: 30.0,
                        borderWidth: 8.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent('NOTICIAS_PAGE_add_ICN_ON_TAP');
                          HapticFeedback.lightImpact();

                          context.pushNamed(NuevaNoticiaWidget.routeName);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    controller: _model.columnController1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.85,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: AuthUserStreamWidget(
                            builder: (context) => RefreshIndicator(
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'NOTICIAS_ListView_otv837km_ON_PULL_TO_RE');
                                HapticFeedback.heavyImpact();

                                safeSetState(() {});
                              },
                              child: PagedListView<DocumentSnapshot<Object?>?,
                                  NoticiasRecord>(
                                pagingController: _model.setListViewController(
                                  NoticiasRecord.collection
                                      .where(
                                        'membresia',
                                        isEqualTo:
                                            currentUserDocument?.membresia,
                                      )
                                      .orderBy('timestamp', descending: true),
                                ),
                                padding: EdgeInsets.zero,
                                primary: false,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<NoticiasRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 24.0,
                                      height: 24.0,
                                      child: SpinKitThreeBounce(
                                        color:
                                            FlutterFlowTheme.of(context).barra,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 24.0,
                                      height: 24.0,
                                      child: SpinKitThreeBounce(
                                        color:
                                            FlutterFlowTheme.of(context).barra,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  noItemsFoundIndicatorBuilder: (_) =>
                                      Container(
                                    width: double.infinity,
                                    height: 300.0,
                                    child: NoHayElementosWidget(),
                                  ),
                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewNoticiasRecord = _model
                                        .listViewPagingController!
                                        .itemList![listViewIndex];
                                    return SingleChildScrollView(
                                      controller: _model.columnController2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model.noticiasCardModels
                                                  .getModel(
                                                listViewNoticiasRecord
                                                    .reference.id,
                                                listViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: NoticiasCardWidget(
                                                key: Key(
                                                  'Keybve_${listViewNoticiasRecord.reference.id}',
                                                ),
                                                noticia: listViewNoticiasRecord,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
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
        ),
      ),
    );
  }
}
