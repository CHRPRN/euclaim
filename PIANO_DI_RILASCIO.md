# Obiettivo di Rilascio: EUClaim Closed Beta

Questo documento descrive la checklist operativa e i comandi necessari per il Deployment in produzione dei 3 macro-sistemi di EUClaim: Backend (Firebase), Web Admin Dashboard e Mobile App (inclusi i pagamenti con RevenueCat).

---

## Stream 1: Firebase Production Deployment (Backend)
**Target:** Passare dall'Emulatore all'ambiente live per Cloud Functions, Security Rules e Database.

### Checklist
- [ ] Effettuare il login alla CLI Firebase con l'account corretto.
- [ ] Selezionare l'ambiente/progetto Firebase di produzione.
- [ ] Eseguire il deploy delle Cloud Functions.
- [ ] Eseguire il deploy delle Security Rules per Firestore e Storage.
- [ ] Eseguire il deploy degli Indici Composti (necessari per la dashboard).

### Comandi Operativi

```bash
# 1. Login e selezione progetto
firebase login
firebase use <ID_PROGETTO_PRODUZIONE>

# 2. Setup e deploy Cloud Functions
cd functions
npm install
# npm run build  # <- Decommentare se il progetto usa TypeScript
cd ..
firebase deploy --only functions

# 3. Deploy delle Security Rules definitive
firebase deploy --only firestore:rules,storage

# 4. Deploy degli Indici Composti per le query
# (Assicurarsi che firestore.indexes.json contenga gli indici necessari come filtri per stato e data)
firebase deploy --only firestore:indexes

# NOTA: Per un deploy compatto di tutto in un colpo solo, puoi eseguire:
# firebase deploy --only functions,firestore,storage
```

---

## Stream 2: Web Admin Dashboard Deployment
**Target:** Rendere la dashboard accessibile allo staff EUClaim.

### Checklist
- [ ] Compilazione ottimizzata del progetto Flutter nel formato Web.
- [ ] Configurazione o aggiornamento del target Firebase Hosting.
- [ ] Deploy dei file statici.
- [ ] Promozione del tuo account a "Admin" nel database live per avere accesso operativo.

### Comandi Operativi

```bash
# Assicurati di essere nella root del progetto Web Admin (o progetto unico se condiviso)
# 1. Pulizia e Compilazione ottimizzata con canvas-kit per migliori performance (se appropriato)
flutter clean
flutter pub get
flutter build web --release

# 2. Deploy su Firebase Hosting
# Assicurati che nel file firebase.json l'hosting punti alla cartella build/web/
firebase deploy --only hosting
```

### Azione Manuale (Setup Admin):
1. Vai sulla **Firebase Console** -> **Authentication**.
2. Identifica il tuo account utente (loggati prima dalla Web App o Mobile) e copia il tuo `UID`.
3. Vai in **Firestore Database**.
4. Cerca (o crea se non esiste) la collection `admins`.
5. Aggiungi un documento usando il tuo `UID` come ID del documento, e aggiungi i campi necessari per abilitare il ruolo (es. `role: "admin"`, `email: "tua@email.com"`).

---

## Stream 3: Preparazione RevenueCat (Pagamenti)
**Target:** Passare dall'ambiente Sandbox agli store reali e configurare i prodotti.

### Checklist (Azione Manuale da Console RevenueCat)
Questo stream è prettamente operativo sulle dashboard, non richiede comandi CLI.

- [ ] **Creazione App in RevenueCat:** Assicurarsi di aver creato i due "App Store" (Apple App Store e Google Play Store) all'interno del progetto RevenueCat.
- [ ] **Collegamento API Key Google Play:** 
  - Ottenere la chiave dell'API Account di Servizio dalla Google Developer Console.
  - Caricare il file JSON delle credenziali in RevenueCat (Project Settings -> Apps -> Google Play).
- [ ] **Collegamento API Key iOS App Store:** 
  - Fornire la "Shared Secret" (generata su App Store Connect) e opzionalmente l'In-App Purchase Key (p8) a RevenueCat.
- [ ] **Creazione di Entitlements e Prodotti:**
  - **Identificatori Prodotti:** Crea le In-App Purchases sui portali (Google Play Console e App Store Connect). Es. `euclaim_standard_pratica`.
  - **Products in RC:** Aggiungi i prodotti con gli *esatti product identifiers* settati negli Store. Trattandosi di pratiche, dovrebbero essere di tipo "Non-Renewing Subscription" o "Consumable" a seconda del modello business scelto.
  - **Entitlements:** Crea l'Entitlement (es. `pro_claim_access`) e associalo al Product precedentemente creato.
  - **Offerings:** Crea l'Offering "Current" o "Default" ed esponi i prodotti in questo contenitore. L'app Fetching deve puntare a questo offering.

---

## Stream 4: Mobile Stores Setup & Closed Beta (Android First)
**Target:** Rendere l'Android App bundle pronto e invitare i primi tester reali limitati.

### Checklist
- [ ] Creazione del file Keystore per firmare crittograficamente l'app.
- [ ] Configurazione in `android/app/build.gradle` e `key.properties`.
- [ ] Creazione del formato AAB (Android App Bundle).
- [ ] Configurazione della Google Play Console e upload in "Internal Testing".

### Comandi Operativi per la Build

```bash
# Esegui da dentro la cartella del progetto Flutter Mobile (es. euclaim_mobile)

# 1. Generazione della Keystore per firmare la release
# NOTA: Consigliato salvare questo file in android/app/upload-keystore.jks e NON pusharlo su git pubblico.
# Ricorda bene la password e l'alias!
keytool -genkey -v -keystore android/app/upload-keystore.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000

# 2. Crea o aggiorna il file android/key.properties con le credenziali (non includerlo nei git commit)
# Esempio:
# storePassword=<tua-password>
# keyPassword=<tua-password>
# keyAlias=upload
# storeFile=upload-keystore.jks

# 3. Compilazione del formato moderno per Google Play (AppBundle)
flutter clean
flutter pub get
flutter build appbundle --release
# Il risultato sarà salvato tipicamente in: build/app/outputs/bundle/release/app-release.aab
```

### Setup Google Play Console (Azione Manuale)
1. Crea la nuova app in **Google Play Console**.
2. **Setup App:** Compila tutti i questionari richiesti: Rating Contenuti, Privacy Policy (serve un URL live), Target Audience, Accesso all'App.
3. **Store Listing provvisorio:** Carica un'icona (512x512), banner feature (1024x500) e 2-3 screenshot di base dell'app.
4. Vai in **Test -> Internal Testing** (Test Interno o Closed Beta).
5. Crea una **Nuova Release**, caricando il file `.aab` generato.
6. Crea o aggiorna una **Email List** per i tester e inserisci gli indirizzi Gmail/Google dei tester selezionati.
7. Pubblica la release sul track Interno. I tester riceveranno il link di adesione ("Opt-in link") che consentirà loro di scaricare l'app direttamente dal Play Store e testare sia l'OCR che gli "In-App Purchases" usando i test accounts.
