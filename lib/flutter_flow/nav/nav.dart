import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePageWidget() : WelcomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomePageWidget()
              : WelcomePageWidget(),
          routes: [
            FFRoute(
              name: WelcomePageWidget.routeName,
              path: WelcomePageWidget.routePath,
              builder: (context, params) => WelcomePageWidget(),
            ),
            FFRoute(
              name: LoginWidget.routeName,
              path: LoginWidget.routePath,
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: OlvideMiContrasenaWidget.routeName,
              path: OlvideMiContrasenaWidget.routePath,
              builder: (context, params) => OlvideMiContrasenaWidget(),
            ),
            FFRoute(
              name: NuevaCuentaWidget.routeName,
              path: NuevaCuentaWidget.routePath,
              builder: (context, params) => NuevaCuentaWidget(),
            ),
            FFRoute(
              name: HomePageWidget.routeName,
              path: HomePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => HomePageWidget(),
            ),
            FFRoute(
              name: MisEncuestadoresWidget.routeName,
              path: MisEncuestadoresWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MisEncuestadoresWidget(),
            ),
            FFRoute(
              name: NuevoMensajeWidget.routeName,
              path: NuevoMensajeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NuevoMensajeWidget(),
            ),
            FFRoute(
              name: NotificacionesWidget.routeName,
              path: NotificacionesWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NotificacionesWidget(),
            ),
            FFRoute(
              name: NoticiasWidget.routeName,
              path: NoticiasWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NoticiasWidget(),
            ),
            FFRoute(
              name: EncuestadorDetalleWidget.routeName,
              path: EncuestadorDetalleWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EncuestadorDetalleWidget(
                promotor: params.getParam(
                  'promotor',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: MiPerfilWidget.routeName,
              path: MiPerfilWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MiPerfilWidget(),
            ),
            FFRoute(
              name: ConfettiWidget.routeName,
              path: ConfettiWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ConfettiWidget(),
            ),
            FFRoute(
              name: MembresiasWidget.routeName,
              path: MembresiasWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MembresiasWidget(),
            ),
            FFRoute(
              name: NuevaMembresiaWidget.routeName,
              path: NuevaMembresiaWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NuevaMembresiaWidget(),
            ),
            FFRoute(
              name: IncidenciasWidget.routeName,
              path: IncidenciasWidget.routePath,
              requireAuth: true,
              builder: (context, params) => IncidenciasWidget(),
            ),
            FFRoute(
              name: NuevaNoticiaWidget.routeName,
              path: NuevaNoticiaWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NuevaNoticiaWidget(),
            ),
            FFRoute(
              name: NuevoReporteWidget.routeName,
              path: NuevoReporteWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NuevoReporteWidget(),
            ),
            FFRoute(
              name: NumeraliaWidget.routeName,
              path: NumeraliaWidget.routePath,
              requireAuth: true,
              asyncParams: {
                'membresia':
                    getDoc(['membresias'], MembresiasRecord.fromSnapshot),
              },
              builder: (context, params) => NumeraliaWidget(
                membresia: params.getParam(
                  'membresia',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EditarMembresiaWidget.routeName,
              path: EditarMembresiaWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EditarMembresiaWidget(
                membresia: params.getParam(
                  'membresia',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['membresias'],
                ),
              ),
            ),
            FFRoute(
              name: AcuerdosWidget.routeName,
              path: AcuerdosWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AcuerdosWidget(
                texto: params.getParam(
                  'texto',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['textos'],
                ),
              ),
            ),
            FFRoute(
              name: NuevoMensajeRootWidget.routeName,
              path: NuevoMensajeRootWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NuevoMensajeRootWidget(),
            ),
            FFRoute(
              name: GodPageWidget.routeName,
              path: GodPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => GodPageWidget(),
            ),
            FFRoute(
              name: MiQRCodeWidget.routeName,
              path: MiQRCodeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MiQRCodeWidget(),
            ),
            FFRoute(
              name: NotificacionesEnviadasWidget.routeName,
              path: NotificacionesEnviadasWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NotificacionesEnviadasWidget(),
            ),
            FFRoute(
              name: NoticiaWidget.routeName,
              path: NoticiaWidget.routePath,
              requireAuth: true,
              asyncParams: {
                'noticia': getDoc(['noticias'], NoticiasRecord.fromSnapshot),
              },
              builder: (context, params) => NoticiaWidget(
                noticia: params.getParam(
                  'noticia',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: TransferirEncuestadorWidget.routeName,
              path: TransferirEncuestadorWidget.routePath,
              requireAuth: true,
              asyncParams: {
                'promotor': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => TransferirEncuestadorWidget(
                promotor: params.getParam(
                  'promotor',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: IncidenciasRootWidget.routeName,
              path: IncidenciasRootWidget.routePath,
              requireAuth: true,
              builder: (context, params) => IncidenciasRootWidget(),
            ),
            FFRoute(
              name: MembresiaInactivaWidget.routeName,
              path: MembresiaInactivaWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MembresiaInactivaWidget(),
            ),
            FFRoute(
              name: ModuloEncuestasWidget.routeName,
              path: ModuloEncuestasWidget.routePath,
              builder: (context, params) => ModuloEncuestasWidget(),
            ),
            FFRoute(
              name: ModelosEncuestasWidget.routeName,
              path: ModelosEncuestasWidget.routePath,
              builder: (context, params) => ModelosEncuestasWidget(),
            ),
            FFRoute(
              name: NuevoModeloEncuestaWidget.routeName,
              path: NuevoModeloEncuestaWidget.routePath,
              builder: (context, params) => NuevoModeloEncuestaWidget(),
            ),
            FFRoute(
              name: EditarModeloEncuestaWidget.routeName,
              path: EditarModeloEncuestaWidget.routePath,
              builder: (context, params) => EditarModeloEncuestaWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['modelosEncuestas'],
                ),
              ),
            ),
            FFRoute(
              name: ModeloPreguntasEncuestaWidget.routeName,
              path: ModeloPreguntasEncuestaWidget.routePath,
              asyncParams: {
                'modelo': getDoc(
                    ['modelosEncuestas'], ModelosEncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => ModeloPreguntasEncuestaWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: NuevaPreguntaEncuestaOpcionesWidget.routeName,
              path: NuevaPreguntaEncuestaOpcionesWidget.routePath,
              requireAuth: true,
              asyncParams: {
                'modelo': getDoc(
                    ['modelosEncuestas'], ModelosEncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => NuevaPreguntaEncuestaOpcionesWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EditarPreguntaEncuestaWidget.routeName,
              path: EditarPreguntaEncuestaWidget.routePath,
              requireAuth: true,
              asyncParams: {
                'pregunta': getDoc(['modelosPreguntasEncuesta'],
                    ModelosPreguntasEncuestaRecord.fromSnapshot),
              },
              builder: (context, params) => EditarPreguntaEncuestaWidget(
                pregunta: params.getParam(
                  'pregunta',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: AsignaEncuestadoresWidget.routeName,
              path: AsignaEncuestadoresWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AsignaEncuestadoresWidget(),
            ),
            FFRoute(
              name: AplicarEncuestaWidget.routeName,
              path: AplicarEncuestaWidget.routePath,
              builder: (context, params) => AplicarEncuestaWidget(),
            ),
            FFRoute(
              name: AplicarEncuestaInicioWidget.routeName,
              path: AplicarEncuestaInicioWidget.routePath,
              asyncParams: {
                'modelo': getDoc(
                    ['modelosEncuestas'], ModelosEncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => AplicarEncuestaInicioWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: AplicarEncuestaPreguntasWidget.routeName,
              path: AplicarEncuestaPreguntasWidget.routePath,
              asyncParams: {
                'pregunta': getDoc(['modelosPreguntasEncuesta'],
                    ModelosPreguntasEncuestaRecord.fromSnapshot),
                'encuesta': getDoc(['encuestas'], EncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => AplicarEncuestaPreguntasWidget(
                pregunta: params.getParam(
                  'pregunta',
                  ParamType.Document,
                ),
                encuesta: params.getParam(
                  'encuesta',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EncuestasAplicadasWidget.routeName,
              path: EncuestasAplicadasWidget.routePath,
              builder: (context, params) => EncuestasAplicadasWidget(),
            ),
            FFRoute(
              name: EncuestaTerminadaWidget.routeName,
              path: EncuestaTerminadaWidget.routePath,
              asyncParams: {
                'encuesta': getDoc(['encuestas'], EncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => EncuestaTerminadaWidget(
                encuesta: params.getParam(
                  'encuesta',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: ResultadosEncuestasWidget.routeName,
              path: ResultadosEncuestasWidget.routePath,
              builder: (context, params) => ResultadosEncuestasWidget(),
            ),
            FFRoute(
              name: ResultadosEncuestaAplicadaWidget.routeName,
              path: ResultadosEncuestaAplicadaWidget.routePath,
              asyncParams: {
                'modelo': getDoc(
                    ['modelosEncuestas'], ModelosEncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => ResultadosEncuestaAplicadaWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EncuestasAplicadasRootWidget.routeName,
              path: EncuestasAplicadasRootWidget.routePath,
              builder: (context, params) => EncuestasAplicadasRootWidget(),
            ),
            FFRoute(
              name: EncuestasAplicadasPorModeloWidget.routeName,
              path: EncuestasAplicadasPorModeloWidget.routePath,
              builder: (context, params) => EncuestasAplicadasPorModeloWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['modelosEncuestas'],
                ),
              ),
            ),
            FFRoute(
              name: MapaModeloEncuestaWidget.routeName,
              path: MapaModeloEncuestaWidget.routePath,
              asyncParams: {
                'modelo': getDoc(
                    ['modelosEncuestas'], ModelosEncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => MapaModeloEncuestaWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: MapaEncuestaTerminadaWidget.routeName,
              path: MapaEncuestaTerminadaWidget.routePath,
              asyncParams: {
                'encuesta': getDoc(['encuestas'], EncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => MapaEncuestaTerminadaWidget(
                encuesta: params.getParam(
                  'encuesta',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: EncuestasComprarWidget.routeName,
              path: EncuestasComprarWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EncuestasComprarWidget(),
            ),
            FFRoute(
              name: GodCatalogosWidget.routeName,
              path: GodCatalogosWidget.routePath,
              requireAuth: true,
              builder: (context, params) => GodCatalogosWidget(),
            ),
            FFRoute(
              name: NetworkActivosWidget.routeName,
              path: NetworkActivosWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NetworkActivosWidget(),
            ),
            FFRoute(
              name: PrivacidadWidget.routeName,
              path: PrivacidadWidget.routePath,
              builder: (context, params) => PrivacidadWidget(),
            ),
            FFRoute(
              name: NuevaMembresiaComprarWidget.routeName,
              path: NuevaMembresiaComprarWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NuevaMembresiaComprarWidget(),
            ),
            FFRoute(
              name: SoporteWidget.routeName,
              path: SoporteWidget.routePath,
              builder: (context, params) => SoporteWidget(
                texto: params.getParam(
                  'texto',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['textos'],
                ),
              ),
            ),
            FFRoute(
              name: NuevaPreguntaEncuestaLibreWidget.routeName,
              path: NuevaPreguntaEncuestaLibreWidget.routePath,
              requireAuth: true,
              asyncParams: {
                'modelo': getDoc(
                    ['modelosEncuestas'], ModelosEncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => NuevaPreguntaEncuestaLibreWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: ModuloPreguntasEncuestasWidget.routeName,
              path: ModuloPreguntasEncuestasWidget.routePath,
              asyncParams: {
                'modelo': getDoc(
                    ['modelosEncuestas'], ModelosEncuestasRecord.fromSnapshot),
              },
              builder: (context, params) => ModuloPreguntasEncuestasWidget(
                modelo: params.getParam(
                  'modelo',
                  ParamType.Document,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/welcomePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 200),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
