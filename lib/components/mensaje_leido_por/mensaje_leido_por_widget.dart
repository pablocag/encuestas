import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'mensaje_leido_por_model.dart';
export 'mensaje_leido_por_model.dart';

class MensajeLeidoPorWidget extends StatefulWidget {
  const MensajeLeidoPorWidget({
    super.key,
    required this.mensaje,
  });

  final DocumentReference? mensaje;

  @override
  State<MensajeLeidoPorWidget> createState() => _MensajeLeidoPorWidgetState();
}

class _MensajeLeidoPorWidgetState extends State<MensajeLeidoPorWidget> {
  late MensajeLeidoPorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeLeidoPorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: StreamBuilder<NotificacionesRecord>(
        stream: NotificacionesRecord.getDocument(widget.mensaje!),
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

          final containerNotificacionesRecord = snapshot.data!;

          return Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.5,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent3,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: SingleChildScrollView(
                controller: _model.columnController1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Text(
                        'Mensaje leído por:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 15.0),
                      child: Builder(
                        builder: (context) {
                          final lista = containerNotificacionesRecord.leidoPor
                              .map((e) => e.id)
                              .toList();

                          return SingleChildScrollView(
                            controller: _model.columnController2,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(lista.length, (listaIndex) {
                                final listaItem = lista[listaIndex];
                                return Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: FutureBuilder<List<UsersRecord>>(
                                    future: queryUsersRecordOnce(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(
                                        'uid',
                                        isEqualTo:
                                            listaItem != '' ? listaItem : null,
                                      ),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
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
                                        );
                                      }
                                      List<UsersRecord> rowUsersRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final rowUsersRecord =
                                          rowUsersRecordList.isNotEmpty
                                              ? rowUsersRecordList.first
                                              : null;

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              '${rowUsersRecord?.nombres} ${rowUsersRecord?.apPaterno} ${rowUsersRecord?.apMaterno}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
