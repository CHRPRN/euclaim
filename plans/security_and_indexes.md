# Piano Sicurezza e Indici Firestore

## Obiettivo
Garantire la sicurezza dei dati e ottimizzare le query Firestore.

## Sicurezza (Security Rules)
- `users`: Accesso in lettura/scrittura solo al proprietario.
- `claims_catalog`: Lettura pubblica, scrittura solo admin.
- `user_applications`: Lettura/scrittura solo al proprietario e admin.

## Indici Firestore
- Necessari per query complesse su `user_applications` (es. ordinamento per data, filtro per stato).

## Task
- [ ] Scrivere `firestore.rules`.
- [ ] Definire indici necessari in `firestore.indexes.json`.
- [ ] Testare le regole con Firebase Emulator.
