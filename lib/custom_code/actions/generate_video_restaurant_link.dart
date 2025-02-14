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

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<String> generateVideoRestaurantLink(
  String restaurantID,
  String videoID,
  String title,
  String imageUrl,
  bool forceRedirect,
) async {
  // Add your function code here!
  final Uri deepLink = Uri.parse(
    'https://yumspot.page.link/feedrestaurant?restaurantID=$restaurantID&videoID=$videoID',
  );

  final dynamicLinkParams = DynamicLinkParameters(
    uriPrefix:
        'https://yumspot.page.link', // Use Firebase dynamic link URI prefix
    link: deepLink, // Must be a whitelisted URL
    androidParameters: const AndroidParameters(
      packageName: 'fr.yumspot.yumspot',
    ),
    iosParameters: const IOSParameters(
      bundleId: 'fr.yumspot.yumspot',
      appStoreId: '6737909557',
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      title: title,
      imageUrl: Uri.parse(imageUrl),
    ),
    googleAnalyticsParameters: GoogleAnalyticsParameters(
      campaign: 'video_restaurant',
      medium: 'social',
      source: 'app',
    ),
    navigationInfoParameters: NavigationInfoParameters(
      forcedRedirectEnabled: forceRedirect,
    ),
  );

  final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
    dynamicLinkParams,
    shortLinkType: ShortDynamicLinkType.unguessable,
  );

  return dynamicLink.shortUrl.toString();
}
