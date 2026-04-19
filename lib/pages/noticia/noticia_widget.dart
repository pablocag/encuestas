import '/backend/backend.dart';
import '/components/noticias_card/noticias_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'noticia_model.dart';
export 'noticia_model.dart';

class NoticiaWidget extends StatefulWidget {
  const NoticiaWidget({
    super.key,
    this.noticia,
  });

  final NoticiasRecord? noticia;

  static String routeName = 'noticia';
  static String routePath = 'noticia';

  @override
  State<NoticiaWidget> createState() => _NoticiaWidgetState();
}

class _NoticiaWidgetState extends State<NoticiaWidget> {
  late NoticiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoticiaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'noticia'});
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
            buttonSize: 58.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 28.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NOTICIA_chevron_left_rounded_ICN_ON_TAP');
              context.safePop();
            },
          ),
          title: Text(
            'Publicación / Noticia',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.noticiasCardModel,
                updateCallback: () => safeSetState(() {}),
                child: NoticiasCardWidget(
                  noticia: widget.noticia,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
