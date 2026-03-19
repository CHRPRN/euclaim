# Guida alla Verifica Configurazione Firebase (Produzione)

## 1. Accesso alla Console Firebase
- Vai su [https://console.firebase.google.com/](https://console.firebase.google.com/).
- Seleziona il progetto `EUClaim`.

## 2. Verifica Servizi
- **Authentication:**
  - Vai in *Build > Authentication > Sign-in method*.
  - Assicurati che i provider necessari (Email/Password, Google, ecc.) siano abilitati.
- **Firestore:**
  - Vai in *Build > Firestore Database*.
  - Verifica che il database sia creato e che la posizione sia corretta.
  - Vai nella scheda *Rules* e assicurati che corrispondano al file `firestore.rules` nel progetto.
- **Storage:**
  - Vai in *Build > Storage*.
  - Verifica che il bucket sia creato e che le regole di accesso siano corrette.
- **Cloud Functions:**
  - Vai in *Build > Functions*.
  - Verifica che le funzioni siano state deployate correttamente.

## 3. Configurazione Mobile
- **Android:**
  - Scarica il file `google-services.json` aggiornato dalla console (*Project settings > General > Your apps*).
  - Sostituisci il file esistente in `euclaim_mobile/android/app/`.
- **iOS:**
  - Scarica il file `GoogleService-Info.plist` aggiornato dalla console.
  - Sostituisci il file esistente in `euclaim_mobile/ios/Runner/`.

## 4. Deploy (CLI)
Esegui i seguenti comandi dalla root del progetto per deployare le regole e le funzioni:
```bash
# Deploy regole Firestore
firebase deploy --only firestore:rules

# Deploy Cloud Functions
firebase deploy --only functions
```
*Nota: Assicurati di avere la Firebase CLI installata e di essere autenticato (`firebase login`).*
