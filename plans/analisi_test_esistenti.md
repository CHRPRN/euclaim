# Analisi Test Esistenti

## Mobile (`euclaim_mobile/test/`)
- `notification_service_test.dart`: Test base per `NotificationService`. Attualmente verifica solo l'inizializzazione. Richiede mock per `FirebaseMessaging`.
- `widget_test.dart`: Test di base generato da Flutter.

## Admin (`euclaim_admin/test/`)
- `widget_test.dart`: Test di base generato da Flutter (Counter test).

## Osservazioni
La copertura dei test è minima. Non ci sono test unitari per i provider (Riverpod) o test di integrazione per i flussi critici (Auth, Dynamic Forms, Pagamenti).
