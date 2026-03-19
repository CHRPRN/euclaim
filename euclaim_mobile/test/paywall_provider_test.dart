import 'package:euclaim_mobile/core/providers/external_providers.dart';
import 'package:euclaim_mobile/features/paywall/paywall_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class MockRevenueCatPurchases extends Mock implements PurchasesWrapper {}
class MockCustomerInfo extends Mock implements CustomerInfo {}
class MockEntitlementInfos extends Mock implements EntitlementInfos {}
class MockEntitlementInfo extends Mock implements EntitlementInfo {}
class MockOfferings extends Mock implements Offerings {}
class MockPackage extends Mock implements Package {}

class FakeOffering extends Fake implements Offering {
  final Map<String, Package> packages = {};
  @override
  Package? getPackage(String identifier) => packages[identifier];
}

void main() {
  late MockRevenueCatPurchases mockPurchases;
  late MockCustomerInfo mockCustomerInfo;
  late MockEntitlementInfos mockEntitlementInfos;
  late MockEntitlementInfo mockEntitlementInfo;
  late MockOfferings mockOfferings;
  late FakeOffering fakeOffering;
  late MockPackage mockPackage;
  late ProviderContainer container;

  setUp(() {
    mockPurchases = MockRevenueCatPurchases();
    mockCustomerInfo = MockCustomerInfo();
    mockEntitlementInfos = MockEntitlementInfos();
    mockEntitlementInfo = MockEntitlementInfo();
    mockOfferings = MockOfferings();
    fakeOffering = FakeOffering();
    mockPackage = MockPackage();

    container = ProviderContainer(
      overrides: [
        revenueCatPurchasesProvider.overrideWithValue(mockPurchases),
      ],
    );

    registerFallbackValue(FakePurchasesConfiguration());
    registerFallbackValue(MockPackage());
  });

  tearDown(() {
    container.dispose();
  });

  group('PaywallController', () {
    test('initial state checks for pro_access', () async {
      when(() => mockPurchases.configure(any())).thenAnswer((_) async {});
      when(() => mockPurchases.getCustomerInfo()).thenAnswer((_) async => mockCustomerInfo);
      when(() => mockCustomerInfo.entitlements).thenReturn(mockEntitlementInfos);
      when(() => mockEntitlementInfos.active).thenReturn({'pro_access': mockEntitlementInfo});

      final result = await container.read(paywallControllerProvider.future);

      expect(result, true);
      verify(() => mockPurchases.configure(any())).called(1);
    });

    test('purchaseSingleClaim calls purchasePackage', () async {
      // Setup initial build
      when(() => mockPurchases.configure(any())).thenAnswer((_) async {});
      when(() => mockPurchases.getCustomerInfo()).thenAnswer((_) async => mockCustomerInfo);
      when(() => mockCustomerInfo.entitlements).thenReturn(mockEntitlementInfos);
      when(() => mockEntitlementInfos.active).thenReturn({});
 
      // Setup purchase logic
      when(() => mockPurchases.getOfferings()).thenAnswer((_) async => mockOfferings);
      when(() => mockOfferings.current).thenReturn(fakeOffering);
      fakeOffering.packages['single_claim'] = mockPackage;
      when(() => mockPurchases.purchasePackage(any())).thenAnswer((_) async => mockCustomerInfo);
 
      await container.read(paywallControllerProvider.notifier).purchaseSingleClaim();
 
      verify(() => mockPurchases.purchasePackage(mockPackage)).called(1);
    });
  });
}

// Fallback for PurchasesConfiguration
class FakePurchasesConfiguration extends Fake implements PurchasesConfiguration {}
