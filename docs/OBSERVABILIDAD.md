# Observabilidad — logging y fallos

## Logging en la app (`AppLog`)

Ubicación: `lib/config/app_log.dart`.

| Método | Cuándo usarlo |
|--------|----------------|
| `AppLog.d(...)` | Detalle de depuración; **solo en modo debug** (no sale en release). |
| `AppLog.w(...)` | Situaciones anómalas recuperables; visible en DevTools / logs del sistema. |
| `AppLog.e(...)` | Errores graves; mismo canal que `w` hasta integrar Crashlytics. |

### Buenas prácticas

- Preferir `AppLog` a `print` en código **custom** y en utilidades compartidas (p. ej. `revenue_cat_util.dart`).
- No registrar datos personales ni tokens en mensajes.
- **Crashlytics** (`firebase_crashlytics`): no está en el proyecto aún; valorar añadirlo y llamar a `recordError` desde `AppLog.e` o desde zonas `catch` críticas (pagos, auth).

## Analytics de negocio

Ver **[EVENTOS_ANALYTICS.md](EVENTOS_ANALYTICS.md)**.

## Costes Firebase

Ver **[COSTES_FIREBASE.md](COSTES_FIREBASE.md)**.
