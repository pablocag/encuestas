const admin = require("firebase-admin/app");
admin.initializeApp();

const logoutUsuarios = require("./logout_usuarios.js");
exports.logoutUsuarios = logoutUsuarios.logoutUsuarios;
const checkUsuariosOnLine = require("./check_usuarios_on_line.js");
exports.checkUsuariosOnLine = checkUsuariosOnLine.checkUsuariosOnLine;
