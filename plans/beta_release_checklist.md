# Checklist per il Rilascio Beta

## 1. Infrastruttura Firebase
- [ ] **Firebase Project Setup:** Verificare che il progetto Firebase sia correttamente configurato per ambiente di produzione.
- [ ] **Authentication:** Verificare che i provider di autenticazione siano attivi e configurati.
- [ ] **Firestore:** Verificare che il database sia inizializzato e che le regole di sicurezza (`firestore.rules`) siano in produzione.
- [ ] **Storage:** Verificare che le regole di accesso allo storage siano configurate correttamente.
- [ ] **Cloud Functions:** Verificare che tutte le funzioni siano deployate e funzionanti.

## 2. Mobile App (EUClaim Mobile)
- [ ] **Configurazione:** Verificare `google-services.json` (Android) e `GoogleService-Info.plist` (iOS).
- [ ] **Pagamenti:** Verificare la configurazione di RevenueCat in produzione.
- [ ] **Notifiche:** Verificare la configurazione FCM.
- [ ] **Test:** Implementare e superare i test unitari e di integrazione definiti in `plans/qa_testing.md`.

## 3. Web Admin Dashboard (EUClaim Admin)
- [ ] **Configurazione:** Verificare la connessione a Firebase.
- [ ] **Funzionalità:** Verificare che il "Dynamic Form Builder" e la gestione delle pratiche siano pienamente operativi.

## 4. QA & Test
- [ ] **Test di Integrazione:** Eseguire il flusso completo (Login -> Upload -> Pagamento) in ambiente di staging.
- [ ] **QA:** Test di usabilità su dispositivi reali (iOS/Android).

## 5. Rilascio
- [ ] **Build:** Generare le build di produzione (APK/AAB per Android, IPA per iOS).
- [ ] **Deploy:** Pubblicare la Web Dashboard.
