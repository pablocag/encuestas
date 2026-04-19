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

Future<String> godActualizarPromotores() async {
  // update rating field with length of hijos in users collection
// Assuming that the users collection has a field called "hijos" which is an array of children

  final usersCollection = FirebaseFirestore.instance.collection('users');
  final usersSnapshot = await usersCollection.get();

  for (final userDoc in usersSnapshot.docs) {
    // await usersCollection
    //     .doc(userDoc.id)
    //     .update({'pinCode': FieldValue.delete()});
    if (userDoc.data().containsKey('Hijos')) {
      final hijosLength = userDoc.data()['Hijos'].length;
      await usersCollection.doc(userDoc.id).update({'rating': hijosLength});
    }
  }
  return "OK";
}
