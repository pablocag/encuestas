import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'nueva_membresia_model.dart';
export 'nueva_membresia_model.dart';

class NuevaMembresiaWidget extends StatefulWidget {
  const NuevaMembresiaWidget({super.key});

  static String routeName = 'nuevaMembresia';
  static String routePath = 'nuevaMembresia';

  @override
  State<NuevaMembresiaWidget> createState() => _NuevaMembresiaWidgetState();
}

class _NuevaMembresiaWidgetState extends State<NuevaMembresiaWidget> {
  late NuevaMembresiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevaMembresiaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'nuevaMembresia'});
    _model.membresiaIDTextController ??= TextEditingController();
    _model.membresiaIDFocusNode ??= FocusNode();

    _model.descripcionTextController ??= TextEditingController();
    _model.descripcionFocusNode ??= FocusNode();

    _model.encuestasTextController ??= TextEditingController();
    _model.encuestasFocusNode ??= FocusNode();

    _model.personasTextController ??= TextEditingController();
    _model.personasFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.encuestasTextController?.text = '0';
          _model.personasTextController?.text = '0';
        }));
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
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NUEVA_MEMBRESIA_chevron_left_rounded_ICN');
              context.pop();
            },
          ),
          title: Text(
            'Nueva Membresía',
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
          child: SingleChildScrollView(
            controller: _model.columnController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/images/logo_Encuestas_sin_fondo.png',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Membresias',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .headlineMediumIsCustom,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 10.0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord
                          .where(
                            'tieneMembresia',
                            isEqualTo: false,
                          )
                          .orderBy('Nombres')
                          .orderBy('ApPaterno')
                          .orderBy('ApMaterno'),
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
                      List<UsersRecord> containerUsersRecordList = snapshot
                          .data!
                          .where((u) => u.uid != currentUserUid)
                          .toList();

                      return Material(
                        color: Colors.transparent,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 15.0, 5.0, 5.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .membresiaIDTextController,
                                              focusNode:
                                                  _model.membresiaIDFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.characters,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Membresía ID',
                                                hintText: '6 Caracteres',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .membresiaIDTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                if (!isAndroid && !isiOS)
                                                  TextInputFormatter
                                                      .withFunction(
                                                          (oldValue, newValue) {
                                                    return TextEditingValue(
                                                      selection:
                                                          newValue.selection,
                                                      text: newValue.text
                                                          .toCapitalization(
                                                              TextCapitalization
                                                                  .characters),
                                                    );
                                                  }),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'NUEVA_MEMBRESIA_CREAR_I_D_BTN_ON_TAP');
                                            HapticFeedback.lightImpact();
                                            while (true) {
                                              _model.idPropuesto = await actions
                                                  .crearIDMembresia();
                                              _model.otroIDIgual =
                                                  await queryMembresiasRecordCount(
                                                queryBuilder:
                                                    (membresiasRecord) =>
                                                        membresiasRecord.where(
                                                  'membresia_ID',
                                                  isEqualTo: _model.idPropuesto,
                                                ),
                                              );
                                              if (_model.otroIDIgual! <= 0) {
                                                safeSetState(() {
                                                  _model.membresiaIDTextController
                                                          ?.text =
                                                      _model.idPropuesto!;
                                                });
                                                break;
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Crear ID',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 5.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue ??= '',
                                        ),
                                        options: List<String>.from(
                                            containerUsersRecordList
                                                .map((e) => e.email)
                                                .toList()),
                                        optionLabels: containerUsersRecordList
                                            .map((e) => e.email)
                                            .toList(),
                                        onChanged: (val) => safeSetState(
                                            () => _model.dropDownValue = val),
                                        width: double.infinity,
                                        height: 50.0,
                                        searchHintTextStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        searchTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        hintText: 'Seleccione un Usuario...',
                                        searchHintText: 'Buscar...',
                                        icon: Icon(
                                          Icons.person,
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          size: 15.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 8.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 5.0),
                                      child: TextFormField(
                                        controller:
                                            _model.descripcionTextController,
                                        focusNode: _model.descripcionFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Descripción',
                                          hintText: 'Descripción de Membresía',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        validator: _model
                                            .descripcionTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 5.0),
                                      child: TextFormField(
                                        controller:
                                            _model.encuestasTextController,
                                        focusNode: _model.encuestasFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Encuestas Disponibles',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .encuestasTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 5.0),
                                      child: TextFormField(
                                        controller:
                                            _model.personasTextController,
                                        focusNode: _model.personasFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText:
                                              'Paquete de Personas Disponibles\n',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .personasTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FutureBuilder<List<UsersRecord>>(
                                future: queryUsersRecordOnce(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'email',
                                    isEqualTo: _model.dropDownValue,
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
                                          color: FlutterFlowTheme.of(context)
                                              .barra,
                                          size: 24.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord> rowUsersRecordList =
                                      snapshot.data!;
                                  final rowUsersRecord =
                                      rowUsersRecordList.isNotEmpty
                                          ? rowUsersRecordList.first
                                          : null;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 25.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'NUEVA_MEMBRESIA_PAGE_GUARDAR_BTN_ON_TAP');
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            HapticFeedback.lightImpact();

                                            var membresiasRecordReference =
                                                MembresiasRecord.collection
                                                    .doc();
                                            await membresiasRecordReference
                                                .set(createMembresiasRecordData(
                                              membresiaID: _model
                                                  .membresiaIDTextController
                                                  .text,
                                              usuario:
                                                  rowUsersRecord?.reference,
                                              descripcion: _model
                                                  .descripcionTextController
                                                  .text,
                                              activa: true,
                                              paquetePersonas: int.tryParse(
                                                  _model.personasTextController
                                                      .text),
                                              paqueteEncuestas: int.tryParse(
                                                  _model.encuestasTextController
                                                      .text),
                                              usuariosDesactivados: false,
                                              logo:
                                                  'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/users%2FGx8EE7FPD2Tl0logbuQMkNtxJkx2%2Fuploads%2F1690769417918000.png?alt=media&token=6889c8de-e9c2-447d-9de7-82441d551c98',
                                            ));
                                            _model.nuevaMembresia = MembresiasRecord
                                                .getDocumentFromData(
                                                    createMembresiasRecordData(
                                                      membresiaID: _model
                                                          .membresiaIDTextController
                                                          .text,
                                                      usuario: rowUsersRecord
                                                          ?.reference,
                                                      descripcion: _model
                                                          .descripcionTextController
                                                          .text,
                                                      activa: true,
                                                      paquetePersonas:
                                                          int.tryParse(_model
                                                              .personasTextController
                                                              .text),
                                                      paqueteEncuestas:
                                                          int.tryParse(_model
                                                              .encuestasTextController
                                                              .text),
                                                      usuariosDesactivados:
                                                          false,
                                                      logo:
                                                          'https://firebasestorage.googleapis.com/v0/b/prometheus-33a69.appspot.com/o/users%2FGx8EE7FPD2Tl0logbuQMkNtxJkx2%2Fuploads%2F1690769417918000.png?alt=media&token=6889c8de-e9c2-447d-9de7-82441d551c98',
                                                    ),
                                                    membresiasRecordReference);
                                            _model.raizPromovidoN =
                                                await queryPromovidosRecordCount(
                                              queryBuilder:
                                                  (promovidosRecord) =>
                                                      promovidosRecord.where(
                                                'email',
                                                isEqualTo:
                                                    rowUsersRecord?.email,
                                              ),
                                            );
                                            if (_model.raizPromovidoN! > 0) {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'Hijos':
                                                        FieldValue.arrayUnion([
                                                      rowUsersRecord?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              var promovidosRecordReference =
                                                  PromovidosRecord.collection
                                                      .doc();
                                              await promovidosRecordReference
                                                  .set(
                                                      createPromovidosRecordData(
                                                nombres:
                                                    rowUsersRecord?.nombres,
                                                apPaterno:
                                                    rowUsersRecord?.apPaterno,
                                                apMaterno:
                                                    rowUsersRecord?.apMaterno,
                                                fechaNac:
                                                    rowUsersRecord?.fechaNac,
                                                email: rowUsersRecord?.email,
                                                padre: currentUserReference,
                                                phoneNumber:
                                                    rowUsersRecord?.phoneNumber,
                                                userRef:
                                                    rowUsersRecord?.reference,
                                                nivel: rowUsersRecord?.nivel,
                                                promotor: true,
                                                membresia: _model
                                                    .nuevaMembresia?.reference,
                                                photoUrl:
                                                    rowUsersRecord?.photoUrl,
                                                diaNac: functions.diaNacimiento(
                                                    rowUsersRecord?.fechaNac),
                                                mesNac: functions.mesNacimiento(
                                                    rowUsersRecord?.fechaNac),
                                                fecha: getCurrentTimestamp,
                                                gps: currentUserLocationValue,
                                              ));
                                              _model.nuevoHijoPromovido =
                                                  PromovidosRecord.getDocumentFromData(
                                                      createPromovidosRecordData(
                                                        nombres: rowUsersRecord
                                                            ?.nombres,
                                                        apPaterno:
                                                            rowUsersRecord
                                                                ?.apPaterno,
                                                        apMaterno:
                                                            rowUsersRecord
                                                                ?.apMaterno,
                                                        fechaNac: rowUsersRecord
                                                            ?.fechaNac,
                                                        email: rowUsersRecord
                                                            ?.email,
                                                        padre:
                                                            currentUserReference,
                                                        phoneNumber:
                                                            rowUsersRecord
                                                                ?.phoneNumber,
                                                        userRef: rowUsersRecord
                                                            ?.reference,
                                                        nivel: rowUsersRecord
                                                            ?.nivel,
                                                        promotor: true,
                                                        membresia: _model
                                                            .nuevaMembresia
                                                            ?.reference,
                                                        photoUrl: rowUsersRecord
                                                            ?.photoUrl,
                                                        diaNac: functions
                                                            .diaNacimiento(
                                                                rowUsersRecord
                                                                    ?.fechaNac),
                                                        mesNac: functions
                                                            .mesNacimiento(
                                                                rowUsersRecord
                                                                    ?.fechaNac),
                                                        fecha:
                                                            getCurrentTimestamp,
                                                        gps:
                                                            currentUserLocationValue,
                                                      ),
                                                      promovidosRecordReference);

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'HijoaPromovidos':
                                                        FieldValue.arrayUnion([
                                                      _model.nuevoHijoPromovido
                                                          ?.reference
                                                    ]),
                                                    'Hijos':
                                                        FieldValue.arrayUnion([
                                                      rowUsersRecord?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }

                                            await rowUsersRecord!.reference
                                                .update(createUsersRecordData(
                                              padre: currentUserReference,
                                              root: true,
                                            ));
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x00000000),
                                              isDismissible: false,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: CustomAlertWidget(
                                                      titulo: 'Nueva Membresía',
                                                      mensaje:
                                                          'Membresia agregada correctamente',
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            context.pushNamed(
                                                HomePageWidget.routeName);

                                            safeSetState(() {});
                                          },
                                          text: 'Guardar',
                                          icon: Icon(
                                            Icons.save,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
