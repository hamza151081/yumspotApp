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

import 'dart:io';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';

Future initializeAppsFlyer() async {
  // Add your function code here!
  Map<String, dynamic> options = {
    "afDevKey": "QGEvfeto5qNEsRTYLdJzXF", // Replace with your AppsFlyer Dev Key
    "isDebug": true, // Set to false in production
  };

  AppsflyerSdk appsflyerSdk = AppsflyerSdk(options);

  appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true);

  // Capture deep link data when the app is opened or comes from the background
  appsflyerSdk.onAppOpenAttribution((res) {
    print("Deep Link Data: $res");
    _handleDeepLink(res); // Handle the deep link
  });

  appsflyerSdk.onInstallConversionData((res) {
    print("Install Conversion Data: $res");
    _handleDeepLink(res); // Handle the deep link
  });
}

void _handleDeepLink(Map<dynamic, dynamic>? deepLinkData) {
  if (deepLinkData != null && deepLinkData["deep_link_value"] != null) {
    // Assuming the URL contained the "restaurantID" and "videoID"
    String restaurantID = deepLinkData["restaurantID"];

    FFAppState().appFlyerRestaurantID = restaurantID;
  }
}
