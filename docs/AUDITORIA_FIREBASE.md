# Auditoría Firebase (checklist)

Guía para revisar **seguridad y coste** del proyecto Firebase asociado a esta app. Marca los ítems al completarlos en cada revisión periódica (p. ej. trimestral o antes de un lanzamiento mayor).

---

## Proyecto y entornos

- [ ] Existe separación clara **dev / staging / prod** (proyectos distintos o al menos apps Android/iOS con bundle id distintos).
- [ ] Los archivos `google-services.json` / `GoogleService-Info.plist` corresponden al **proyecto correcto** por flavor o rama de build.
- [ ] Nadie con permisos *Owner* innecesarios en la consola Google Cloud / Firebase.

---

## Firestore

- [ ] **Reglas**: lectura/escritura acotadas por `request.auth` y, si aplica, por rol o UID; evitar `allow read, write: if true` en colecciones de datos de usuario.
- [ ] **Listas y queries**: no exponer colecciones enteras a usuarios no privilegiados; usar límites (`limit`) y paginación en cliente donde aplique.
- [ ] **Índices**: solo los necesarios; revisar índices compuestos generados por errores en consola y eliminar obsoletos.
- [ ] **Backup / PITR** (si el plan lo permite): activado para datos críticos.

---

## Storage

- [ ] Rutas de archivo no permiten **path traversal** ni escritura en carpetas de otros usuarios sin comprobación en reglas.
- [ ] Tamaño máximo y tipos MIME acordes al negocio.

---

## Cloud Functions

- [ ] Secretos y API keys solo en **configuración de Functions** o Secret Manager, no hardcodeados en el repo.
- [ ] Timeouts y memoria adecuados; evitar bucles que disparen facturación alta.
- [ ] CORS y autenticación en endpoints HTTP expuestos.

---

## Costes y alertas

- [ ] **Presupuestos y alertas** configurados en Google Cloud Billing para el proyecto vinculado.
- [ ] Revisar picos de **lecturas/escrituras** tras nuevas features o exports FlutterFlow.

---

## Mensajería y Remote Config

- [ ] FCM: claves y certificados de Apple actualizados; no exponer claves de servidor en cliente.
- [ ] Remote Config: parámetros documentados para el equipo de producto.

---

*Relacionado: [DESPLEGUE.md](DESPLEGUE.md), [MODELO_DATOS.md](MODELO_DATOS.md).*
