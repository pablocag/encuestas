import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Diseos.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'welcomePage': ParameterData.none(),
  'login': ParameterData.none(),
  'olvideMiContrasena': ParameterData.none(),
  'nuevaCuenta': ParameterData.none(),
  'homePage': ParameterData.none(),
  'misEncuestadores': ParameterData.none(),
  'nuevoMensaje': ParameterData.none(),
  'notificaciones': ParameterData.none(),
  'noticias': ParameterData.none(),
  'encuestadorDetalle': (data) async => ParameterData(
        allParams: {
          'promotor': getParameter<DocumentReference>(data, 'promotor'),
        },
      ),
  'miPerfil': ParameterData.none(),
  'confetti': ParameterData.none(),
  'membresias': ParameterData.none(),
  'nuevaMembresia': ParameterData.none(),
  'incidencias': ParameterData.none(),
  'nuevaNoticia': ParameterData.none(),
  'nuevoReporte': ParameterData.none(),
  'numeralia': (data) async => ParameterData(
        allParams: {
          'membresia': await getDocumentParameter<MembresiasRecord>(
              data, 'membresia', MembresiasRecord.fromSnapshot),
        },
      ),
  'editarMembresia': (data) async => ParameterData(
        allParams: {
          'membresia': getParameter<DocumentReference>(data, 'membresia'),
        },
      ),
  'acuerdos': (data) async => ParameterData(
        allParams: {
          'texto': getParameter<DocumentReference>(data, 'texto'),
        },
      ),
  'nuevoMensajeRoot': ParameterData.none(),
  'godPage': ParameterData.none(),
  'miQRCode': ParameterData.none(),
  'notificacionesEnviadas': ParameterData.none(),
  'noticia': (data) async => ParameterData(
        allParams: {
          'noticia': await getDocumentParameter<NoticiasRecord>(
              data, 'noticia', NoticiasRecord.fromSnapshot),
        },
      ),
  'transferirEncuestador': (data) async => ParameterData(
        allParams: {
          'promotor': await getDocumentParameter<UsersRecord>(
              data, 'promotor', UsersRecord.fromSnapshot),
        },
      ),
  'incidenciasRoot': ParameterData.none(),
  'membresiaInactiva': ParameterData.none(),
  'moduloEncuestas': ParameterData.none(),
  'modelosEncuestas': ParameterData.none(),
  'nuevoModeloEncuesta': ParameterData.none(),
  'editarModeloEncuesta': (data) async => ParameterData(
        allParams: {
          'modelo': getParameter<DocumentReference>(data, 'modelo'),
        },
      ),
  'modeloPreguntasEncuesta': (data) async => ParameterData(
        allParams: {
          'modelo': await getDocumentParameter<ModelosEncuestasRecord>(
              data, 'modelo', ModelosEncuestasRecord.fromSnapshot),
        },
      ),
  'nuevaPreguntaEncuestaOpciones': (data) async => ParameterData(
        allParams: {
          'modelo': await getDocumentParameter<ModelosEncuestasRecord>(
              data, 'modelo', ModelosEncuestasRecord.fromSnapshot),
        },
      ),
  'editarPreguntaEncuesta': (data) async => ParameterData(
        allParams: {
          'pregunta':
              await getDocumentParameter<ModelosPreguntasEncuestaRecord>(data,
                  'pregunta', ModelosPreguntasEncuestaRecord.fromSnapshot),
        },
      ),
  'asignaEncuestadores': ParameterData.none(),
  'aplicarEncuesta': ParameterData.none(),
  'aplicarEncuestaInicio': (data) async => ParameterData(
        allParams: {
          'modelo': await getDocumentParameter<ModelosEncuestasRecord>(
              data, 'modelo', ModelosEncuestasRecord.fromSnapshot),
        },
      ),
  'aplicarEncuestaPreguntas': (data) async => ParameterData(
        allParams: {
          'pregunta':
              await getDocumentParameter<ModelosPreguntasEncuestaRecord>(data,
                  'pregunta', ModelosPreguntasEncuestaRecord.fromSnapshot),
          'encuesta': await getDocumentParameter<EncuestasRecord>(
              data, 'encuesta', EncuestasRecord.fromSnapshot),
        },
      ),
  'encuestasAplicadas': ParameterData.none(),
  'encuestaTerminada': (data) async => ParameterData(
        allParams: {
          'encuesta': await getDocumentParameter<EncuestasRecord>(
              data, 'encuesta', EncuestasRecord.fromSnapshot),
        },
      ),
  'resultadosEncuestas': ParameterData.none(),
  'resultadosEncuestaAplicada': (data) async => ParameterData(
        allParams: {
          'modelo': await getDocumentParameter<ModelosEncuestasRecord>(
              data, 'modelo', ModelosEncuestasRecord.fromSnapshot),
        },
      ),
  'encuestasAplicadasRoot': ParameterData.none(),
  'encuestasAplicadasPorModelo': (data) async => ParameterData(
        allParams: {
          'modelo': getParameter<DocumentReference>(data, 'modelo'),
        },
      ),
  'mapaModeloEncuesta': (data) async => ParameterData(
        allParams: {
          'modelo': await getDocumentParameter<ModelosEncuestasRecord>(
              data, 'modelo', ModelosEncuestasRecord.fromSnapshot),
        },
      ),
  'mapaEncuestaTerminada': (data) async => ParameterData(
        allParams: {
          'encuesta': await getDocumentParameter<EncuestasRecord>(
              data, 'encuesta', EncuestasRecord.fromSnapshot),
        },
      ),
  'encuestasComprar': ParameterData.none(),
  'godCatalogos': ParameterData.none(),
  'networkActivos': ParameterData.none(),
  'privacidad': ParameterData.none(),
  'nuevaMembresiaComprar': ParameterData.none(),
  'soporte': (data) async => ParameterData(
        allParams: {
          'texto': getParameter<DocumentReference>(data, 'texto'),
        },
      ),
  'nuevaPreguntaEncuestaLibre': (data) async => ParameterData(
        allParams: {
          'modelo': await getDocumentParameter<ModelosEncuestasRecord>(
              data, 'modelo', ModelosEncuestasRecord.fromSnapshot),
        },
      ),
  'moduloPreguntasEncuestas': (data) async => ParameterData(
        allParams: {
          'modelo': await getDocumentParameter<ModelosEncuestasRecord>(
              data, 'modelo', ModelosEncuestasRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
