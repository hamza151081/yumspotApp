import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start supabase Group Code

class SupabaseGroup {
  static String getBaseUrl() =>
      'https://tzhhvtgdgepliuahforc.supabase.co/rest/v1/';
  static Map<String, String> headers = {
    'apiKey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR6aGh2dGdkZ2VwbGl1YWhmb3JjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY0MTIzMjUsImV4cCI6MjA0MTk4ODMyNX0.RW8TMLHh9kcIZEFhmnwC4X38R3eANgNr5vqnxsamEdU',
  };
  static NearbyVideosCall nearbyVideosCall = NearbyVideosCall();
  static NearbyRestaurantsCall nearbyRestaurantsCall = NearbyRestaurantsCall();
}

class NearbyVideosCall {
  Future<ApiCallResponse> call({
    double? latfn = 48.8916729,
    double? longfn = 2.3725669,
    double? radius,
    String? filterType = '',
    List<String>? filterCategoryList,
    double? filterRating = 0,
    String? filterOpen = '',
    String? filterSearchTerm = '',
    String? userIdPram = '',
    String? onlyFavoris = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();
    final filterCategory = _serializeList(filterCategoryList);

    final ffApiRequestBody = '''
{
  "latfn": ${latfn},
  "longfn": ${longfn},
  "radius": ${radius},
  "filter_type": "${filterType}",
  "filter_category": ${filterCategory},
  "filter_rating": ${filterRating},
  "filter_open": "${filterOpen}",
  "filter_search_term": "${filterSearchTerm}",
  "user_id_pram": "${userIdPram}",
  "only_favoris": "${onlyFavoris}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'nearby videos',
      apiUrl: '${baseUrl}rpc/nearby_videos',
      callType: ApiCallType.POST,
      headers: {
        'apiKey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR6aGh2dGdkZ2VwbGl1YWhmb3JjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY0MTIzMjUsImV4cCI6MjA0MTk4ODMyNX0.RW8TMLHh9kcIZEFhmnwC4X38R3eANgNr5vqnxsamEdU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NearbyRestaurantsCall {
  Future<ApiCallResponse> call({
    double? latfn = 48.8916729,
    double? longfn = 2.3725669,
    double? radius,
    String? filterType = '',
    List<String>? filterCategoryList,
    double? filterRating = 0,
    String? filterOpen = '',
    String? userIdPram = '',
    String? onlyFavoris = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();
    final filterCategory = _serializeList(filterCategoryList);

    final ffApiRequestBody = '''
{
  "latfn": ${latfn},
  "longfn": ${longfn},
  "radius": ${radius},
  "filter_type": "${filterType}",
  "filter_category": ${filterCategory},
  "filter_rating": ${filterRating},
  "filter_open": "${filterOpen}",
  "user_id_pram": "${userIdPram}",
  "only_favoris": "${onlyFavoris}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'nearby restaurants',
      apiUrl: '${baseUrl}rpc/nearby_restaurants',
      callType: ApiCallType.POST,
      headers: {
        'apiKey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR6aGh2dGdkZ2VwbGl1YWhmb3JjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY0MTIzMjUsImV4cCI6MjA0MTk4ODMyNX0.RW8TMLHh9kcIZEFhmnwC4X38R3eANgNr5vqnxsamEdU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End supabase Group Code

class GoogleGetLatlongForAnAdresseCall {
  static Future<ApiCallResponse> call({
    String? cityOrPostalCode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google get latlong for an adresse',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?address=${cityOrPostalCode}&components=country:FR&key=AIzaSyC2HsS2-0yw-MS1vtyUdp4942w07wyTl48',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<ResultApiSearchPlaceStruct>? result(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ResultApiSearchPlaceStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
