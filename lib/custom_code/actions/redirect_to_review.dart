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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

Future<void> redirectToReview() async {
  String appPackageName = 'fr.yumspot.yumspot'; // Android Package Name
  String appStoreId = '6737909557'; // iOS App Store ID

  if (Platform.isAndroid) {
    // Android: Redirect to Google Play Store
    final googlePlayReviewUrl = 'market://details?id=$appPackageName';
    if (await canLaunch(googlePlayReviewUrl)) {
      await launch(googlePlayReviewUrl);
    } else {
      final googlePlayWebUrl =
          'https://play.google.com/store/apps/details?id=$appPackageName';
      if (await canLaunch(googlePlayWebUrl)) {
        await launch(googlePlayWebUrl);
      } else {
        throw 'Could not launch $googlePlayWebUrl';
      }
    }
  } else if (Platform.isIOS) {
    // iOS: Redirect to App Store
    final appStoreReviewUrl =
        'https://apps.apple.com/app/id$appStoreId?action=write-review';
    if (await canLaunch(appStoreReviewUrl)) {
      await launch(appStoreReviewUrl);
    } else {
      throw 'Could not launch $appStoreReviewUrl';
    }
  } else {
    throw 'Unsupported platform';
  }
}
