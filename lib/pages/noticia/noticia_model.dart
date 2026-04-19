import '/components/noticias_card/noticias_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'noticia_widget.dart' show NoticiaWidget;
import 'package:flutter/material.dart';

class NoticiaModel extends FlutterFlowModel<NoticiaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for noticiasCard component.
  late NoticiasCardModel noticiasCardModel;

  @override
  void initState(BuildContext context) {
    noticiasCardModel = createModel(context, () => NoticiasCardModel());
  }

  @override
  void dispose() {
    noticiasCardModel.dispose();
  }
}
