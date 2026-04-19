// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> deleteReferenciasUsuario(DocumentReference usuario) async {
  int contador = 0;
  final db = FirebaseFirestore.instance;

  Future<int> deleteQueryDocs(QuerySnapshot snapshot) async {
    if (snapshot.docs.isEmpty) {
      return 0;
    }
    await Future.wait(
      snapshot.docs.map((registro) => registro.reference.delete()),
    );
    return snapshot.docs.length;
  }

  // Borrado en chat_messages
  contador += await deleteQueryDocs(
    await db.collection('chat_messages').where('user', isEqualTo: usuario).get(),
  );
  // Borrado en encuestas
  contador += await deleteQueryDocs(
    await db.collection('encuestas').where('usuario', isEqualTo: usuario).get(),
  );
  // Borrado en formatosFirmados
  contador += await deleteQueryDocs(
    await db
        .collection('formatosFirmados')
        .where('usuario', isEqualTo: usuario)
        .get(),
  );
  // Borrado en incidencias
  contador += await deleteQueryDocs(
    await db
        .collection('incidencias')
        .where('enviadoPor', isEqualTo: usuario)
        .get(),
  );
  // Borrado en noticias
  contador += await deleteQueryDocs(
    await db
        .collection('noticias')
        .where('enviadoPor', isEqualTo: usuario)
        .get(),
  );
  // Borrado en notificaciones
  contador += await deleteQueryDocs(
    await db
        .collection('notificaciones')
        .where('enviadoPor', isEqualTo: usuario)
        .get(),
  );
  // Borrado en preguntas
  contador += await deleteQueryDocs(
    await db
        .collection('preguntas')
        .where('creadaPor', isEqualTo: usuario)
        .get(),
  );
  // Borrado en chats
  final QuerySnapshot chats =
      await db.collection('chats').where('users', arrayContains: usuario).get();
  for (final QueryDocumentSnapshot documentos8 in chats.docs) {
    final List<dynamic> userschat = List<dynamic>.from(documentos8.get('users') as List? ?? []);
    userschat.remove(usuario);
    await documentos8.reference.update({'users': userschat});
    contador = contador + 1;
  }
  // Quitar usuario de Destinatarios en incidencias
  final QuerySnapshot incidenciasL = await db
      .collection('incidencias')
      .where('Destinatarios', arrayContains: usuario)
      .get();
  for (final QueryDocumentSnapshot documentos9 in incidenciasL.docs) {
    final List<dynamic> destinatarios =
        List<dynamic>.from(documentos9.get('Destinatarios') as List? ?? []);
    destinatarios.remove(usuario);
    await documentos9.reference.update({'Destinatarios': destinatarios});
    contador = contador + 1;
  }
  // Quitar usuario de likes en noticias
  final QuerySnapshot noticiasL = await db
      .collection('noticias')
      .where('likes', arrayContains: usuario)
      .get();
  for (final QueryDocumentSnapshot documentos10 in noticiasL.docs) {
    final List<dynamic> likes =
        List<dynamic>.from(documentos10.get('likes') as List? ?? []);
    likes.remove(usuario);
    await documentos10.reference.update({'likes': likes});
    contador = contador + 1;
  }
  // Quitar usuario de destinatarios en notificaciones
  final QuerySnapshot notificacionesL = await db
      .collection('notificaciones')
      .where('destinatarios', arrayContains: usuario)
      .get();
  for (final QueryDocumentSnapshot documentos11 in notificacionesL.docs) {
    final List<dynamic> destinatarios =
        List<dynamic>.from(documentos11.get('destinatarios') as List? ?? []);
    destinatarios.remove(usuario);
    await documentos11.reference.update({'destinatarios': destinatarios});
    contador = contador + 1;
  }
  // Quitar usuario de listaUsuarios en preguntas
  final QuerySnapshot preguntasL = await db
      .collection('preguntas')
      .where('listaUsuarios', arrayContains: usuario)
      .get();
  for (final QueryDocumentSnapshot documentos12 in preguntasL.docs) {
    final List<dynamic> listaUsuarios =
        List<dynamic>.from(documentos12.get('listaUsuarios') as List? ?? []);
    listaUsuarios.remove(usuario);
    await documentos12.reference.update({'listaUsuarios': listaUsuarios});
    contador = contador + 1;
  }
  return contador;
}
