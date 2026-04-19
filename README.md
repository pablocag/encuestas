# Encuestas Prometheus

Proyecto Flutter (export típico FlutterFlow) con Firebase, Stripe y RevenueCat.

## Requisitos

- Flutter **stable** (recomendación FlutterFlow): [instalación](https://docs.flutter.dev/get-started/install)

## Configuración de claves (Fase 1 / P0)

Las claves **no** deben vivir en el código. Usa variables en tiempo de compilación:

1. Copia `.env.example` a `.env` en la raíz del repo.
2. Rellena `STRIPE_PUBLISHABLE_KEY`, claves de RevenueCat por plataforma, etc. (valores desde Stripe, RevenueCat y Apple Developer).
3. Arranca la app con archivo de defines (Flutter 3.7+):

```bash
flutter run --dart-define-from-file=.env
```

Equivalente sin archivo (CI o una sola clave):

```bash
flutter run --dart-define=STRIPE_PUBLISHABLE_KEY=pk_test_xxx --dart-define=REVENUECAT_GOOGLE_API_KEY=goog_xxx
```

### Variables soportadas

| Variable | Uso |
|----------|-----|
| `STRIPE_PUBLISHABLE_KEY` | Clave publicable Stripe (`pk_...`). Sin ella, Stripe no se inicializa. |
| `STRIPE_USE_LIVE_BACKEND` | `true` (defecto): Cloud Function `initStripePayment`. `false`: `initStripeTestPayment` y pruebas en hoja de pago. |
| `STRIPE_APPLE_MERCHANT_ID` | Merchant ID de Apple Pay en iOS (opcional si no usas Apple Pay). |
| `REVENUECAT_APPLE_API_KEY` | RevenueCat App Store. |
| `REVENUECAT_GOOGLE_API_KEY` | RevenueCat Play Store. |
| `REVENUECAT_WEB_API_KEY` | RevenueCat en web (opcional). |

El archivo `.env` está en `.gitignore`; **no** lo subas al repositorio.

## Git y ramas (convención sugerida)

| Rama | Uso |
|------|-----|
| `main` | Producción / releases estables. |
| `develop` | Integración continua; merge desde *feature branches*. |
| `feature/…` / `fix/…` | Cambios aislados; PR hacia `develop` (o `main` si el equipo es pequeño). |

Ajusta los nombres a lo que ya uséis; lo importante es documentarlo y mantener CI en PRs.

## Auditoría Firebase (manual)

Checklist detallada: **[docs/AUDITORIA_FIREBASE.md](docs/AUDITORIA_FIREBASE.md)**.

## Documentación del repo

- [Arquitectura y deuda FlutterFlow](docs/ARQUITECTURA_FLUTTERFLOW.md) — carpetas, dependencias, mapa de rutas, anti-corruption
- [Runbook de despliegue](docs/DESPLEGUE.md) — versión, Firebase, tiendas, rollback
- [Modelo de datos Firestore](docs/MODELO_DATOS.md) — colecciones y relaciones
- [Auditoría Firebase](docs/AUDITORIA_FIREBASE.md) — seguridad y costes
- [Observabilidad](docs/OBSERVABILIDAD.md) — `AppLog`, Analytics, costes
- [Eventos Analytics](docs/EVENTOS_ANALYTICS.md) — convención y eventos de negocio
- [Costes Firebase](docs/COSTES_FIREBASE.md) — presupuestos y uso
- [UX y producto](docs/UX_PRODUCTO.md) — accesibilidad, offline, i18n, onboarding
- [Estado del proyecto](ESTADO_PROYECTO.md)
- [Características del sistema](CARACTERISTICAS_SISTEMA.md)
- [Propuestas de mejora (checklist)](PROPUESTAS_MEJORA.md)

### Actualización de dependencias (Dependabot)

Si el repo está en **GitHub**, [`.github/dependabot.yml`](.github/dependabot.yml) propone PRs semanales para **Pub** (raíz) y **npm** (`firebase/functions`, `firebase/custom_cloud_functions`). Revisa cada PR con `.\tool\ci.ps1` antes de fusionar.

## Cloud Functions en local (opcional)

Con Firebase CLI instalado, desde `firebase/`:

```bash
cd firebase/functions && npm install && cd ../..
firebase emulators:start --only functions
```

## Builds de release

Pasa las mismas variables que en desarrollo, por ejemplo:

```bash
flutter build apk --dart-define-from-file=.env
flutter build ios --dart-define-from-file=.env
```

En Xcode, si compilas sin CLI, configura **Dart define** en el scheme o en *Build Settings* según la [documentación de Flutter](https://docs.flutter.dev/deployment/flavors#using-dart-defines).

## CI local (Fase 2)

Mismo flujo que GitHub Actions: dependencias, análisis (sin fallar por *info*/warning) y tests.

**Windows (PowerShell):**

```powershell
.\tool\ci.ps1
```

**macOS / Linux:**

```bash
chmod +x tool/ci.sh
./tool/ci.sh
```

En GitHub, el workflow [`.github/workflows/ci.yml`](.github/workflows/ci.yml) corre en cada `push` y `pull_request`.

## Arranque rápido

```bash
flutter pub get
flutter run --dart-define-from-file=.env
```
