import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

double? gatLat(LatLng? location) {
  // from the location
  //print(location?.latitude);
  if (location?.latitude == 0.0) {
    return 48.86127709498337;
  }
  return location?.latitude;
}

double? getLong(LatLng? location) {
  // get longitude from location
  // from the location
  //print(location?.longitude);
  //print("I am in the function ");
  if (location?.longitude == 0.0) {
    print("location is at 0");
    return 2.2951650141271576;
  }
  return location?.longitude;
}

List<RestaurantsRow> convertJsonToRowRestaurants(List<dynamic>? jsonInput) {
  // convert the list of json to row restaurants
  List<RestaurantsRow> rowRestaurants = [];

  if (jsonInput != null) {
    for (var json in jsonInput) {
      if (json is Map<String, dynamic> && json.containsKey('distance')) {
        json.remove('distance');
      }
      RestaurantsRow row = RestaurantsRow(json);
      rowRestaurants.add(row);
    }
  }

  return rowRestaurants;
}

List<VideoAndRestaurantStruct>? shaffelVideos(
    List<VideoAndRestaurantStruct>? videosandRestaurants) {
  // shafelle the list and return it
  if (videosandRestaurants == null || videosandRestaurants.isEmpty) {
    return null;
  }

  final List<VideoAndRestaurantStruct> shuffledList =
      List.from(videosandRestaurants)..shuffle();

  return shuffledList;
}

String? calculateDistance(
  double? restaurantLat,
  double? restaurantLong,
  double? userLat,
  double? userLong,
) {
  // Calculate distance in km and return 2 decimal places
  if (restaurantLong == null ||
      restaurantLat == null ||
      userLat == null ||
      userLong == null) {
    return null;
  }

  const double earthRadius = 6371.0; // Earth radius in kilometers

  // Function to convert degrees to radians
  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  final double lat1 = degreesToRadians(userLat);
  final double lon1 = degreesToRadians(userLong);
  final double lat2 = degreesToRadians(restaurantLat);
  final double lon2 = degreesToRadians(restaurantLong);

  final double dLat = lat2 - lat1;
  final double dLon = lon2 - lon1;

  // Haversine formula
  final double a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  final double distance = earthRadius * c;

  return distance.toStringAsFixed(2);
}

String replaceExtention(String link) {
  // remve the last 3 carachter from the link and replace them by png
  return link.substring(0, link.length - 3) + 'png?authuser=0';
}

List<OpeningGetterStruct> todatOpeningAndClosing(
  DateTime currenttime,
  dynamic openingperiods,
) {
// Ensure we have a valid current time
  final now = currenttime;
  final currentDay = now.weekday; // 1 = Monday, 7 = Sunday
  List<OpeningGetterStruct> openCloseTimes =
      []; // List to hold open and close times

  // Ensure opening periods are provided and valid
  if (openingperiods == null || openingperiods.isEmpty) {
    return openCloseTimes; // Return empty list if no opening periods
  }

  // Iterate over the opening periods
  for (final period in openingperiods) {
    final openDay = period['open']['day']; // Day the restaurant opens
    final openTime = period['open']['time']; // Opening time
    final closeTime = period['close']['time']; // Closing time

    // Check if the current day matches the open day
    if (currentDay == openDay) {
      // Add current day's open and close times to the list
      openCloseTimes.add(
        OpeningGetterStruct(
          openAt:
              '${openTime.substring(0, 2)}:${openTime.substring(2, 4)}', // Format as "HH:MM"
          closeAt:
              '${closeTime.substring(0, 2)}:${closeTime.substring(2, 4)}', // Format as "HH:MM"
        ),
      );
    } else if (currentDay < openDay) {
      // If it's before the opening day, add to list and break
      openCloseTimes.add(
        OpeningGetterStruct(
          openAt:
              '${openTime.substring(0, 2)}:${openTime.substring(2, 4)}', // Format as "HH:MM"
          closeAt:
              '${closeTime.substring(0, 2)}:${closeTime.substring(2, 4)}', // Format as "HH:MM"
        ),
      );
      break; // Stop processing as we found the next day's hours
    }
  }

  return openCloseTimes; // Return the list of opening and closing times
}

LatLng convertToLatlng(
  double lat,
  double lng,
) {
  // convert to LatLng
  return LatLng(lat, lng);
}

int calculateVieaw(int currentVieawNumber) {
  final random = math.Random();
  int result = currentVieawNumber < 100
      ? random.nextInt(901) + 100
      : currentVieawNumber + 1;
  return result;
}

bool isRestaurantOpen(List<String> openingHours) {
  print("opening hours");
  print(openingHours);
  DateTime now = DateTime.now();
  String currentTimeStr =
      now.toIso8601String().substring(11, 16); // HH:mm format

  // Mapping weekday numbers to French day names
  Map<int, String> dayMap = {
    1: 'lundi',
    2: 'mardi',
    3: 'mercredi',
    4: 'jeudi',
    5: 'vendredi',
    6: 'samedi',
    7: 'dimanche'
  };

  // Get today's French day name
  String todayKey = dayMap[now.weekday]!;

  // Find today's opening hours from the list
  String todayHours = openingHours
      .firstWhere((line) => line.startsWith(todayKey), orElse: () => '');

  // Check if restaurant is closed today
  if (todayHours.contains('Fermé')) {
    print("decision hours");
    print(false);
    return false;
  }

  // Extract the opening hours for today
  RegExp timeRegExp = RegExp(r'(\d{2}:\d{2}) – (\d{2}:\d{2})');
  Iterable<RegExpMatch> matches = timeRegExp.allMatches(todayHours);

  // Check current time against each time range
  for (var match in matches) {
    String openTimeStr = match.group(1)!;
    String closeTimeStr = match.group(2)!;

    DateTime openTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(openTimeStr.split(":")[0]),
        int.parse(openTimeStr.split(":")[1]));
    DateTime closeTime;

    // If closeTime is earlier than openTime, it means it extends to the next day
    if (openTimeStr.compareTo(closeTimeStr) > 0) {
      closeTime = DateTime(
          now.year,
          now.month,
          now.day + 1,
          int.parse(closeTimeStr.split(":")[0]),
          int.parse(closeTimeStr.split(":")[1]));
    } else {
      closeTime = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(closeTimeStr.split(":")[0]),
          int.parse(closeTimeStr.split(":")[1]));
    }

    // Check if the current time is within the open hours
    if (now.isAfter(openTime) && now.isBefore(closeTime)) {
      print("decision hours");
      print(true);
      return true; // Current time is within the open hours
    }
  }

  print("decision hours");
  print(false);

  return false; // Outside all opening hours
}

List<OpeningGetterStruct> getOpeningHours(List<String> openingHours) {
  print("opening hours gettr");
  print(openingHours);
  DateTime now = DateTime.now();
  String currentTime = now
      .toIso8601String()
      .substring(11, 16); // Get current time in HH:mm format

  // Mapping weekday numbers to French day names
  Map<int, String> dayMap = {
    1: 'lundi',
    2: 'mardi',
    3: 'mercredi',
    4: 'jeudi',
    5: 'vendredi',
    6: 'samedi',
    7: 'dimanche'
  };

  // Get today's French day name
  String todayKey = dayMap[now.weekday]!;

  // Find today's opening hours from the list
  String todayHours = openingHours
      .firstWhere((line) => line.startsWith(todayKey), orElse: () => '');

  // Check if restaurant is closed today
  if (todayHours.contains('Fermé')) {
    print("decision opening");
    print([]);
    return [];
  }

  List<OpeningGetterStruct> openCloseTimes = [];
  // Extract the opening hours for today
  RegExp timeRegExp = RegExp(r'(\d{2}:\d{2}) – (\d{2}:\d{2})');
  Iterable<RegExpMatch> matches = timeRegExp.allMatches(todayHours);

  // Check current time against each time range
  for (var match in matches) {
    String openTime = match.group(1)!;
    String closeTime = match.group(2)!;

    openCloseTimes
        .add(OpeningGetterStruct(openAt: openTime, closeAt: closeTime));
  }

  print("decision hours");
  print(openCloseTimes);

  return openCloseTimes; // Outside all opening hours
}

int indexOfVideoID(
  List<VideoAndRestaurantStruct> listofdatatype,
  String videoID,
) {
  // find the index coreesponding to the video id
  for (int i = 0; i < listofdatatype.length; i++) {
    if (listofdatatype[i].videoId == videoID) {
      return i;
    }
  }
  return -1;
}

String videoUrlToString(String videoParh) {
  return videoParh;
}

int indexOfVideoOnrestauFeed(
  List<RestaurantVideosRow> restaurantVideos,
  String videoID,
) {
  for (int i = 0; i < restaurantVideos.length; i++) {
    if (restaurantVideos[i].videoId == videoID) {
      return i;
    }
  }
  return -1;
}

List<String> splitOpeningHours(String? weekdayText) {
  // If weekdayText is null, return default message
  if (weekdayText == null || weekdayText.isEmpty) {
    return [" ", "Information non disponible"];
  }

  // Split the string into the day and hours
  List<String> parts = weekdayText.split(':');

  if (parts.length < 2) {
    // If the restaurant is "Fermé" (Closed), return that it's closed today
    return [parts[0][0].toUpperCase() + parts[0].substring(1), "Fermé"];
  }

  // Return the weekday and the opening hours
  // Concatenate all parts except part[0]
  String openingHours =
      parts.sublist(1).join(':'); // Adjust the join character if needed

  return [parts[0][0].toUpperCase() + parts[0].substring(1), openingHours];
}

bool compareWaakDayOfGoogleAndCurrentDay(
  String weekday,
  DateTime curentTime,
) {
  // List of French weekdays
  List<String> weekdays = [
    'lundi',
    'mardi',
    'mercredi',
    'jeudi',
    'vendredi',
    'samedi',
    'dimanche'
  ];

  // Get the current weekday (Monday is 1, Sunday is 7 in Dart)
  int currentWeekdayIndex =
      curentTime.weekday - 1; // Adjust to start at 0 for Monday

  List<String> parts = weekday.split(':');
  print(parts);
  if (parts[0].trim() == weekdays[currentWeekdayIndex]) {
    return true;
  }

  return false;
}

String generateCdnnUrl(String initialUrl) {
  // replace "https://storage.googleapis.com/yum-spot-hjl93d.appspot.com/" in inital url by "http://34.160.93.71/"
  /*return initialUrl.replaceFirst(
    'https://storage.googleapis.com/yum-spot-hjl93d.appspot.com/',
    'http://34.160.93.71:80/',
  );*/
  return initialUrl;
}

String generateCDNImage(String initialUrl) {
  // replace "https://storage.googleapis.com/yum-spot-hjl93d.appspot.com/" in inital url by "http://34.160.93.71/"
  /*return initialUrl.replaceFirst(
    'https://storage.googleapis.com/yum-spot-hjl93d.appspot.com/',
    'http://34.160.93.71:80/',
  );*/
  return initialUrl;
}

String? getWeekDayForCurrentDay(List<String>? weekdays) {
  if (weekdays == null) {
    return null;
  }
  DateTime now = DateTime.now();
  String currentTime = now
      .toIso8601String()
      .substring(11, 16); // Get current time in HH:mm format

  // Mapping weekday numbers to French day names
  Map<int, String> dayMap = {
    1: 'lundi',
    2: 'mardi',
    3: 'mercredi',
    4: 'jeudi',
    5: 'vendredi',
    6: 'samedi',
    7: 'dimanche'
  };

  // Get today's French day name
  String todayKey = dayMap[now.weekday]!;

  // Find today's opening hours from the list
  String todayWeekText = weekdays
      .firstWhere((line) => line.startsWith(todayKey), orElse: () => '');

  return todayWeekText;
}

List<int>? generateRandList(List<RestaurantVideosRow>? lisofRows) {
  // Check if the list is null
  if (lisofRows == null) {
    return null;
  }

  // Get the length of the list
  int len = lisofRows.length;

  // Determine the end range, if length is even, we divide by 2, if odd, divide by 2 and add 1
  int rangeEnd = (len % 2 == 0) ? len ~/ 2 : (len ~/ 2) + 1;

  // Generate list of even indexes [0, 2, 4, ...] up to rangeEnd
  List<int> result = List.generate(rangeEnd, (index) => index * 2);
  print("generated list $result");

  return result;
}

String generateMessageShareApp() {
  return '''
Salut ! J’ai découvert une super appli pour trouver les meilleurs restos et pâtisseries : Yum Spot. Elle te propose des adresses près de chez toi, des avis, des vidéos et plein de recommandations personnalisées. Télécharge-la ici :

Android : https://play.google.com/store/apps/details?id=fr.yumspot.yumspot
Apple Store : https://apps.apple.com/us/app/nuanz/6737909557

Rejoins-moi sur Yum Spot pour découvrir des pépites gourmandes ! 😋🍽️


  ''';
}

String? getLastNameFromDesplayName(String? desplayname) {
  // deplayname in general is fromed as FirstName + LastName i want to get last name the desplayname could sometime includ just just the firstname
  if (desplayname == null || desplayname.isEmpty) {
    return null;
  }

  List<String> nameParts = desplayname.split(' ');
  if (nameParts.length == 1) {
    return '';
  } else {
    return nameParts.last;
  }
}

String? getFisrtNameFromDesplayName(String? desplayname) {
  if (desplayname == null || desplayname.isEmpty) {
    return null;
  }

  List<String> nameParts = desplayname.split(' ');
  if (nameParts.length == 1) {
    return nameParts[0];
  } else {
    return nameParts.first;
  }
}
