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

Future<String?> createAppsFlyerLink(String restaurantID) async {
  // Add your function code here!

  // Initialize the AppsFlyer SDK
  Map<String, dynamic> options = {
    "afDevKey": "QGEvfeto5qNEsRTYLdJzXF", // Replace with your AppsFlyer Dev Key
    "appId": "6737909557", // iOS App ID (can be empty for Android)
    "isDebug": true, // Set to false in production
  };

  AppsflyerSdk appsflyerSdk = AppsflyerSdk(options);

  // Construct the deep link URL with the restaurantID
  Uri deepLink = Uri.parse(
    'https://yumspot.onelink.me/tBft/restaurant_details?restaurantID=$restaurantID',
  );

  AppsFlyerInviteLinkParams params = AppsFlyerInviteLinkParams(
    referrerName: 'John Doe', // Name of the referrer
    baseDeepLink:
        'https://yumspot.onelink.me/tBft/restaurant?restaurantID=123', // Your deep link
    referreImageUrl:
        'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630', // Image for the referrer
  );
  print("we are here ");
  try {
    appsflyerSdk.generateInviteLink(
      params,
      (dynamic inviteLink) {
        // Handle success: This is the callback for when the invite link is generated successfully
        print('Invite link generated: $inviteLink');
        //return inviteLink;
      },
      (dynamic error) {
        // Handle error: This is the callback for when there is an error generating the invite link
        print('Error generating invite link: $error');
        //return "a problem";
      },
    );
  } catch (e) {
    print("Somthing wrong happend $e");
  }

  return "final value";

  // Return the generated short link
}
