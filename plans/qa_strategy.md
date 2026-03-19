# Strategia di QA e Test di Integrazione

## Obiettivo
Garantire la stabilità e l'affidabilità dell'ecosistema EUClaim, coprendo i flussi critici dell'utente e dell'amministratore.

## Componenti Critici da Testare
1. **Autenticazione (Mobile & Admin):** Login, registrazione, recupero password.
2. **Motore Dinamico (Mobile):** Caricamento e validazione dei form basati su `claims_catalog`.
3. **Flusso OCR & Upload (Mobile):** Caricamento documenti, elaborazione OCR, salvataggio in Firestore.
4. **Pagamenti (Mobile):** Integrazione RevenueCat, sblocco funzionalità.
5. **Gestione Pratiche (Admin):** Visualizzazione, aggiornamento stato, gestione documenti.

## Approccio ai Test
- **Test Unitari:** Per logica di business (Provider Riverpod, Utility).
- **Test di Widget:** Per componenti UI critici.
- **Test di Integrazione:** Per flussi end-to-end (es. Login -> Selezione Causa -> Upload Documento -> Pagamento).

## Strumenti
- `flutter_test` (Unit & Widget)
- `integration_test` (Integrazione)
- `mockito` / `mocktail` (Mocking di Firebase e servizi esterni)
