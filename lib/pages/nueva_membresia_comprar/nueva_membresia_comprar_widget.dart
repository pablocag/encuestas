import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'nueva_membresia_comprar_model.dart';
export 'nueva_membresia_comprar_model.dart';

class NuevaMembresiaComprarWidget extends StatefulWidget {
  const NuevaMembresiaComprarWidget({super.key});

  static String routeName = 'nuevaMembresiaComprar';
  static String routePath = 'nuevaMembresiaComprar';

  @override
  State<NuevaMembresiaComprarWidget> createState() =>
      _NuevaMembresiaComprarWidgetState();
}

class _NuevaMembresiaComprarWidgetState
    extends State<NuevaMembresiaComprarWidget> {
  late NuevaMembresiaComprarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevaMembresiaComprarModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'nuevaMembresiaComprar'});
    _model.membresiaIDTextController ??= TextEditingController();
    _model.membresiaIDFocusNode ??= FocusNode();

    _model.descripcionTextController ??= TextEditingController();
    _model.descripcionFocusNode ??= FocusNode();

    _model.encuestasTextController ??= TextEditingController();
    _model.encuestasFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.encuestasTextController?.text = '100';
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
              logFirebaseEvent('NUEVA_MEMBRESIA_COMPRAR_chevron_left_rou');
              context.pop();
            },
          ),
          title: Text(
            'Adquirir Membresía',
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
                        'Nueva Membresía',
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
                  child: Material(
                    color: Colors.transparent,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 15.0, 5.0, 5.0),
                                        child: TextFormField(
                                          controller:
                                              _model.membresiaIDTextController,
                                          focusNode:
                                              _model.membresiaIDFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.characters,
                                          readOnly: true,
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
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .membresiaIDTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
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
                                  ],
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
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodySmallIsCustom,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                      focusedErrorBorder: OutlineInputBorder(
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
                                    controller: _model.encuestasTextController,
                                    focusNode: _model.encuestasFocusNode,
                                    autofocus: false,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Encuestas Disponibles',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodySmallIsCustom,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                      focusedErrorBorder: OutlineInputBorder(
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
                                          fontWeight: FontWeight.bold,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Costo Normal de Membresía: \$1,900.00',
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
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 20.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/promo.png',
                                                    width: 120.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Text(
                                                  '50% PROMOCION',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Costo de su nueva Membresía: \$950.00',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'NUEVA_MEMBRESIA_COMPRAR_ADQUIRIR_BTN_ON_');
                                    currentUserLocationValue =
                                        await getCurrentUserLocation(
                                            defaultLocation: LatLng(0.0, 0.0));
                                    var _shouldSetState = false;
                                    HapticFeedback.lightImpact();
                                    final paymentResponse =
                                        await processStripePayment(
                                      context,
                                      amount: 95000,
                                      currency: 'MXN',
                                      customerEmail: currentUserEmail,
                                      customerName: currentUserDisplayName,
                                      description:
                                          'Compra de Membresía Encuestas Prometheus',
                                      allowGooglePay: true,
                                      allowApplePay: true,
                                      themeStyle: ThemeMode.system,
                                    );
                                    if (paymentResponse.paymentId == null &&
                                        paymentResponse.errorMessage != null) {
                                      showSnackbar(
                                        context,
                                        'Error: ${paymentResponse.errorMessage}',
                                      );
                                    }
                                    _model.paymentId =
                                        paymentResponse.paymentId ?? '';

                                    _shouldSetState = true;
                                    if (_model.paymentId != null &&
                                        _model.paymentId != '') {
                                      while (true) {
                                        _model.idPropuesto =
                                            await actions.crearIDMembresia();
                                        _shouldSetState = true;
                                        _model.otroIDIgual =
                                            await queryMembresiasRecordCount(
                                          queryBuilder: (membresiasRecord) =>
                                              membresiasRecord.where(
                                            'membresia_ID',
                                            isEqualTo: _model.idPropuesto,
                                          ),
                                        );
                                        _shouldSetState = true;
                                        if (_model.otroIDIgual! <= 0) {
                                          safeSetState(() {
                                            _model.membresiaIDTextController
                                                ?.text = _model.idPropuesto!;
                                          });
                                          break;
                                        }
                                      }

                                      var membresiasRecordReference =
                                          MembresiasRecord.collection.doc();
                                      await membresiasRecordReference
                                          .set(createMembresiasRecordData(
                                        membresiaID: _model
                                            .membresiaIDTextController.text,
                                        usuario: currentUserReference,
                                        descripcion: _model
                                            .descripcionTextController.text,
                                        activa: true,
                                        paquetePersonas: 10000,
                                        paqueteEncuestas: 100,
                                        usuariosDesactivados: false,
                                        logo:
                                            'https://firebasestorage.googleapis.com/v0/b/encuestas-prometheus-9tzwei.appspot.com/o/logo_Encuestas_sin_fondo.png?alt=media&token=13611e42-d18d-4bf1-ac95-f6493f0ef9e5',
                                      ));
                                      _model.nuevaMembresia =
                                          MembresiasRecord.getDocumentFromData(
                                              createMembresiasRecordData(
                                                membresiaID: _model
                                                    .membresiaIDTextController
                                                    .text,
                                                usuario: currentUserReference,
                                                descripcion: _model
                                                    .descripcionTextController
                                                    .text,
                                                activa: true,
                                                paquetePersonas: 10000,
                                                paqueteEncuestas: 100,
                                                usuariosDesactivados: false,
                                                logo:
                                                    'https://firebasestorage.googleapis.com/v0/b/encuestas-prometheus-9tzwei.appspot.com/o/logo_Encuestas_sin_fondo.png?alt=media&token=13611e42-d18d-4bf1-ac95-f6493f0ef9e5',
                                              ),
                                              membresiasRecordReference);
                                      _shouldSetState = true;
                                      _model.raizPromovido =
                                          await queryPromovidosRecordCount(
                                        queryBuilder: (promovidosRecord) =>
                                            promovidosRecord.where(
                                          'email',
                                          isEqualTo: currentUserEmail,
                                        ),
                                      );
                                      _shouldSetState = true;
                                      _model.god = await queryUsersRecordOnce(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'God',
                                          isEqualTo: true,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      if (_model.raizPromovido! > 0) {
                                        await _model.god!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'Hijos': FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                            },
                                          ),
                                        });
                                      } else {
                                        var promovidosRecordReference =
                                            PromovidosRecord.collection.doc();
                                        await promovidosRecordReference
                                            .set(createPromovidosRecordData(
                                          nombres: valueOrDefault(
                                              currentUserDocument?.nombres, ''),
                                          apPaterno: valueOrDefault(
                                              currentUserDocument?.apPaterno,
                                              ''),
                                          apMaterno: valueOrDefault(
                                              currentUserDocument?.apMaterno,
                                              ''),
                                          fechaNac:
                                              currentUserDocument?.fechaNac,
                                          email: currentUserEmail,
                                          padre: _model.god?.reference,
                                          phoneNumber: currentPhoneNumber,
                                          userRef: currentUserReference,
                                          nivel: valueOrDefault(
                                              currentUserDocument?.nivel, 0),
                                          promotor: true,
                                          membresia:
                                              _model.nuevaMembresia?.reference,
                                          photoUrl: currentUserPhoto,
                                          diaNac: functions.diaNacimiento(
                                              currentUserDocument?.fechaNac),
                                          mesNac: functions.mesNacimiento(
                                              currentUserDocument?.fechaNac),
                                          fecha: getCurrentTimestamp,
                                          gps: currentUserLocationValue,
                                        ));
                                        _model.nuevoHijoPromovido =
                                            PromovidosRecord
                                                .getDocumentFromData(
                                                    createPromovidosRecordData(
                                                      nombres: valueOrDefault(
                                                          currentUserDocument
                                                              ?.nombres,
                                                          ''),
                                                      apPaterno: valueOrDefault(
                                                          currentUserDocument
                                                              ?.apPaterno,
                                                          ''),
                                                      apMaterno: valueOrDefault(
                                                          currentUserDocument
                                                              ?.apMaterno,
                                                          ''),
                                                      fechaNac:
                                                          currentUserDocument
                                                              ?.fechaNac,
                                                      email: currentUserEmail,
                                                      padre:
                                                          _model.god?.reference,
                                                      phoneNumber:
                                                          currentPhoneNumber,
                                                      userRef:
                                                          currentUserReference,
                                                      nivel: valueOrDefault(
                                                          currentUserDocument
                                                              ?.nivel,
                                                          0),
                                                      promotor: true,
                                                      membresia: _model
                                                          .nuevaMembresia
                                                          ?.reference,
                                                      photoUrl:
                                                          currentUserPhoto,
                                                      diaNac: functions
                                                          .diaNacimiento(
                                                              currentUserDocument
                                                                  ?.fechaNac),
                                                      mesNac: functions
                                                          .mesNacimiento(
                                                              currentUserDocument
                                                                  ?.fechaNac),
                                                      fecha:
                                                          getCurrentTimestamp,
                                                      gps:
                                                          currentUserLocationValue,
                                                    ),
                                                    promovidosRecordReference);
                                        _shouldSetState = true;

                                        await _model.god!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'HijoaPromovidos':
                                                  FieldValue.arrayUnion([
                                                _model.nuevoHijoPromovido
                                                    ?.reference
                                              ]),
                                              'Hijos': FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        padre: _model.god?.reference,
                                        root: true,
                                      ));
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        isDismissible: false,
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
                                                titulo: 'Nueva Membresía',
                                                mensaje:
                                                    'Membresia creada correctamente',
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      context.goNamed(HomePageWidget.routeName);

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'Adquirir',
                                  icon: Icon(
                                    Icons.shopping_cart_checkout_rounded,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                        ],
                      ),
                    ),
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
