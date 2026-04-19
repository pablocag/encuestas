# Estado del proyecto — Encuestas Prometheus

**Última revisión:** 18 de abril de 2026  
**Versión de la app:** `1.0.10+10` (según `pubspec.yaml`)

## Resumen

Aplicación **Flutter** multiplataforma (Android, iOS, Web) orientada a **encuestas**, con backend **Firebase** (Auth, Firestore, Functions, Storage, Analytics, Messaging, Remote Config, Performance). El repositorio tiene el perfil típico de un proyecto exportado desde **FlutterFlow**: navegación con **GoRouter**, estado global con **Provider** (`FFAppState`), esquemas Firestore en `lib/backend/schema/` y código custom en `lib/custom_code/`.

## Stack principal

| Área | Tecnología |
|------|------------|
| Framework | Flutter (Dart SDK `>=3.0.0 <4.0.0`) |
| Navegación | go_router |
| Estado / tema | Provider, FlutterFlowTheme |
| Backend | Firebase (módulos listados en `pubspec.yaml`) |
| Pagos / suscripciones | Stripe (`flutter_stripe`), RevenueCat (`purchases_flutter`) — inicialización en `lib/main.dart` |
| Mapas / ubicación | Google Maps, Geolocator |
| Cloud Functions | Dos codebases en `firebase/`: `functions` y `custom_cloud_functions` |

## Inventario aproximado

- **~251** archivos `.dart` bajo `lib/`
- **33** pantallas (carpetas bajo `lib/pages/`)
- **Cloud Functions** duales definidas en `firebase/firebase.json` (Firestore, Storage, Hosting configurados)

## Módulos funcionales (pantallas)

Incluyen, entre otras: bienvenida y autenticación (`welcome_page`, `login`, `nueva_cuenta`, `olvide_mi_contrasena`), **inicio** (`home_page`), **encuestadores** (`mis_encuestadores`, `encuestador_detalle`, `transferir_encuestador`), **membresías** (`membresias`, `nueva_membresia`, `nueva_membresia_comprar`, `editar_membresia`, `membresia_inactiva`), **noticias y mensajes** (`noticias`, `noticia`, `nueva_noticia`, `nuevo_mensaje`, `nuevo_mensaje_root`), **notificaciones** (`notificaciones`, `notificaciones_enviadas`), **incidencias y soporte** (`incidencias`, `incidencias_root`, `nuevo_reporte`, `soporte`), **perfil y QR** (`mi_perfil`, `mi_q_r_code`), **panel tipo administración** (`god_page`, `god_catalogos`), **otros** (`network_activos`, `numeralia`, `privacidad`, `acuerdos`, `confetti`).

## Modelos de datos (Firestore)

Registros definidos en `lib/backend/schema/` (ejemplos): usuarios, encuestas, modelos de encuesta y preguntas, respuestas, promovidos, membresías, paquetes de encuestas, notificaciones, noticias, incidencias, textos, configuración, comentarios y estructuras auxiliares.

## Backend en repo

- Reglas e índices: `firebase/firestore.rules`, `firebase/firestore.indexes.json`, `firebase/storage.rules`
- Funciones Node: `firebase/functions/`, `firebase/custom_cloud_functions/` (p. ej. utilidades de usuarios en línea / logout en custom)

## Documentación existente

- `README.md` — arranque, env, CI, ramas, enlaces a docs.
- `docs/` — arquitectura FlutterFlow, despliegue, modelo de datos, auditoría Firebase, observabilidad, Analytics, costes, UX.
- `ESTADO_PROYECTO.md`, `CARACTERISTICAS_SISTEMA.md`, `PROPUESTAS_MEJORA.md` — estado, funcionalidades y checklist.

## Seguimiento operativo (rellenar por el equipo)

| Ítem | Estado |
|------|--------|
| Build CI / tests automatizados | _Pendiente de documentar_ |
| Entorno Firebase (proyecto ID, flavors) | _Pendiente de documentar_ |
| Tiendas (Play / App Store) | _Pendiente de documentar_ |
| Bloqueadores conocidos | _Ninguno listado en repo_ |

## Cómo arrancar en local (referencia)

1. Instalar [Flutter](https://docs.flutter.dev/get-started/install) en canal **stable** (recomendación FlutterFlow).
2. En la raíz del repo: `flutter pub get`
3. Configurar Firebase según los archivos de plataforma ya presentes (`google-services.json`, etc.) y credenciales del equipo.
4. Ejecutar en el dispositivo o emulador deseado: `flutter run`

---

*Este documento resume el estado del código en el repositorio; no sustituye el control de versiones ni el tablero de tareas del equipo.*
