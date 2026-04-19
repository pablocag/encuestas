import '/backend/backend.dart';
import '/components/list_encuestadores/list_encuestadores_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mis_encuestadores_widget.dart' show MisEncuestadoresWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MisEncuestadoresModel extends FlutterFlowModel<MisEncuestadoresWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Models for listEncuestadores dynamic component.
  late FlutterFlowDynamicModels<ListEncuestadoresModel> listEncuestadoresModels;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    listEncuestadoresModels =
        FlutterFlowDynamicModels(() => ListEncuestadoresModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    listEncuestadoresModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, UsersRecord> setListViewController(
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

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
