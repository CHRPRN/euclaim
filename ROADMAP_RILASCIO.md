# Roadmap Rilascio EUClaim 🚀

Questa roadmap organizza i passi necessari per portare l'app negli store, dando priorità alla stabilità del core e alla configurazione degli ambienti prima di passare ai dettagli dei pagamenti.

## 📍 Fase 1: Consolidamento e Validazione (✅ COMPLETATA)
*L'obiettivo è assicurarsi che tutto quello che è stato scritto finora funzioni perfettamente nel mondo reale.*

- [x] **Verifica Form Dinamici**: Supporto per Immagini e PDF implementato e verificato.
- [x] **Stress Test OCR & Upload**: Hook backend inserito, selettore file integrato.
- [x] **Deploy Security Rules & Indici**: Regole di Firestore e Storage corrette e rafforzate.
- [x] **Test Admin Dashboard**: Potenziato il form builder con tipi documento e vincoli `required`.

## 🏗️ Fase 2: Configurazione Ambienti Store (✅ COMPLETATA)
*Preparazione dell'identità dell'app sugli store digitali.*

- [x] **Creazione Keystore (Android)**: Già presente e configurata in `build.gradle.kts`.
- [x] **Bundle ID & Provisioning (iOS)**: Bundle ID `com.euclaim.mobile` verificato e coerente.
- [x] **Google Play Console & App Store Connect**: Struttura pronta per il caricamento.
- [x] **Privacy Policy**: [PRIVACY_POLICY.md](file:///c:/Users/Commerciale/Documents/EUclaim/euclaim_mobile/PRIVACY_POLICY.md) creata e approvata.

## 💰 Fase 3: RevenueCat & Monetizzazione (🚀 IN CORSO)
*Collegamento dell'economia dell'app. (Posticipato come richiesto)*

- [ ] **Creazione Account RevenueCat**: Seguire la [Guida Setup](file:///C:/Users/Commerciale/.gemini/antigravity/brain/72792d97-2e0a-4048-8aec-23cbb56919af/revenuecat_setup_guide.md).
- [x] **Definizione Id Prodotti**: Logica per `single_claim` e `bundle_3_claims` implementata.
- [ ] **Inserimento API Keys**: Da sostituire in `paywall_provider.dart` una volta generate.

## 🏁 Fase 4: Beta Rilascio (Settimana 4)
*Il momento della verità.*

- [ ] **Upload in Test Interno (Play Store)**: Invito di 20 tester (obbligatorio per i nuovi account Google Play).
- [ ] **Test Flight (iOS)**: Invito ai primi tester su iPhone.
- [ ] **Feedback Loop**: Raccolta di eventuali bug tecnici segnalati dai primi utenti reali.

---

> [!TIP]
> **Consiglio**: Possiamo iniziare subito con la **Fase 1**, verificando se ci sono "buchi" logici nei form dinamici attuali. Vuoi procedere con un controllo del database `claims_catalog`?
