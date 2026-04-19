import '/backend/backend.dart';
import '/components/incidente_card/incidente_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'incidencias_root_widget.dart' show IncidenciasRootWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class IncidenciasRootModel extends FlutterFlowModel<IncidenciasRootWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for ListViewRoot widget.

  PagingController<DocumentSnapshot?, IncidenciasRecord>?
      listViewRootPagingController;
  Query? listViewRootPagingQuery;

  // Models for incidenteCard dynamic component.
  late FlutterFlowDynamicModels<IncidenteCardModel> incidenteCardModels;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    incidenteCardModels = FlutterFlowDynamicModels(() => IncidenteCardModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();

    listViewRootPagingController?.dispose();

    incidenteCardModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, IncidenciasRecord>
      setListViewRootController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewRootPagingController ??=
        _createListViewRootController(query, parent);
    if (listViewRootPagingQuery != query) {
      listViewRootPagingQuery = query;
      listViewRootPagingController?.refresh();
    }
    return listViewRootPagingController!;
  }

  PagingController<DocumentSnapshot?, IncidenciasRecord>
      _createListViewRootController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, IncidenciasRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryIncidenciasRecordPage(
          queryBuilder: (_) => listViewRootPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 10,
          isStream: false,
        ),
      );
  }
}
