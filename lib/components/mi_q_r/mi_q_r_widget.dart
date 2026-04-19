import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'mi_q_r_model.dart';
export 'mi_q_r_model.dart';

class MiQRWidget extends StatefulWidget {
  const MiQRWidget({super.key});

  @override
  State<MiQRWidget> createState() => _MiQRWidgetState();
}

class _MiQRWidgetState extends State<MiQRWidget> {
  late MiQRModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiQRModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          controller: _model.columnController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                child: Text(
                  'Mi Código QR ',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleMediumIsCustom,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            child: custom_widgets.PrettyQRCode(
                              width: 200.0,
                              height: 200.0,
                              texto: currentUserUid,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AuthUserStreamWidget(
                builder: (context) => Text(
                  valueOrDefault<bool>(currentUserDocument?.activo, false)
                      ? 'ACTIVO'
                      : 'INACTIVO',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
