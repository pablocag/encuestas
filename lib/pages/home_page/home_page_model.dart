import '/backend/backend.dart';
import '/components/dark_light_switch_large/dark_light_switch_large_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? usuarioQR;

  bool? internet = true;

  bool pinValido = false;

  String? pinCode = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checarMembresiaActiva] action in homePage widget.
  bool? membresiaActiva;
  // Stores action output result for [Backend Call - Read Document] action in homePage widget.
  UsersRecord? padrePromotor;
  // Stores action output result for [Firestore Query - Query a collection] action in homePage widget.
  PromovidosRecord? yoPromovido;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - checkInternetConnection] action in homePage widget.
  bool? hayInternet;
  // State field(s) for ColumnQureyPadre widget.
  ScrollController? columnQureyPadreScrollController;
  // Stores action output result for [Firestore Query - Query a collection] action in Image widget.
  List<UsersRecord>? alertaTodos;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for PinCodePromotor widget.
  TextEditingController? pinCodePromotor;
  FocusNode? pinCodePromotorFocusNode;
  String? Function(BuildContext, String?)? pinCodePromotorValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? userPromotor;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PromovidosRecord? nuevoPromovido;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonMembresia widget.
  PromovidosRecord? promovidoEncontrado2;
  // Stores action output result for [Custom Action - checarMembresiaActiva] action in ButtonMembresia widget.
  bool? membresiaActiva11;
  // Stores action output result for [Custom Action - checarMembresiaActiva] action in ButtonMembresia widget.
  bool? membresiaActiva2;
  // Stores action output result for [Custom Action - checarMembresiaActiva] action in ButtonMembresia widget.
  bool? membresiaActiva3;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Model for DarkLightSwitchLarge component.
  late DarkLightSwitchLargeModel darkLightSwitchLargeModel;

  @override
  void initState(BuildContext context) {
    columnQureyPadreScrollController = ScrollController();
    columnController1 = ScrollController();
    pinCodePromotor = TextEditingController();
    columnController2 = ScrollController();
    darkLightSwitchLargeModel =
        createModel(context, () => DarkLightSwitchLargeModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    columnQureyPadreScrollController?.dispose();
    columnController1?.dispose();
    pinCodePromotorFocusNode?.dispose();
    pinCodePromotor?.dispose();

    columnController2?.dispose();
    darkLightSwitchLargeModel.dispose();
  }
}
