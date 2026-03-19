# Guida Configurazione Firebase Emulator per Test di Integrazione

## 1. Installazione Firebase CLI
Assicurati di avere Firebase CLI installato:
```bash
npm install -g firebase-tools
```

## 2. Inizializzazione Emulator
Nella root del progetto, inizializza gli emulatori:
```bash
firebase init emulators
```
Seleziona `Firestore`, `Authentication` e `Storage`.

## 3. Configurazione Test
Nel file `test_driver/app_test.dart` (o simile), configura l'app per puntare agli emulatori locali:

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

void setupEmulators() {
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
}
```

## 4. Esecuzione Test
Avvia gli emulatori prima di eseguire i test:
```bash
firebase emulators:start --only firestore,auth,storage
flutter drive --target=test_driver/app.dart
```
