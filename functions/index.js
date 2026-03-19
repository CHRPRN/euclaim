const functions = require('firebase-functions');
const admin = require('firebase-admin');
const vision = require('@google-cloud/vision');
const PDFDocument = require('pdfkit');
const sgMail = require('@sendgrid/mail');

admin.initializeApp();
const sendgridKey = functions.config().sendgrid ? functions.config().sendgrid.key : null;
if (sendgridKey) {
    sgMail.setApiKey(sendgridKey);
}

exports.generateAndSendClaim = functions.firestore
    .document('user_applications/{applicationId}')
    .onUpdate(async (change, context) => {
        const newData = change.after.data();
        if (newData.status !== 'completed') return null;

        const doc = new PDFDocument();
        // Logica di generazione PDF...

        // Invio email
        await sgMail.send({
            to: newData.userEmail,
            from: 'noreply@euclaim.com',
            subject: 'Pratica EUClaim completata',
            text: 'La tua pratica è stata elaborata.',
        });

        return null;
    });

exports.sendNotificationOnStatusChange = functions.firestore
    .document('user_applications/{applicationId}')
    .onUpdate(async (change, context) => {
        const oldData = change.before.data();
        const newData = change.after.data();

        if (oldData.status === newData.status) return null;

        const userId = newData.userId;
        const userDoc = await admin.firestore().collection('users').doc(userId).get();
        const fcmTokens = userDoc.data().fcmTokens;

        if (fcmTokens && fcmTokens.length > 0) {
            const message = {
                notification: {
                    title: 'Aggiornamento Pratica',
                    body: `La tua pratica è ora: ${newData.status}`,
                },
                tokens: fcmTokens,
            };
            await admin.messaging().sendMulticast(message);
        }
    });

// Funzione OCR: Scatta quando un file viene caricato in applications/
exports.handleDocumentUpload = functions.storage.object().onFinalize(async (object) => {
    const filePath = object.name;
    if (!filePath.startsWith('applications/')) return null;

    const pathParts = filePath.split('/');
    if (pathParts.length < 4) return null;

    const applicationId = pathParts[1];
    const docId = pathParts[2];
    
    const client = new vision.ImageAnnotatorClient();
    // Esempio: const [result] = await client.textDetection(`gs://${object.bucket}/${filePath}`);
    
    // Per ora salviamo un segnaposto per indicare che il trigger funziona
    await admin.firestore().collection('user_applications').doc(applicationId).set({
        ocr_data: {
            [docId]: "Dati estratti dal documento..."
        },
        ocr_status: {
            [docId]: "processed"
        }
    }, { merge: true });

    console.log(`OCR triggerato per ${applicationId} - ${docId}`);
    return null;
});
