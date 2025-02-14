import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _distanceFilterKm =
          prefs.getInt('ff_distanceFilterKm') ?? _distanceFilterKm;
    });
    _safeInit(() {
      _isDarkMode = prefs.getString('ff_isDarkMode') ?? _isDarkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _distanceFilterKm = 20;
  int get distanceFilterKm => _distanceFilterKm;
  set distanceFilterKm(int value) {
    _distanceFilterKm = value;
    prefs.setInt('ff_distanceFilterKm', value);
  }

  List<VideoAndRestaurantStruct> _listShavelledVideosAndRestaurants = [];
  List<VideoAndRestaurantStruct> get listShavelledVideosAndRestaurants =>
      _listShavelledVideosAndRestaurants;
  set listShavelledVideosAndRestaurants(List<VideoAndRestaurantStruct> value) {
    _listShavelledVideosAndRestaurants = value;
  }

  void addToListShavelledVideosAndRestaurants(VideoAndRestaurantStruct value) {
    listShavelledVideosAndRestaurants.add(value);
  }

  void removeFromListShavelledVideosAndRestaurants(
      VideoAndRestaurantStruct value) {
    listShavelledVideosAndRestaurants.remove(value);
  }

  void removeAtIndexFromListShavelledVideosAndRestaurants(int index) {
    listShavelledVideosAndRestaurants.removeAt(index);
  }

  void updateListShavelledVideosAndRestaurantsAtIndex(
    int index,
    VideoAndRestaurantStruct Function(VideoAndRestaurantStruct) updateFn,
  ) {
    listShavelledVideosAndRestaurants[index] =
        updateFn(_listShavelledVideosAndRestaurants[index]);
  }

  void insertAtIndexInListShavelledVideosAndRestaurants(
      int index, VideoAndRestaurantStruct value) {
    listShavelledVideosAndRestaurants.insert(index, value);
  }

  LatLng? _centerLocation = LatLng(48.85837009999999, 2.2944813);
  LatLng? get centerLocation => _centerLocation;
  set centerLocation(LatLng? value) {
    _centerLocation = value;
  }

  String _searchTerm = '';
  String get searchTerm => _searchTerm;
  set searchTerm(String value) {
    _searchTerm = value;
  }

  ResultApiSearchPlaceStruct _searchPlaceResult = ResultApiSearchPlaceStruct();
  ResultApiSearchPlaceStruct get searchPlaceResult => _searchPlaceResult;
  set searchPlaceResult(ResultApiSearchPlaceStruct value) {
    _searchPlaceResult = value;
  }

  void updateSearchPlaceResultStruct(
      Function(ResultApiSearchPlaceStruct) updateFn) {
    updateFn(_searchPlaceResult);
  }

  String _filterRestaurantType = '';
  String get filterRestaurantType => _filterRestaurantType;
  set filterRestaurantType(String value) {
    _filterRestaurantType = value;
  }

  double _filterRating = 0.0;
  double get filterRating => _filterRating;
  set filterRating(double value) {
    _filterRating = value;
  }

  int _clickedRestaurantIndex = 0;
  int get clickedRestaurantIndex => _clickedRestaurantIndex;
  set clickedRestaurantIndex(int value) {
    _clickedRestaurantIndex = value;
  }

  bool _horizontalListVisibleOnMap = false;
  bool get horizontalListVisibleOnMap => _horizontalListVisibleOnMap;
  set horizontalListVisibleOnMap(bool value) {
    _horizontalListVisibleOnMap = value;
  }

  bool _pauseVideo = false;
  bool get pauseVideo => _pauseVideo;
  set pauseVideo(bool value) {
    _pauseVideo = value;
  }

  String _filterRrestaurantOpen = '';
  String get filterRrestaurantOpen => _filterRrestaurantOpen;
  set filterRrestaurantOpen(String value) {
    _filterRrestaurantOpen = value;
  }

  List<String> _filterRestaurantSpecialities = [];
  List<String> get filterRestaurantSpecialities =>
      _filterRestaurantSpecialities;
  set filterRestaurantSpecialities(List<String> value) {
    _filterRestaurantSpecialities = value;
  }

  void addToFilterRestaurantSpecialities(String value) {
    filterRestaurantSpecialities.add(value);
  }

  void removeFromFilterRestaurantSpecialities(String value) {
    filterRestaurantSpecialities.remove(value);
  }

  void removeAtIndexFromFilterRestaurantSpecialities(int index) {
    filterRestaurantSpecialities.removeAt(index);
  }

  void updateFilterRestaurantSpecialitiesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filterRestaurantSpecialities[index] =
        updateFn(_filterRestaurantSpecialities[index]);
  }

  void insertAtIndexInFilterRestaurantSpecialities(int index, String value) {
    filterRestaurantSpecialities.insert(index, value);
  }

  String _filterOnlyFavoris = '';
  String get filterOnlyFavoris => _filterOnlyFavoris;
  set filterOnlyFavoris(String value) {
    _filterOnlyFavoris = value;
  }

  String _isDarkMode = 'yes';
  String get isDarkMode => _isDarkMode;
  set isDarkMode(String value) {
    _isDarkMode = value;
    prefs.setString('ff_isDarkMode', value);
  }

  bool _minimizeSlid = false;
  bool get minimizeSlid => _minimizeSlid;
  set minimizeSlid(bool value) {
    _minimizeSlid = value;
  }

  bool _filterHalal = false;
  bool get filterHalal => _filterHalal;
  set filterHalal(bool value) {
    _filterHalal = value;
  }

  String _appFlyerRestaurantID = '';
  String get appFlyerRestaurantID => _appFlyerRestaurantID;
  set appFlyerRestaurantID(String value) {
    _appFlyerRestaurantID = value;
  }

  final _favoritRestaurantUsersIdManager =
      FutureRequestManager<List<FavorisRow>>();
  Future<List<FavorisRow>> favoritRestaurantUsersId({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<FavorisRow>> Function() requestFn,
  }) =>
      _favoritRestaurantUsersIdManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFavoritRestaurantUsersIdCache() =>
      _favoritRestaurantUsersIdManager.clear();
  void clearFavoritRestaurantUsersIdCacheKey(String? uniqueKey) =>
      _favoritRestaurantUsersIdManager.clearRequest(uniqueKey);

  final _videoManager = FutureRequestManager<List<VideosRow>>();
  Future<List<VideosRow>> video({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VideosRow>> Function() requestFn,
  }) =>
      _videoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVideoCache() => _videoManager.clear();
  void clearVideoCacheKey(String? uniqueKey) =>
      _videoManager.clearRequest(uniqueKey);

  final _favorisUseridManager = FutureRequestManager<List<FavorisRow>>();
  Future<List<FavorisRow>> favorisUserid({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<FavorisRow>> Function() requestFn,
  }) =>
      _favorisUseridManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFavorisUseridCache() => _favorisUseridManager.clear();
  void clearFavorisUseridCacheKey(String? uniqueKey) =>
      _favorisUseridManager.clearRequest(uniqueKey);

  final _videoLikeUseridVideoidManager =
      FutureRequestManager<List<VideoLikesRow>>();
  Future<List<VideoLikesRow>> videoLikeUseridVideoid({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VideoLikesRow>> Function() requestFn,
  }) =>
      _videoLikeUseridVideoidManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVideoLikeUseridVideoidCache() =>
      _videoLikeUseridVideoidManager.clear();
  void clearVideoLikeUseridVideoidCacheKey(String? uniqueKey) =>
      _videoLikeUseridVideoidManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
