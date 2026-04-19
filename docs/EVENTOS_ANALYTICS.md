# Eventos de Firebase Analytics

La app usa `logFirebaseEvent` definido en `lib/backend/firebase_analytics/analytics.dart`. Cada llamada:

- Añade automáticamente el parámetro `user` (UID o `'unset'`).
- Convierte valores no numéricos a **string** truncada a 100 caracteres.
- Exige `eventName` ≤ 40 caracteres (assert en debug).

## Convención actual (FlutterFlow)

| Tipo | Patrón | Ejemplo |
|------|--------|---------|
| Pantalla | `screen_view` + `screen_name` | `logFirebaseEvent('screen_view', parameters: {'screen_name': 'homePage'})` |
| Toque / acción | `PANTALLA_elemento_ON_TAP` (truncado a 40 chars) | `HOME_PAGE_PAGE_ButtonMembresia_ON_TAP` |
| Auth | `sign_up` / `login` + `method` | Vía `logFirebaseAuthEvent` |

Los nombres largos con sufijos `_ICN_ON_TAP` vienen del export FlutterFlow; son útiles para funnels por pantalla aunque poco legibles en tablas.

## Eventos de negocio recomendados (añadir de forma explícita)

Cuando se implementen flujos críticos, registrar **nombres cortos y estables** (≤ 40) y parámetros acotados:

| Evento sugerido | Parámetros | Momento |
|-----------------|------------|---------|
| `purchase_success` | `product_id`, `amount` (num si aplica) | Tras Stripe / RevenueCat OK |
| `survey_completed` | `model_id` (string) | Al terminar encuesta |
| `surveyor_invited` | — o `role` | Alta o transferencia de encuestador |
| `membership_activated` | `tier` (string) | Tras activar membresía |

Documentar aquí cualquier evento nuevo que el producto quiera ver en la consola de Analytics.

## Dónde buscar usos

```text
grep -r "logFirebaseEvent" lib/
```

Revisar también `logFirebaseAuthEvent` para embudos de registro e inicio de sesión.
