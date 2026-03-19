@echo off
dart run build_runner build --delete-conflicting-outputs
flutter test test/auth_provider_test.dart test/claims_provider_test.dart
