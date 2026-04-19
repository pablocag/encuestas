import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'mapa_modelo_encuesta_model.dart';
export 'mapa_modelo_encuesta_model.dart';

class MapaModeloEncuestaWidget extends StatefulWidget {
  const MapaModeloEncuestaWidget({
    super.key,
    required this.modelo,
  });

  final ModelosEncuestasRecord? modelo;

  static String routeName = 'mapaModeloEncuesta';
  static String routePath = 'mapaModeloEncuesta';

  @override
  State<MapaModeloEncuestaWidget> createState() =>
      _MapaModeloEncuestaWidgetState();
}

class _MapaModeloEncuestaWidgetState extends State<MapaModeloEncuestaWidget> {
  late MapaModeloEncuestaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaModeloEncuestaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mapaModeloEncuesta'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<EncuestasRecord>>(
      stream: queryEncuestasRecord(
        queryBuilder: (encuestasRecord) => encuestasRecord
            .where(
              'modeloEncuesta',
              isEqualTo: widget.modelo?.reference,
            )
            .where(
              'terminada',
              isEqualTo: true,
            )
            .orderBy('fechaCreacion'),
      )..listen((snapshot) {
          List<EncuestasRecord> mapaModeloEncuestaEncuestasRecordList =
              snapshot;
          if (_model.mapaModeloEncuestaPreviousSnapshot != null &&
              !const ListEquality(EncuestasRecordDocumentEquality()).equals(
                  mapaModeloEncuestaEncuestasRecordList,
                  _model.mapaModeloEncuestaPreviousSnapshot)) {
            () async {
              logFirebaseEvent('MAPA_MODELO_ENCUESTA_mapaModeloEncuesta_');

              safeSetState(() {});

              safeSetState(() {});
            }();
          }
          _model.mapaModeloEncuestaPreviousSnapshot = snapshot;
        }),
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
        List<EncuestasRecord> mapaModeloEncuestaEncuestasRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).barra,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('MAPA_MODELO_ENCUESTA_chevron_left_rounde');
                  context.pop();
                },
              ),
              title: Text(
                'Mapa de Aplicación de Encuesta',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
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
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Image.asset(
                                'assets/images/logo_Encuestas_sin_fondo.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/ENCUESTAS.png',
                                width: 100.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: FutureBuilder<int>(
                          future: queryEncuestasRecordCount(
                            queryBuilder: (encuestasRecord) =>
                                encuestasRecord.where(
                              'modeloEncuesta',
                              isEqualTo: widget.modelo?.reference,
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
                            int rowCount = snapshot.data!;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total: ${formatNumber(
                                    rowCount,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.periodDecimal,
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) =>
                                _model.googleMapsCenter = latLng,
                            initialLocation: _model.googleMapsCenter ??=
                                mapaModeloEncuestaEncuestasRecordList
                                    .firstOrNull!.posicionGPS!,
                            markers: mapaModeloEncuestaEncuestasRecordList
                                .map(
                                  (marker) => FlutterFlowMarker(
                                    marker.reference.path,
                                    marker.posicionGPS!,
                                    () async {
                                      logFirebaseEvent(
                                          'MAPA_MODELO_ENCUESTA_GoogleMap_06z5iox0_');
                                      _model.usuarioEncuestador =
                                          await UsersRecord.getDocumentOnce(
                                              marker.usuario!);
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
                                              child: CustomAlertWidget(
                                                titulo:
                                                    'Información de Marcador',
                                                mensaje:
                                                    'Localización: ${valueOrDefault<String>(
                                                  marker.posicionGPS
                                                      ?.toString(),
                                                  '[0,0]',
                                                )},  Aplicada el ${dateTimeFormat(
                                                  "d/M/y",
                                                  marker.fechaCreacion,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )} a las ${dateTimeFormat(
                                                  "jm",
                                                  marker.fechaCreacion,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )} por ${_model.usuarioEncuestador?.nombres} ${_model.usuarioEncuestador?.apPaterno} ${_model.usuarioEncuestador?.apMaterno}',
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      safeSetState(() {});
                                    },
                                  ),
                                )
                                .toList(),
                            markerColor: GoogleMarkerColor.violet,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: false,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
