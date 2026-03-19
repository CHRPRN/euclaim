# Piano di Test Dettagliato

## 1. Test Unitari (Mobile)
- `auth_provider_test.dart`: Testare login/logout con mock di FirebaseAuth.
- `claims_provider_test.dart`: Testare il recupero e la gestione del catalogo cause.
- `upload_provider_test.dart`: Testare la logica di upload e validazione documenti.
- `paywall_provider_test.dart`: Testare la logica di sblocco basata su RevenueCat.

## 2. Test di Widget (Mobile)
- `login_screen_test.dart`: Verificare la UI di login e la validazione dei campi.
- `dynamic_claim_form_test.dart`: Verificare la generazione dinamica dei campi del form.
- `paywall_screen_test.dart`: Verificare la visualizzazione dei piani di abbonamento.

## 3. Test di Integrazione (Mobile)
- `full_claim_flow_test.dart`: Flusso completo: Login -> Selezione Causa -> Compilazione Form -> Upload Documenti -> Pagamento.

## 4. Test di Widget (Admin)
- `admin_dashboard_test.dart`: Verificare la visualizzazione della dashboard.
- `add_claim_screen_test.dart`: Verificare la creazione di una nuova causa.
- `applications_list_screen_test.dart`: Verificare la lista delle pratiche utente.
