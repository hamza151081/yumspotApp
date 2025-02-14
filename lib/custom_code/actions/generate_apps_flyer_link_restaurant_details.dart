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

Future<String> generateAppsFlyerLinkRestaurantDetails(
    String restaurantID) async {
  // Add your function code here!
  // AppsFlyer OneLink base URL (replace with your actual OneLink domain)
  String baseUrl = "https://yumspot.onelink.me/tBft";

  // Construct deep link parameters
  Uri deepLink = Uri.parse("$baseUrl?deep_link_value=video_restaurant"
      "&restaurantID=$restaurantID");

  return deepLink.toString();
}
