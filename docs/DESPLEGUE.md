# Runbook de despliegue — Encuestas Prometheus

Checklist operativa antes y después de publicar una versión. Ajusta nombres de ramas y entornos a los del equipo.

---

## 1. Pre-release (código)

- [ ] Rama fusionada y CI verde (`.github/workflows/ci.yml`).
- [ ] `pubspec.yaml`: subir `version:` (`x.y.z+build`) acorde a [versionado semántico](https://semver.org/lang/es/) y reglas de tiendas.
- [ ] Claves de compilación: `.env` / `--dart-define-from-file` listos para **producción** (Stripe, RevenueCat, Firebase del proyecto prod).
- [ ] `flutter build apk` / `flutter build appbundle` / `flutter build ios` / `flutter build web` probados localmente o en CI de release (si existe).

---

## 2. Firebase

- [ ] **Firestore**: reglas desplegadas (`firebase deploy --only firestore:rules` o flujo equivalente).
- [ ] **Índices**: `firestore.indexes.json` aplicado (`firebase deploy --only firestore:indexes`); comprobar en consola que no queden índices en estado *Error*.
- [ ] **Storage**: reglas desplegadas (`firebase deploy --only storage`).
- [ ] **Functions**: desplegar `functions` y `custom_cloud_functions` según `firebase.json`; variables y secretos configurados en el entorno de Functions (no en el repo). Stripe en `firebase/functions/index.js` usa **`STRIPE_SECRET_KEY_LIVE`** y **`STRIPE_SECRET_KEY_TEST`** (o `firebase functions:config:set stripe.secret_live` / `stripe.secret_test` en 1st gen).
- [ ] **Hosting** (web Flutter): ver sección *Hosting web (Flutter)* más abajo.

---

## 2.1 Hosting web (Flutter) en Firebase

El archivo `firebase/firebase.json` apunta `hosting.public` a `../build/web` (salida de `flutter build web`) e incluye **rewrites** a `/index.html` para rutas limpias (`usePathUrlStrategy()` en la app).

1. Instalar [Firebase CLI](https://firebase.google.com/docs/cli): `npm install -g firebase-tools`.
2. Iniciar sesión: `firebase login`.
3. Asegurar que el proyecto en `firebase/.firebaserc` coincide con el de producción (por defecto `encuestas-prometheus-9tzwei`; cambiar alias con `firebase use` si hace falta).
4. En la raíz del repo, con `.env` de producción si usáis `--dart-define-from-file`:
   - **Windows (PowerShell):** `pwsh ./tool/deploy_web_firebase.ps1`
   - **Manual:**  
     `flutter build web --release --dart-define-from-file=.env`  
     `cd firebase`  
     `firebase deploy --only hosting`

La URL aparecerá en la consola (típicamente `https://encuestas-prometheus-9tzwei.web.app` o dominio personalizado si lo configuráis en la consola de Firebase).

---

## 3. Tiendas móviles

- [ ] **Google Play**: notas de versión, capturas si aplica, revisión de permisos y *Data safety*.
- [ ] **App Store**: *What’s New*, revisión de privacidad y *Sign in with Apple* si aplica.
- [ ] Rastreadores / SDKs declarados según política actual de cada tienda.

---

## 4. Post-release

- [ ] Monitorizar **Crashlytics** / errores en consola (si están activos).
- [ ] Revisar **Analytics** o métricas clave las primeras 24–48 h.
- [ ] Etiquetar el commit o crear **tag** Git con el número de versión publicada.

---

## 5. Rollback

- [ ] Tiendas: usar *phased rollout* en Play y revisión rápida en App Store cuando sea posible.
- [ ] Firebase: mantener copia de reglas anteriores y desplegar versión conocida si hace falta.
- [ ] Functions: versiones anteriores en consola o redeploy desde tag estable.

---

*Complementa con [MODELO_DATOS.md](MODELO_DATOS.md) y [ARQUITECTURA_FLUTTERFLOW.md](ARQUITECTURA_FLUTTERFLOW.md).*
