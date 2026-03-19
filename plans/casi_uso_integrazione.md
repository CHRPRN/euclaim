# Casi d'uso critici per Test di Integrazione (Firebase Emulator)

## 1. Flusso di Autenticazione (Mobile)
- **Scenario:** Registrazione nuovo utente con email/password.
- **Verifica:** Creazione documento in `users` su Firestore, verifica stato autenticazione.

## 2. Flusso di Creazione Pratica (Mobile)
- **Scenario:** Selezione causa dal `claims_catalog`, compilazione form dinamico, salvataggio in `user_applications`.
- **Verifica:** Presenza documento in `user_applications` con dati corretti.

## 3. Flusso di Upload Documenti (Mobile)
- **Scenario:** Caricamento documento per una pratica esistente.
- **Verifica:** Upload su Storage, aggiornamento campo `documents` in `user_applications`.

## 4. Flusso di Pagamento (Mobile)
- **Scenario:** Tentativo di accesso a funzionalità premium senza abbonamento attivo.
- **Verifica:** Reindirizzamento al paywall, sblocco dopo simulazione acquisto.

## 5. Flusso di Gestione Pratica (Admin)
- **Scenario:** Admin visualizza lista pratiche, cambia stato di una pratica.
- **Verifica:** Aggiornamento campo `status` in `user_applications` su Firestore.
