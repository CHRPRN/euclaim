# Workflow CI/CD per EUClaim

## Obiettivo
Automatizzare l'esecuzione dei test (Unit, Widget, Integrazione) su ogni push o pull request verso il branch `main` o `develop`.

## Pipeline (GitHub Actions)

### 1. Setup Ambiente
- Runner: `ubuntu-latest`
- Setup Flutter: `subosito/flutter-action`
- Setup Java (per Android/Firebase Emulator): `actions/setup-java`

### 2. Job: Test Unitari & Widget
- Esecuzione: `flutter test`
- Target: `euclaim_mobile` e `euclaim_admin`

### 3. Job: Test di Integrazione (Firebase Emulator)
- Avvio Firebase Emulator: `firebase emulators:start --only firestore,auth,storage`
- Esecuzione: `flutter drive --target=test_driver/app.dart`
- Chiusura Emulator.

### 4. Notifiche
- Invio esito (Success/Failure) su Slack o Email.
