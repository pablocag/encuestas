# UX, accesibilidad, offline e internacionalización

Hoja de ruta y criterios para los ítems 13–16 del checklist de mejoras. Marca progreso en reuniones de producto.

---

## 13. Accesibilidad (a11y)

- [ ] Contraste mínimo **WCAG 2.1 AA** en textos sobre fondos (especialmente botones de pago y encuesta).
- [ ] Áreas táctiles ≥ **48×48** lógicos en flujos de encuesta y Stripe.
- [ ] `Semantics` / `MergeSemantics` en iconos solo-imagen con acción (tooltips o `semanticLabel`).
- [ ] Probar con **TalkBack** (Android) y **VoiceOver** (iOS) en login, home y una encuesta completa.

---

## 14. Offline / degradación

- [ ] Inventariar pantallas que ya usan `checkInternetConnection` u otras comprobaciones.
- [ ] Decidir si se necesita **cola local** de borradores de respuestas (coste de desarrollo vs abandono sin red).
- [ ] Mensajes claros cuando falle red en submit (Snackbar + reintento).

---

## 15. Internacionalización (i18n)

- [ ] Inventario de strings **hardcodeados** en español fuera de `internationalization.dart`.
- [ ] Priorizar pantallas públicas (login, bienvenida, privacidad) para extracción a ARB / `intl`.
- [ ] Definir idioma por defecto y fallback.

---

## 16. Onboarding

- [ ] Definir perfiles: **encuestador** vs **administrador** (o más) y qué ven al primer login.
- [ ] Wireframe de tour (2–4 pasos máximo) o pantalla “Cómo empezar”.
- [ ] Medir con Analytics si se completa el tour (`onboarding_step_N`).

---

*Implementación incremental: cada ítem puede convertirse en issue con criterios de aceptación.*
