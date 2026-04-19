import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mapa_modelo_encuesta_widget.dart' show MapaModeloEncuestaWidget;
import 'package:flutter/material.dart';

class MapaModeloEncuestaModel
    extends FlutterFlowModel<MapaModeloEncuestaWidget> {
  ///  State fields for stateful widgets in this page.

  List<EncuestasRecord>? mapaModeloEncuestaPreviousSnapshot;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - Read Document] action in GoogleMap widget.
  UsersRecord? usuarioEncuestador;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
