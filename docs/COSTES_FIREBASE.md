# Costes y rendimiento Firebase

## Alertas de presupuesto

1. En [Google Cloud Console](https://console.cloud.google.com/) → **Facturación** → **Presupuestos y alertas**.
2. Crear presupuesto para el proyecto vinculado a Firebase (mensual o por umbral).
3. Añadir alertas al 50 %, 90 % y 100 % del presupuesto; notificar por correo o Slack.

## Firestore

- Revisar paneles **Usage** en Firebase Console: lecturas/escrituras/borrados por día.
- Evitar `get()` masivos sin `limit` en listas de usuario; usar paginación (`infinite_scroll_pagination` ya está en dependencias).
- Índices compuestos: cada índice extra implica coste de almacenamiento pequeño pero acumulable; eliminar índices no usados.

## Functions

- Revisar invocaciones, GB-segundo y red saliente en la consola.
- Ajustar `memory` y `timeout` para no sobreprovisionar.

## Storage

- Vigilar GB almacenados y descargas; comprimir imágenes en cliente cuando sea posible.

## Mensajería (FCM)

- Picos de envío masivo pueden impactar costes según plan; segmentar campañas.

---

*Complementa [AUDITORIA_FIREBASE.md](AUDITORIA_FIREBASE.md) y [MODELO_DATOS.md](MODELO_DATOS.md).*
