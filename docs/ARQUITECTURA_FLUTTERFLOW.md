# Arquitectura y deuda FlutterFlow

Guía para el equipo: qué tocar con seguridad, cómo reducir acoplamiento a FlutterFlow y cómo orientarse en rutas y dependencias.

---

## 1. Mapa de carpetas (generado vs manual)

| Área | Ruta | Tratamiento recomendado |
|------|------|-------------------------|
| **FlutterFlow (regenerar con cuidado)** | `lib/flutter_flow/` | Navegación base, tema, utilidades, i18n. Evitar cambios grandes manuales; documentar cualquier edición imprescindible. `nav.dart` concentra rutas. |
| **FlutterFlow (páginas)** | `lib/pages/`, `lib/encuestas/` | Widgets de pantalla; suelen sobrescribirse al re-exportar desde FlutterFlow. Lógica de negocio **no** debería crecer aquí. |
| **Esquema y backend** | `lib/backend/` | Modelos Firestore, storage, funciones, Stripe. Mezcla generada y uso; revisar diffs al actualizar. |
| **Auth** | `lib/auth/` | Integración Firebase Auth; puede requerir ajustes manuales (p. ej. borrado de cuenta). |
| **Código custom estable** | `lib/custom_code/actions/`, `lib/custom_code/widgets/` | **Zona preferida** para lógica y UI reutilizable fuera del canvas FlutterFlow. Ya analizado por el CI. |
| **Configuración propia** | `lib/config/` | Variables de entorno (`runtime_env.dart`), sin acoplar a FlutterFlow. |
| **Tests** | `test/` | Pruebas que no importen `main.dart` salvo mocks explícitos de Firebase. |
| **Herramientas** | `tool/` | Scripts de CI local. |
| **Firebase** | `firebase/` | Reglas, índices, Functions (Node). |
| **Plataformas** | `android/`, `ios/`, `web/` | Nativos; revisar tras upgrades de Flutter o plugins. |

### Principio anti-corruption (ítem 7)

1. **Entrada/salida del dominio** vía acciones y widgets en `lib/custom_code/`, no lógica pesada en `*_model.dart` / `*_widget.dart` generados si se puede evitar.
2. **Persistencia**: preferir `backend/` y Cloud Functions para reglas; el cliente solo orquesta.
3. **Candidatos a extraer a paquete o capa testeable** (evolución gradual):
   - Exportación CSV: `download_encuestas_as_c_s_v.dart`, `download_modelo_encuesta_as_c_s_v.dart` (I/O + formato → funciones puras `String buildCsv(...)` testeables).
   - Árbol promotores/promovidos: `update_hijos_*.dart`, `contar_nodos_*.dart` (reglas de actualización → clase o funciones con tests unitarios y `FakeFirebaseFirestore` cuando toque).
4. Tras un **export FlutterFlow**, revisar conflictos en `custom_code` y `auth/` antes de mergear.

---

## 2. Dependencias (`pubspec.yaml`) — inventario y política (ítem 8)

Muchas entradas están **fijadas en versión explícita** (patrón FlutterFlow) junto a dependencias **transitivas elevadas** a directas (`*_platform_interface`, `*_web`, etc.) para estabilizar resolución. Eso aumenta el tamaño del grafo pero reduce sorpresas en build.

### Agrupación funcional (dependencias principales)

| Grupo | Paquetes (ejemplos) |
|-------|---------------------|
| **Firebase** | `firebase_core`, `firebase_auth`, `cloud_firestore`, `cloud_functions`, `firebase_storage`, `firebase_messaging`, `firebase_analytics`, `firebase_remote_config`, `firebase_performance`, variantes `*_web` / plataforma |
| **Pagos** | `flutter_stripe`, `flutter_stripe_web`, `stripe_*`, `purchases_flutter` |
| **Mapas y ubicación** | `google_maps_flutter`, `google_maps`, `geolocator`, `map_launcher` |
| **Auth social / dispositivo** | `google_sign_in`, `sign_in_with_apple`, `local_auth` |
| **UI / animación** | `flutter_animate`, `auto_size_text`, `cached_network_image`, `data_table_2`, `flutter_slidable`, `font_awesome_flutter`, `percent_indicator`, etc. |
| **Medios** | `image_picker`, `file_picker`, `video_player`, `chewie`, `photo_view` |
| **Datos / util** | `provider`, `rxdart`, `collection`, `intl`, `csv`, `json_path`, `sqflite`, `shared_preferences` |
| **Red / archivos** | `url_launcher`, `share_plus`, `download`, `internet_connection_checker_plus`, `path_provider` |
| **Notificaciones** | `flutter_local_notifications`, mensajería Firebase |
| **Otros** | `go_router`, `permission_handler`, `geolocator`, `no_screenshot`, `dropdown_button2` (git FlutterFlow), etc. |

### Política de actualización

1. Cada **1–2 meses** (o tras un release mayor): `dart pub outdated` y revisar solo paquetes **directos** que no sean pin de FlutterFlow sin export equivalente.
2. Actualizar **Firebase** y **Stripe** en bloque probando auth, Firestore y un pago de prueba.
3. Tras `flutter pub upgrade`, ejecutar `.\tool\ci.ps1` (o `./tool/ci.sh`) y prueba manual en Android + iOS (o al menos un target).
4. No eliminar dependencias del `pubspec` “a ojo”: FlutterFlow puede referenciarlas indirectamente desde código generado.

---

## 3. Mapa de rutas GoRouter (ítem 9)

Definición única: `lib/flutter_flow/nav/nav.dart` (`createRouter`). Las URLs usan **path strategy** (`usePathUrlStrategy()` en `main.dart`); segmentos hijos dependen del árbol de `FFRoute` (raíz `/` y rutas relativas bajo el shell inicial).

Cada pantalla expone `static String routeName` y `routePath` en su `*_widget.dart`. La tabla agrupa por **feature**; la columna **path** es el `routePath` (navegación típica bajo la app). La columna **Auth** refleja si la entrada correspondiente en `nav.dart` incluye `requireAuth: true` (no todas las rutas del módulo encuestas lo tienen; revisar el archivo para enlaces profundos y hardening).

### Autenticación y acceso público

| Pantalla | routePath | Auth |
|----------|-----------|------|
| Bienvenida | `welcomePage` | No |
| Login | `login` | No |
| Nueva cuenta | `nuevaCuenta` | No |
| Olvidé contraseña | `olvideMiContrasena` | No |

### Inicio, perfil y utilidades

| Pantalla | routePath | Auth |
|----------|-----------|------|
| Home | `homePage` | Sí |
| Mi perfil | `miPerfil` | Sí |
| Mi QR | `miQRCode` | Sí |
| Numeralia | `numeralia` | Sí |
| Confetti | `confetti` | Sí |
| Privacidad | `privacidad` | No (según `nav.dart`) |
| Acuerdos | `acuerdos` | Sí |

### Encuestadores y red

| Pantalla | routePath | Auth |
|----------|-----------|------|
| Mis encuestadores | `misEncuestadores` | Sí |
| Detalle encuestador | `encuestadorDetalle` | Sí |
| Transferir encuestador | `transferirEncuestador` | Sí |
| Network activos | `networkActivos` | Sí |

### Membresías

| Pantalla | routePath | Auth |
|----------|-----------|------|
| Membresías | `membresias` | Sí |
| Nueva membresía | `nuevaMembresia` | Sí |
| Editar membresía | `editarMembresia` | Sí |
| Membresía inactiva | `membresiaInactiva` | Sí |
| Nueva membresía comprar | `nuevaMembresiaComprar` | Sí |

### Comunicación

| Pantalla | routePath | Auth |
|----------|-----------|------|
| Notificaciones | `notificaciones` | Sí |
| Notificaciones enviadas | `notificacionesEnviadas` | Sí |
| Noticias | `noticias` | Sí |
| Noticia (detalle) | `noticia` | Sí |
| Nueva noticia | `nuevaNoticia` | Sí |
| Nuevo mensaje | `nuevoMensaje` | Sí |
| Nuevo mensaje (root) | `nuevoMensajeRoot` | Sí |

### Incidencias y soporte

| Pantalla | routePath | Auth |
|----------|-----------|------|
| Incidencias | `incidencias` | Sí |
| Incidencias root | `incidenciasRoot` | Sí |
| Nuevo reporte | `nuevoReporte` | Sí |
| Soporte | `soporte` | Sí |

### Administración “God”

| Pantalla | routePath | Auth |
|----------|-----------|------|
| God page | `godPage` | Sí |
| God catálogos | `godCatalogos` | Sí |

### Módulo encuestas (diseño, aplicación, resultados, mapas, compra)

| Pantalla | routePath | `requireAuth` en nav |
|----------|-----------|----------------------|
| Módulo encuestas | `moduloEncuestas` | No (revisar) |
| Modelos encuestas | `modelosEncuestas` | No (revisar) |
| Nuevo modelo | `nuevoModeloEncuesta` | No (revisar) |
| Editar modelo | `editarModeloEncuesta` | No (revisar) |
| Preguntas del modelo | `modeloPreguntasEncuesta` | No (revisar) |
| Módulo preguntas | `moduloPreguntasEncuestas` | No (revisar) |
| Nueva pregunta (opciones) | `nuevaPreguntaEncuestaOpciones` | Sí |
| Nueva pregunta (libre) | `nuevaPreguntaEncuestaLibre` | Sí |
| Editar pregunta | `editarPreguntaEncuesta` | Sí |
| Asigna encuestadores | `asignaEncuestadores` | Sí |
| Aplicar encuesta | `aplicarEncuesta` | No (revisar) |
| Aplicar inicio | `aplicarEncuestaInicio` | No (revisar) |
| Aplicar preguntas | `aplicarEncuestaPreguntas` | No (revisar) |
| Encuestas aplicadas | `encuestasAplicadas` | No (revisar) |
| Encuesta terminada | `encuestaTerminada` | No (revisar) |
| Resultados encuestas | `resultadosEncuestas` | No (revisar) |
| Resultado encuesta aplicada | `resultadosEncuestaAplicada` | No (revisar) |
| Aplicadas root | `encuestasAplicadasRoot` | No (revisar) |
| Aplicadas por modelo | `encuestasAplicadasPorModelo` | No (revisar) |
| Mapa modelo | `mapaModeloEncuesta` | No (revisar) |
| Mapa encuesta terminada | `mapaEncuestaTerminada` | No (revisar) |
| Comprar encuestas | `encuestasComprar` | Sí |

> **Nota:** Las filas marcadas “No (revisar)” no declaran `requireAuth: true` en `nav.dart` al momento de generar este documento; conviene unificar criterio con el equipo de producto y reglas Firestore.

### Cómo ampliar o depurar rutas

1. Buscar `FFRoute(` en `nav.dart` y el `builder` asociado.
2. Confirmar `routeName` / `routePath` en el `*_widget.dart` correspondiente.
3. Para enlaces profundos o web, probar la URL completa en el navegador tras un hot restart.

---

*Última revisión alineada con el checklist de propuestas de mejora (sección Arquitectura FlutterFlow). Ver también [DESPLEGUE.md](DESPLEGUE.md) y [MODELO_DATOS.md](MODELO_DATOS.md).*
