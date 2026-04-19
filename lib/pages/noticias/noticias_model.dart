import '/backend/backend.dart';
import '/components/noticias_card/noticias_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'noticias_widget.dart' show NoticiasWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NoticiasModel extends FlutterFlowModel<NoticiasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, NoticiasRecord>? listViewPagingController;
  Query? listViewPagingQuery;

  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Models for noticiasCard dynamic component.
  late FlutterFlowDynamicModels<NoticiasCardModel> noticiasCardModels;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    noticiasCardModels = FlutterFlowDynamicModels(() => NoticiasCardModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();

    listViewPagingController?.dispose();

    columnController2?.dispose();
    noticiasCardModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, NoticiasRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, NoticiasRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, NoticiasRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryNoticiasRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 10,
          isStream: false,
        ),
      );
  }
}
