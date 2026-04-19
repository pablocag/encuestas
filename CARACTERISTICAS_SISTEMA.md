# Características del sistema — Encuestas Prometheus

Documento funcional derivado del código (`lib/`, `firebase/`). Describe **qué puede hacer** la aplicación; no sustituye manuales de usuario ni contratos de API.

---

## 1. Propósito general

Plataforma móvil y web para **gestionar encuestas**, **organizar encuestadores**, operar una **red de promoción** (promotores / promovidos), administrar **membresías** y **paquetes de encuestas**, difundir **noticias** y **mensajes**, registrar **incidencias**, y ofrecer **herramientas de administración** avanzadas (“god”) integradas con **Firebase** y pagos (**Stripe**, **RevenueCat**).

---

## 2. Autenticación y cuenta

- Inicio de sesión y registro (pantallas dedicadas en `lib/pages/`).
- Recuperación de contraseña.
- Integración con **Firebase Auth** con soporte, según el código, para: correo/contraseña, **Google**, **Apple**, **anónimo**, **JWT**, **GitHub** y **teléfono** (SMS / flujo web).
- Posibilidad de eliminar la cuenta (con manejo de reautenticación cuando Firebase lo exige).

---

## 3. Módulo de encuestas

Flujo completo en `lib/encuestas/`:

| Área | Característica |
|------|----------------|
| Diseño | Módulo de encuestas, **modelos** de encuesta, creación y edición de modelos. |
| Preguntas | Preguntas con **opciones** y preguntas de **texto libre**; edición y módulo agrupado de preguntas. |
| Asignación | Asignación de **encuestadores** a encuestas / modelos. |
| Aplicación | Inicio del cuestionario, pantalla de preguntas, finalización y pantalla de encuesta terminada. |
| Seguimiento | Listado de **encuestas aplicadas**, vistas por modelo y raíz de aplicadas. |
| Resultados | Resultados agregados y **resultado por encuesta aplicada**. |
| Geografía | **Mapas** asociados al modelo de encuesta y a encuestas terminadas (ubicación en el ciclo de la encuesta). |
| Comercial | Compra de **encuestas** / paquetes (`encuestas_comprar`). |

**Operaciones de datos (acciones custom):** exportación de encuestas o modelos a **CSV**, borrado por lotes de respuestas, clonado por lotes de modelos de respuestas, borrado por lotes de modelos de respuestas.

---

## 4. Encuestadores y red

- Listado y **detalle** de encuestadores.
- **Transferencia** de encuestador entre responsables o contextos (pantalla dedicada).
- Contadores y actualización de relaciones en árbol: **hijos de promotores** y **hijos de promovidos** (varias acciones `update_hijos_*`).
- Herramientas administrativas: listado de red, **actualización masiva de promotores/promovidos** (incl. coordenadas GPS), **desactivar / reactivar** promotores, descarga de **catálogo**, conteo de nodos de promotores y promovidos.
- Pantalla de **red / usuarios activos** en línea (`network_activos`).

---

## 5. Membresías

- Alta, edición y listado de **membresías**.
- Flujos de **nueva membresía** y **compra** (integración con pagos en el proyecto).
- Estado de **membresía inactiva** con pantalla propia.
- Lógica auxiliar: comprobar membresía activa, generar identificadores de membresía, **PIN**, ajustar cupos de personas en membresía, integración con tokens (acción dedicada).

---

## 6. Comunicación y contenido

- **Noticias**: listado, detalle y creación de noticia.
- **Mensajes**: envío y raíz de mensajes (flujos `nuevo_mensaje` / `nuevo_mensaje_root`).
- **Notificaciones**: bandeja de notificaciones y **notificaciones enviadas**.
- **Push** (FCM en Android/iOS): registro de token vía Cloud Function, disparo de notificaciones desde la app; **notificaciones locales** (acción custom).
- **Soporte** e **incidencias** (usuario y vista raíz para gestión).

---

## 7. Perfil, legal y utilidades

- **Perfil** de usuario y **código QR** personal (`mi_q_r_code`).
- **Privacidad** y **acuerdos** (pantallas de políticas / términos).
- **Numeralia** (presentación de cifras / estadísticas en app).
- **Confetti** (experiencia visual de celebración).
- Widgets custom: QR decorado, texto “leer más”, imagen desde Base64, overlay de confeti.

---

## 8. Seguridad y experiencia de dispositivo

- Bloqueo de **orientación** (vertical u horizontal) según pantalla.
- **Desactivación de capturas de pantalla** en flujos sensibles (`no_screenshot` / acción custom).
- **Autenticación local** (biometría / PIN del dispositivo) disponible en dependencias del proyecto.
- Comprobación de **conectividad** antes de operaciones críticas.

---

## 9. Integraciones de backend y analítica

- **Firestore** como base de datos principal (colecciones modeladas en `lib/backend/schema/`: usuarios, encuestas, modelos, preguntas, respuestas, promovidos, membresías, paquetes, notificaciones, noticias, incidencias, configuración, textos, etc.).
- **Cloud Functions** (incl. funciones custom) y llamadas desde la app.
- **Firebase Storage** para archivos.
- **Analytics**, **Performance**, **Remote Config** y **Messaging** declarados en dependencias.
- **Google Maps** y **geolocalización** para mapas y contexto espacial en encuestas.
- **Stripe** para pagos en app; **RevenueCat** para suscripciones / compras in-app (inicialización en `main.dart`).

---

## 10. Rol administrativo (“God”)

- Páginas **God** para operaciones de catálogo y mantenimiento de red a escala (alineado con las acciones custom `god_*`).

---

## 11. Plataformas

La base de código está preparada para **Android**, **iOS** y **Web** (Flutter + plugins condicionales; push FCM según plataforma).

---

## 12. Alcance no inferido solo del código

- Reglas de negocio exactas (límites de membresía, precios, roles por colección Firestore) dependen de reglas en Firebase y de la configuración en FlutterFlow.
- Flujos de aprobación en tiendas y textos legales definitivos deben validarse con el equipo de producto y legal.

---

*Última actualización del documento: abril de 2026.*
