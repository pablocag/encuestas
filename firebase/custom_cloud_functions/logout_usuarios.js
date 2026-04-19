const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.logoutUsuarios = functions.https.onRequest(async (req, res) => {
  // Write your code below!
  try {
    const listUsersResult = await admin.auth().listUsers();
    const users = listUsersResult.users;

    const promises = users.map((user) => {
      return admin.auth().revokeRefreshTokens(user.uid);
    });

    await Promise.all(promises);

    res.status(200).send("Se han expirado todos los tokens de Uusarios");
  } catch (error) {
    console.error("Error al expirar los tokens de Usuario:", error);
    res
      .status(500)
      .send(
        "Ha ocurrido un error mientras se expiraban los Tokens de Usuarios",
      );
  }
  // Write your code above!
});
