const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.checkUsuariosOnLine = functions
  .region("us-central1")
  .https.onCall(async (data, context) => {
    // Write your code below!
    if (context.auth.uid) {
      try {
        const currentTime = new Date();
        const limitTime = 3600 * 1000; // 1 hora en milisegundos
        const tiempo = currentTime - limitTime;
        const listUsersResult = await admin.auth().listUsers();
        const activeUserMails = listUsersResult.users
          .filter((user) => new Date(user.metadata.lastSignInTime) >= tiempo) // Filtrar usuarios que hayan iniciado sesión en la última hora
          .map((user) => user.email); // Obtener solo los email de los usuarios activos

        return { mails: activeUserMails };
      } catch (error) {
        console.error("Error al consultar los IDs Activos:", error);
        return "Ha ocurrido un error mientras se consultaban los IDs Activos";
      }
    }
    return {
      mails: "",
    };
  });
