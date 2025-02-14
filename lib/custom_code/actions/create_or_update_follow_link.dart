// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future createOrUpdateFollowLink(
  String path,
  DateTime expires,
  String ogDescription,
  String ogImage,
  String ogTitle,
) async {
  // Add your function code here!
  final collectionRef = FirebaseFirestore.instance.collection('_flowlinks_');
  final querySnapshot =
      await collectionRef.where('path', isEqualTo: path).get();

  if (querySnapshot.docs.isNotEmpty) {
    final docRef = querySnapshot.docs.first.reference;
    await docRef.set({
      'expires': expires,
      'og:description': ogDescription,
      'og:image': ogImage,
      'og:title': ogTitle,
      'path': path,
      'redirectToStore': true,
      'redirectUrl': "",
    }, SetOptions(merge: true));
  } else {
    await collectionRef.add({
      'expires': expires,
      'og:description': ogDescription,
      'og:image': ogImage,
      'og:title': ogTitle,
      'path': path,
      'redirectToStore': true,
      'redirectUrl': "",
    });
  }
}
