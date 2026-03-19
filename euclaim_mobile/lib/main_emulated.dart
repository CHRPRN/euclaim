import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:euclaim_mobile/firebase_options.dart';
import 'package:euclaim_mobile/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configurazione Emulatori
  const String host = kIsWeb ? 'localhost' : '10.0.2.2'; // 10.0.2.2 è l'alias per localhost nell'emulatore Android

  await FirebaseAuth.instance.useAuthEmulator(host, 9099);
  FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  await FirebaseStorage.instance.useStorageEmulator(host, 9199);
  
  // Nota: Functions non richiede una chiamata esplicita se si usa il pacchetto cloud_functions
  // ma se necessario si usa FirebaseFunctions.instance.useFunctionsEmulator(host, 5001);

  runApp(const ProviderScope(child: EUClaimApp()));
}
