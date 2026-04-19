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
- [ ] **Functions**: desplegar `functions` y `custom_cloud_functions`; **Stripe** vía Secret Manager (ver §2.1).
- [ ] **Hosting** (web Flutter): ver §2.2.

---

## 2.1 Secretos Stripe (Cloud Functions v2)

Las callables `initStripePayment` e `initStripeTestPayment` leen **`STRIPE_SECRET_KEY_LIVE`** y **`STRIPE_SECRET_KEY_TEST`** desde [Google Secret Manager](https://firebase.google.com/docs/functions/config-env#secret-manager). Requiere plan **Blaze**.

0. **API Secret Manager** activa en el proyecto Google Cloud (una vez): [habilitar Secret Manager API](https://console.developers.google.com/apis/api/secretmanager.googleapis.com/overview?project=encuestas-prometheus-9tzwei) y esperar 1–2 minutos si acabas de activarla.
1. En la raíz del repo, añade las claves a `.env` (ya ignorado por git), según `.env.example`.
2. Sube los secretos al proyecto Firebase (por defecto `encuestas-prometheus-9tzwei`):
   - **Windows:** `pwsh ./tool/deploy_stripe_secrets.ps1`
   - **Manual** (desde `firebase/`):  
     `firebase functions:secrets:set STRIPE_SECRET_KEY_LIVE --data-file ruta/al/archivo_solo_sk_live.txt --project encuestas-prometheus-9tzwei`  
     (igual para `STRIPE_SECRET_KEY_TEST` con la clave test).
3. Despliega el codebase `functions`:  
   `cd firebase && firebase deploy --only functions --project encuestas-prometheus-9tzwei`  
   (o solo el grupo que corresponda si usáis despliegue parcial).
4. **Emulador local:** copia `firebase/functions/.secret.local.example` a **`firebase/functions/.secret.local`** y rellena las dos claves.

---

## 2.2 Hosting web (Flutter) en Firebase

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
