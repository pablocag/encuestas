import 'package:flutter/foundation.dart' show kDebugMode, debugPrint;

/// Variables de entorno en **tiempo de compilación** (`--dart-define=CLAVE=valor`
/// o `flutter run --dart-define-from-file=.env`).
///
/// No incluyas valores reales en el código fuente; usa `.env` local (ignorado por git).
abstract final class RuntimeEnv {
  /// Clave publicable de Stripe (`pk_live_...` o `pk_test_...`).
  static const String stripePublishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue: '',
  );

  /// Si es `true` (por defecto), se llama a `initStripePayment` en Cloud Functions.
  /// Si es `false`, `initStripeTestPayment` y entorno de prueba en la hoja de pago.
  static const bool stripeUseLiveBackend = bool.fromEnvironment(
    'STRIPE_USE_LIVE_BACKEND',
    defaultValue: true,
  );

  /// Merchant ID de Apple Pay (configurable por entorno; no es clave secreta).
  static const String stripeAppleMerchantId = String.fromEnvironment(
    'STRIPE_APPLE_MERCHANT_ID',
    defaultValue: '',
  );

  static const String revenueCatAppleApiKey = String.fromEnvironment(
    'REVENUECAT_APPLE_API_KEY',
    defaultValue: '',
  );

  static const String revenueCatGoogleApiKey = String.fromEnvironment(
    'REVENUECAT_GOOGLE_API_KEY',
    defaultValue: '',
  );

  static const String revenueCatWebApiKey = String.fromEnvironment(
    'REVENUECAT_WEB_API_KEY',
    defaultValue: '',
  );

  static bool get hasStripePublishableKey => stripePublishableKey.isNotEmpty;

  static void debugLogMissingStripe() {
    if (kDebugMode && stripePublishableKey.isEmpty) {
      debugPrint(
        '[RuntimeEnv] STRIPE_PUBLISHABLE_KEY no definida. '
        'Copia .env.example a .env y usa --dart-define-from-file=.env',
      );
    }
  }
}
