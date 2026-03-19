# Documentazione Progetto EUClaim

## Panoramica
EUClaim è un ecosistema composto da una Mobile App (Flutter) e una Web Dashboard (Flutter Web) per la gestione di rimborsi e class action. Il sistema si basa su un motore dinamico (Dynamic Form Generation) che permette all'Admin di definire i requisiti documentali senza aggiornare il codice dell'app.

## Stack Tecnologico
- **Frontend Mobile:** Flutter (iOS/Android)
- **Frontend Web (Admin):** Flutter Web
- **Backend & BaaS:** Firebase (Auth, Firestore, Storage, Cloud Functions)
- **State Management:** Riverpod
- **Routing:** GoRouter
- **Pagamenti:** RevenueCat
- **Utility:** flutter_image_compress

## Struttura del Progetto
- `euclaim_mobile/`: Progetto Flutter per l'utente finale.
- `euclaim_admin/`: Progetto Flutter per la dashboard di amministrazione.
- `functions/`: Cloud Functions (Node.js) per logica server-side (OCR, PDF, Email).

## Modelli Dati (Firestore)
- `users`: Dati anagrafici utente.
- `admins`: Gestione ruoli admin.
- `claims_catalog`: Catalogo cause con requisiti dinamici (`requiredDocs`).
- `user_applications`: Pratiche utente con stato, documenti caricati e dati OCR.

- [x] Fase 10: Test Unitari & Refactoring per la Testabilità (Completato)

## Lavoro Svolto
### Fase 1-7
(Vedi versioni precedenti)

### Fase 8: Analisi e Strategia QA
- **Analisi Test Esistenti:** Documentata in `plans/analisi_test_esistenti.md`. Copertura minima, limitata a test di base.
- **Strategia di QA:** Definita in `plans/qa_strategy.md`. Approccio basato su test unitari, di widget e di integrazione per i flussi critici (Auth, Dynamic Forms, Pagamenti).
- **Piano di Test:** Dettagliato in `plans/qa_testing.md`. Include test unitari per provider, test di widget per UI critiche e test di integrazione end-to-end.
- **Esecuzione Test di Base:** Eseguiti test di default in `euclaim_mobile` e `euclaim_admin`. Risultati documentati in `plans/risultati_test.md`. Nessun bug critico emerso, ma confermata la necessità di implementare test avanzati con mock.

- **Cloud Functions:** Sistemato `package.json` nel backend `functions/` e aggiunte dependency richieste (`firebase-functions`, `firebase-admin`).

### Fase 10: Test Unitari & Refactoring per la Testabilità
- **Refactoring Architetturale:** Introdotto il pattern *Wrapper* in `external_providers.dart` per isolare dipendenze statiche e globali (RevenueCat `Purchases`, `FlutterImageCompress`).
- **Dependency Injection:** Tutte le utility esterne sono ora iniettate tramite Riverpod, permettendo il mocking completo in ambiente di test.
- **Suite di Test Unitari (Mobile):** 
    - `auth_provider_test.dart`: Copertura completa del flusso di autenticazione Google e gestione sessioni.
    - `upload_provider_test.dart`: Validazione del processo di picking, compressione e upload su Firebase Storage.
    - `paywall_provider_test.dart`: Verifica dello stato premium e dell'integrazione con RevenueCat.
    - `claims_provider_test.dart`: Review dei test esistenti per la coerenza con i dati di Firestore.

### Fase 11: Rilascio in Produzione (Marzo 2026)
- **Firebase Production:** Deploy completo di Firestore Rules, Indexes, Storage Rules e Cloud Functions sul progetto `euclaim-95176`.
- **Web Admin Dashboard:** Pubblicazione su Firebase Hosting all'indirizzo [https://euclaim-95176.web.app](https://euclaim-95176.web.app). Configurato accesso Super Admin tramite UID Firestore.
- **Android Release:** Generazione della Keystore di produzione (`upload-keystore.jks`), configurazione del signing e build dell'Android App Bundle (AAB) pronto per Google Play Console.
- **Integrazione Pagamenti:** Configurate le API Key di RevenueCat (`goog_...`) per l'ambiente Android Live.

## Configurazione Ambiente Mac (Apple Silicon / Intel)
Quando cambierai postazione per lavorare da macOS, dovrai ripristinare il collegamento con Firebase e preparare le dipendenze iOS. Segui questi step:

1. **Installa le dipendenze globali**:
   Assicurati di avere Node.js installato, poi esegui dal terminale:
   ```bash
   npm install -g firebase-tools
   dart pub global activate flutterfire_cli
   ```
   *(Assicurati che il percorso binario di Dart sia nel tuo `PATH` di sistema)*

2. **Autenticazione Firebase**:
   Autorizza la macchina Mac ad accedere al tuo Firebase:
   ```bash
   firebase login
   ```

3. **Inizializzazione dipendenze iOS**:
   Dato che il codice iOS usa CocoaPods per le dipendenze native di Firebase, dovrai installarle. Entra nella cartella di ogni app e pulisci/installa i pods:

   *Per la Mobile App:*
   ```bash
   cd euclaim_mobile/ios
   pod install --repo-update
   cd ../..
   ```

   *Per la Web/Admin Dashboard (se la buildi anche come app desktop/iOS):*
   ```bash
   cd euclaim_admin/ios
   pod install --repo-update
   cd ../..
   ```

4. **Verifica Configuration (Opzionale)**:
   I file generati (`firebase_options.dart`, `google-services.json`, `GoogleService-Info.plist`) sono già versionati e presenti nel progetto. Non è necessario rigenerarli, ma se in futuro aggiungessi nuove piattaforme potrai usare: `flutterfire configure --project=euclaim-95176`

## Stato Attuale degli Stream (Aggiornamento: Marzo 2026)

### Stream Eseguiti (Completati di recente)
- [x] **Configurazione Firebase & Setup Progetto:** Completato il setup tramite `flutterfire configure`, sincronizzando le app Flutter con i Firebase services e sistemando le configurazioni e i package name iOS/Android.
- [x] **Implementazione e Debug Test Unitari:** Eseguito un refactoring architetturale per la testabilità (Dependency Injection per gli external providers) e implementati test completi per i flussi critici (`auth_provider`, `claims_provider`, `upload_provider`, `paywall_provider`). Risolti bug nell'esecuzione locale dei test.
- [x] **Risoluzione Conflitti Pubspec & App Bundle:** Analizzati e risolti conflitti critici di dipendenze Dart (incluso l'aggiornamento a versioni stabili come per `google_sign_in`) indispensabili per sbloccare la build per gli store (Android App Bundle).
- [x] **Build e Deploy Produzione:** Configurazione degli ambienti di produzione, deploy backend, pubblicazione Dashboard Web ([euclaim-95176.web.app](https://euclaim-95176.web.app)) e generazione Android App Bundle (AAB) con firma di produzione.

### Stream da Fare (Prossimi Passi)
- [ ] **Test E2E e Automazione UI:** Finalizzazione ed esecuzione dei test End-to-End di widget/integrazione (usando Firebase Emulator) per simulare il flusso completo "Guest -> Autenticazione -> Compilazione Pratica Form Dinamico -> Pagamento".
- [ ] **Pipeline CI/CD:** Setup dei workflow automatizzati (es. GitHub Actions o alternative) per eseguire i test ad ogni push e pacchettizzare le build.
- [ ] **Lancio iOS:** Configurazione dei certificati Apple e dei file `GoogleService-Info.plist` per la pubblicazione su App Store.
