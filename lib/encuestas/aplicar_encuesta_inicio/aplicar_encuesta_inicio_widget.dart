import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'aplicar_encuesta_inicio_model.dart';
export 'aplicar_encuesta_inicio_model.dart';

class AplicarEncuestaInicioWidget extends StatefulWidget {
  const AplicarEncuestaInicioWidget({
    super.key,
    required this.modelo,
  });

  final ModelosEncuestasRecord? modelo;

  static String routeName = 'aplicarEncuestaInicio';
  static String routePath = 'aplicarEncuestaInicio';

  @override
  State<AplicarEncuestaInicioWidget> createState() =>
      _AplicarEncuestaInicioWidgetState();
}

class _AplicarEncuestaInicioWidgetState
    extends State<AplicarEncuestaInicioWidget> {
  late AplicarEncuestaInicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AplicarEncuestaInicioModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'aplicarEncuestaInicio'});
    _model.textFieldNombreTextController ??= TextEditingController();
    _model.textFieldNombreFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ModelosPreguntasEncuestaRecord>>(
      stream: queryModelosPreguntasEncuestaRecord(
        queryBuilder: (modelosPreguntasEncuestaRecord) =>
            modelosPreguntasEncuestaRecord
                .where(
                  'modeloEncuesta',
                  isEqualTo: widget.modelo?.reference,
                )
                .where(
                  'numero',
                  isEqualTo: 1,
                ),
        singleRecord: true,
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
        List<ModelosPreguntasEncuestaRecord>
            aplicarEncuestaInicioModelosPreguntasEncuestaRecordList =
            snapshot.data!;
        final aplicarEncuestaInicioModelosPreguntasEncuestaRecord =
            aplicarEncuestaInicioModelosPreguntasEncuestaRecordList.isNotEmpty
                ? aplicarEncuestaInicioModelosPreguntasEncuestaRecordList.first
                : null;

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
                buttonSize: 54.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('APLICAR_ENCUESTA_INICIO_chevron_left_rou');
                  context.pop();
                },
              ),
              title: Text(
                'Iniciar Encuesta',
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
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
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: SingleChildScrollView(
                        controller: _model.columnController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.modelo?.titulo,
                                  'Sin Titulo',
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 5,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleLargeIsCustom,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 5.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.modelo?.descripcion,
                                  'Sin Descripción',
                                ),
                                textAlign: TextAlign.justify,
                                maxLines: 5,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleMediumIsCustom,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 10.0, 5.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE9E9E9),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/pitch.png',
                                        width: 80.0,
                                        height: 80.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 5.0),
                                          child: Text(
                                            'Pitch',
                                            textAlign: TextAlign.justify,
                                            maxLines: 5,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 15.0, 5.0, 5.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.modelo?.pitch,
                                  'Iniciar Encuesta',
                                ),
                                textAlign: TextAlign.justify,
                                maxLines: 30,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleMediumIsCustom,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Text(
                        'Nombre del Encuestado',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _model.textFieldNombreTextController,
                        focusNode: _model.textFieldNombreFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textFieldNombreTextController',
                          Duration(milliseconds: 2000),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Nombre...',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color: Colors.black,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodySmallIsCustom,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.question_answer_rounded,
                            color: Colors.black,
                          ),
                          suffixIcon: _model.textFieldNombreTextController!.text
                                  .isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textFieldNombreTextController
                                        ?.clear();
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 22.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: Colors.black,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                        maxLength: 50,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        validator: _model.textFieldNombreTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 25.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'APLICAR_ENCUESTA_INICIO_COMENZAR_BTN_ON_');
                                currentUserLocationValue =
                                    await getCurrentUserLocation(
                                        defaultLocation: LatLng(0.0, 0.0));
                                HapticFeedback.lightImpact();

                                var encuestasRecordReference =
                                    EncuestasRecord.collection.doc();
                                await encuestasRecordReference
                                    .set(createEncuestasRecordData(
                                  membresia: currentUserDocument?.membresia,
                                  modeloEncuesta: widget.modelo?.reference,
                                  fechaCreacion: getCurrentTimestamp,
                                  preguntaActual:
                                      aplicarEncuestaInicioModelosPreguntasEncuestaRecord
                                          ?.reference,
                                  terminada: false,
                                  usuario: currentUserReference,
                                  posicionGPS: currentUserLocationValue,
                                  nombreEncuestado: valueOrDefault<String>(
                                    _model.textFieldNombreTextController.text,
                                    'SIN NOMBRE',
                                  ),
                                ));
                                _model.nuevaEncuesta =
                                    EncuestasRecord.getDocumentFromData(
                                        createEncuestasRecordData(
                                          membresia:
                                              currentUserDocument?.membresia,
                                          modeloEncuesta:
                                              widget.modelo?.reference,
                                          fechaCreacion: getCurrentTimestamp,
                                          preguntaActual:
                                              aplicarEncuestaInicioModelosPreguntasEncuestaRecord
                                                  ?.reference,
                                          terminada: false,
                                          usuario: currentUserReference,
                                          posicionGPS: currentUserLocationValue,
                                          nombreEncuestado:
                                              valueOrDefault<String>(
                                            _model.textFieldNombreTextController
                                                .text,
                                            'SIN NOMBRE',
                                          ),
                                        ),
                                        encuestasRecordReference);

                                context.pushNamed(
                                  AplicarEncuestaPreguntasWidget.routeName,
                                  queryParameters: {
                                    'pregunta': serializeParam(
                                      aplicarEncuestaInicioModelosPreguntasEncuestaRecord,
                                      ParamType.Document,
                                    ),
                                    'encuesta': serializeParam(
                                      _model.nuevaEncuesta,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'pregunta':
                                        aplicarEncuestaInicioModelosPreguntasEncuestaRecord,
                                    'encuesta': _model.nuevaEncuesta,
                                  },
                                );

                                safeSetState(() {});
                              },
                              text: 'Comenzar',
                              icon: FaIcon(
                                FontAwesomeIcons.play,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
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
          ),
        );
      },
    );
  }
}
