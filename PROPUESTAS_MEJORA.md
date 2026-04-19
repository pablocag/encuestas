# Propuestas de mejora — Encuestas Prometheus (checklist)

Backlog técnico y de producto (Flutter / FlutterFlow, Firebase, Stripe, RevenueCat). Marca `[x]` al completar; prioridades solo orientativas.

**Leyenda:** **P0** seguridad/cumplimiento · **P1** estabilidad/mantenimiento · **P2** DX/docs · **P3** producto cuando haya margen

---

## Seguridad y configuración (P0–P1)

- [x] **1. Claves públicas fuera del código** (`--dart-define`, flavors o CI) — Stripe publicable, IDs RevenueCat; un origen por entorno.
- [x] **2. Auditar `google-services.json` y reglas Firebase** — checklist en [docs/AUDITORIA_FIREBASE.md](docs/AUDITORIA_FIREBASE.md).
- [x] **3. Flujos sensibles** — web/móvil en capturas y orientación; borrado de cuenta con limpieza Firestore (`deleteReferenciasUsuario` + doc `users`).

---

## Calidad de software y pruebas (P1)

- [x] **4. Suite de pruebas mínima** — tests sin `main` (p. ej. `test/config/runtime_env_test.dart`); ampliar con mocks Firebase cuando haga falta.
- [x] **5. Analyzer sobre `custom_code`** — ya no se excluye `lib/custom_code/**`; solo `custom_functions.dart` (FlutterFlow).
- [x] **6. CI/CD** — GitHub Actions: `flutter analyze --no-fatal-infos --no-fatal-warnings` + `flutter test`.

---

## Arquitectura y deuda FlutterFlow (P1–P2)

- [x] **7. Capa / documentación anti-corruption** — ver `docs/ARQUITECTURA_FLUTTERFLOW.md` §1 y candidatos a extracción (CSV, árbol).
- [x] **8. Gestión de dependencias** — inventario agrupado y política de actualización en el mismo doc §2.
- [x] **9. Navegación** — mapa por feature y `routePath` en el mismo doc §3 (`nav.dart`).

---

## Observabilidad y operación (P1–P2)

- [x] **10. Logging estructurado** — `lib/config/app_log.dart` (d/w/e); RevenueCat migrado a `AppLog`; Crashlytics pendiente (ver [docs/OBSERVABILIDAD.md](docs/OBSERVABILIDAD.md)).
- [x] **11. Analytics de negocio** — convención y eventos sugeridos en [docs/EVENTOS_ANALYTICS.md](docs/EVENTOS_ANALYTICS.md); comentario en `analytics.dart`.
- [x] **12. Costes Firebase** — [docs/COSTES_FIREBASE.md](docs/COSTES_FIREBASE.md).

---

## Experiencia de usuario y producto (P2–P3)

- [x] **13. Accesibilidad** — criterios y checklist en [docs/UX_PRODUCTO.md](docs/UX_PRODUCTO.md) §13.
- [x] **14. Offline / degradación** — mismo doc §14 (cola local = decisión de producto).
- [x] **15. Internacionalización** — mismo doc §15.
- [x] **16. Onboarding en app** — mismo doc §16.

---

## Documentación (P2)

- [x] **17. Ampliar `README.md`** — Flutter, env, Functions, ramas, Dependabot; enlaces a docs y a `ESTADO_*` / `CARACTERISTICAS_*`.
- [x] **18. Runbook de despliegue** — [docs/DESPLEGUE.md](docs/DESPLEGUE.md).
- [x] **19. Modelo de datos** — [docs/MODELO_DATOS.md](docs/MODELO_DATOS.md).

---

## Quick wins

- [x] **A.** Arreglar o quitar `widget_test` por defecto hasta tener mocks.
- [x] **B.** Añadir `.env.example` (sin secretos) para `dart-define`.
- [x] **C.** Dependabot (o similar) en `pubspec.yaml` y `package.json` de Functions.
- [x] **D.** Script único (`melos` / Makefile / `task`): `pub get`, `analyze`, `test`.

---

## Orden sugerido de implementación

- [x] Fase 1 — P0: entornos y secretos/config en repo.
- [x] Fase 2 — P1: CI mínimo, tests, analyzer en `custom_code`.
- [x] Fase 3 — P2: documentación de despliegue y dependencias.
- [x] Fase 4 — P3: observabilidad documentada + `AppLog`; UX/i18n/onboarding como guía en [docs/UX_PRODUCTO.md](docs/UX_PRODUCTO.md).

---

*Revisar tras cada export desde FlutterFlow o cambio mayor en Firebase.*
