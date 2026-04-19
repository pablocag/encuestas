import 'package:flutter_test/flutter_test.dart';

import 'package:encuestas_prometheus/config/runtime_env.dart';

void main() {
  test('sin STRIPE_PUBLISHABLE_KEY en VM de test, Stripe queda desactivado', () {
    expect(RuntimeEnv.hasStripePublishableKey, isFalse);
  });

  test('STRIPE_USE_LIVE_BACKEND por defecto es true', () {
    expect(RuntimeEnv.stripeUseLiveBackend, isTrue);
  });

  test('claves RevenueCat vacías por defecto en test', () {
    expect(RuntimeEnv.revenueCatAppleApiKey, isEmpty);
    expect(RuntimeEnv.revenueCatGoogleApiKey, isEmpty);
    expect(RuntimeEnv.revenueCatWebApiKey, isEmpty);
  });
}
