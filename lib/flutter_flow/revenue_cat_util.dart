import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '/config/app_log.dart';

export 'package:purchases_flutter/purchases_flutter.dart'
    show Package, Offering;

Offerings? _offerings;
CustomerInfo? _customerInfo;
String? _loggedInUid;
bool _isConfigured = false;

Offerings? get offerings => _offerings;
CustomerInfo? get customerInfo => _customerInfo;
bool get isConfigured => _isConfigured;

set customerInfo(CustomerInfo? customerInfo) => _customerInfo = customerInfo;

Future initialize(
  String appStoreKey,
  String playStoreKey, {
  String webKey = '',
  bool debugLogEnabled = false,
  bool loadDataAfterLaunch = false,
}) async {
  try {
    // Set log level before configuration
    await Purchases.setLogLevel(
      debugLogEnabled ? LogLevel.debug : LogLevel.info,
    );

    // Configure based on platform
    PurchasesConfiguration configuration;
    if (kIsWeb) {
      if (webKey.isEmpty) {
        AppLog.d(
          '[RevenueCat] REVENUECAT_WEB_API_KEY ausente; RevenueCat deshabilitado en web.',
        );
        return;
      }
      configuration = PurchasesConfiguration(webKey);
    } else if (Platform.isIOS) {
      if (appStoreKey.isEmpty) {
        AppLog.d(
          '[RevenueCat] REVENUECAT_APPLE_API_KEY ausente; compras in-app omitidas.',
        );
        return;
      }
      configuration = PurchasesConfiguration(appStoreKey);
    } else if (Platform.isAndroid) {
      if (playStoreKey.isEmpty) {
        AppLog.d(
          '[RevenueCat] REVENUECAT_GOOGLE_API_KEY ausente; compras in-app omitidas.',
        );
        return;
      }
      configuration = PurchasesConfiguration(playStoreKey);
    } else {
      AppLog.d('RevenueCat is not supported on this platform.');
      return;
    }

    await Purchases.configure(configuration);
    _isConfigured = true;

    if (loadDataAfterLaunch) {
      loadCustomerInfo();
      loadOfferings();
    } else {
      await loadCustomerInfo();
      await loadOfferings();
    }

    Purchases.addCustomerInfoUpdateListener((info) {
      customerInfo = info;
    });
  } on Exception catch (e, st) {
    AppLog.w('RevenueCat initialization failed', e, st);
  }
}

// Purchase a package.
Future<bool> purchasePackage(String package) async {
  if (!_isConfigured) {
    AppLog.w('RevenueCat is not configured. Cannot purchase package.');
    return false;
  }
  try {
    final revenueCatPackage = offerings?.current?.getPackage(package);
    if (revenueCatPackage == null) {
      return false;
    }
    // v9.0+: purchasePackage returns PurchaseResult instead of CustomerInfo
    final result = await Purchases.purchasePackage(revenueCatPackage);
    customerInfo = result.customerInfo;
    return true;
  } catch (_) {
    return false;
  }
}

List<String> get activeEntitlementIds => _customerInfo != null
    ? _customerInfo!.entitlements.active.values
        .map((e) => e.identifier)
        .toList()
    : [];

Future loadOfferings() async {
  if (!_isConfigured) {
    return;
  }
  try {
    _offerings = await Purchases.getOfferings();
  } on PlatformException catch (e, st) {
    AppLog.w('Error loading RevenueCat offerings', e, st);
  }
}

Future loadCustomerInfo() async {
  if (!_isConfigured) {
    return;
  }
  try {
    _customerInfo = await Purchases.getCustomerInfo();
  } on PlatformException catch (e, st) {
    AppLog.w('Error loading RevenueCat customer info', e, st);
  }
}

// Return if the user has the entitlement.
// Return null on errors.
// Returns false if RevenueCat is not configured (e.g., no web billing key in Test Mode).
Future<bool?> isEntitled(String entitlementId) async {
  if (!_isConfigured) {
    // Return false instead of null to indicate no entitlement when unconfigured.
    // This allows Test Mode to work without a web billing key.
    return false;
  }
  try {
    customerInfo = await Purchases.getCustomerInfo();
    return customerInfo!.entitlements.all[entitlementId]?.isActive ?? false;
  } on Exception catch (e, st) {
    AppLog.w('Unable to check RevenueCat entitlements', e, st);
    return null;
  }
}

// https://docs.revenuecat.com/docs/user-ids
Future login(String? uid) async {
  if (!_isConfigured) {
    return;
  }
  if (uid == _loggedInUid) {
    return;
  }
  try {
    if (uid != null) {
      customerInfo = (await Purchases.logIn(uid)).customerInfo;
    } else {
      customerInfo = await Purchases.logOut();
    }
    _loggedInUid = uid;
  } on Exception catch (e, st) {
    AppLog.w('Unable to logIn or logOut user in RevenueCat', e, st);
  }
}

// https://docs.revenuecat.com/docs/restoring-purchases
Future restorePurchases() async {
  if (!_isConfigured) {
    return;
  }
  // Note: On web, purchases are automatically restored by Web Billing.
  // This method is only needed for iOS/Android.
  if (kIsWeb) {
    AppLog.d(
      'Restore purchases is not needed on web (Web Billing handles this).',
    );
    return;
  }
  try {
    customerInfo = await Purchases.restorePurchases();
  } on PlatformException catch (e, st) {
    AppLog.w('Unable to restore purchases in RevenueCat', e, st);
  }
}
