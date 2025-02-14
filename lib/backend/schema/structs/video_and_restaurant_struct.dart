// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoAndRestaurantStruct extends FFFirebaseStruct {
  VideoAndRestaurantStruct({
    String? restaurantId,
    String? restaurantName,
    double? restaurantLat,
    double? restaurantLong,
    String? restaurantDescription,
    double? restaurantRating,
    String? restaurantType,
    List<String>? restaurantSpecialities,
    String? logoUrl,
    String? videoUrl,
    int? videoTotalViews,
    int? videoTotalLikes,
    int? videoTotalShares,
    String? videoId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _restaurantId = restaurantId,
        _restaurantName = restaurantName,
        _restaurantLat = restaurantLat,
        _restaurantLong = restaurantLong,
        _restaurantDescription = restaurantDescription,
        _restaurantRating = restaurantRating,
        _restaurantType = restaurantType,
        _restaurantSpecialities = restaurantSpecialities,
        _logoUrl = logoUrl,
        _videoUrl = videoUrl,
        _videoTotalViews = videoTotalViews,
        _videoTotalLikes = videoTotalLikes,
        _videoTotalShares = videoTotalShares,
        _videoId = videoId,
        super(firestoreUtilData);

  // "restaurant_id" field.
  String? _restaurantId;
  String get restaurantId => _restaurantId ?? '';
  set restaurantId(String? val) => _restaurantId = val;

  bool hasRestaurantId() => _restaurantId != null;

  // "restaurant_name" field.
  String? _restaurantName;
  String get restaurantName => _restaurantName ?? '';
  set restaurantName(String? val) => _restaurantName = val;

  bool hasRestaurantName() => _restaurantName != null;

  // "restaurant_lat" field.
  double? _restaurantLat;
  double get restaurantLat => _restaurantLat ?? 0.0;
  set restaurantLat(double? val) => _restaurantLat = val;

  void incrementRestaurantLat(double amount) =>
      restaurantLat = restaurantLat + amount;

  bool hasRestaurantLat() => _restaurantLat != null;

  // "restaurant_long" field.
  double? _restaurantLong;
  double get restaurantLong => _restaurantLong ?? 0.0;
  set restaurantLong(double? val) => _restaurantLong = val;

  void incrementRestaurantLong(double amount) =>
      restaurantLong = restaurantLong + amount;

  bool hasRestaurantLong() => _restaurantLong != null;

  // "restaurant_description" field.
  String? _restaurantDescription;
  String get restaurantDescription => _restaurantDescription ?? '';
  set restaurantDescription(String? val) => _restaurantDescription = val;

  bool hasRestaurantDescription() => _restaurantDescription != null;

  // "restaurant_rating" field.
  double? _restaurantRating;
  double get restaurantRating => _restaurantRating ?? 0.0;
  set restaurantRating(double? val) => _restaurantRating = val;

  void incrementRestaurantRating(double amount) =>
      restaurantRating = restaurantRating + amount;

  bool hasRestaurantRating() => _restaurantRating != null;

  // "restaurant_type" field.
  String? _restaurantType;
  String get restaurantType => _restaurantType ?? '';
  set restaurantType(String? val) => _restaurantType = val;

  bool hasRestaurantType() => _restaurantType != null;

  // "restaurant_specialities" field.
  List<String>? _restaurantSpecialities;
  List<String> get restaurantSpecialities =>
      _restaurantSpecialities ?? const [];
  set restaurantSpecialities(List<String>? val) =>
      _restaurantSpecialities = val;

  void updateRestaurantSpecialities(Function(List<String>) updateFn) {
    updateFn(_restaurantSpecialities ??= []);
  }

  bool hasRestaurantSpecialities() => _restaurantSpecialities != null;

  // "logo_url" field.
  String? _logoUrl;
  String get logoUrl => _logoUrl ?? '';
  set logoUrl(String? val) => _logoUrl = val;

  bool hasLogoUrl() => _logoUrl != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;

  bool hasVideoUrl() => _videoUrl != null;

  // "video_total_views" field.
  int? _videoTotalViews;
  int get videoTotalViews => _videoTotalViews ?? 0;
  set videoTotalViews(int? val) => _videoTotalViews = val;

  void incrementVideoTotalViews(int amount) =>
      videoTotalViews = videoTotalViews + amount;

  bool hasVideoTotalViews() => _videoTotalViews != null;

  // "video_total_likes" field.
  int? _videoTotalLikes;
  int get videoTotalLikes => _videoTotalLikes ?? 0;
  set videoTotalLikes(int? val) => _videoTotalLikes = val;

  void incrementVideoTotalLikes(int amount) =>
      videoTotalLikes = videoTotalLikes + amount;

  bool hasVideoTotalLikes() => _videoTotalLikes != null;

  // "video_total_shares" field.
  int? _videoTotalShares;
  int get videoTotalShares => _videoTotalShares ?? 0;
  set videoTotalShares(int? val) => _videoTotalShares = val;

  void incrementVideoTotalShares(int amount) =>
      videoTotalShares = videoTotalShares + amount;

  bool hasVideoTotalShares() => _videoTotalShares != null;

  // "video_id" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  set videoId(String? val) => _videoId = val;

  bool hasVideoId() => _videoId != null;

  static VideoAndRestaurantStruct fromMap(Map<String, dynamic> data) =>
      VideoAndRestaurantStruct(
        restaurantId: data['restaurant_id'] as String?,
        restaurantName: data['restaurant_name'] as String?,
        restaurantLat: castToType<double>(data['restaurant_lat']),
        restaurantLong: castToType<double>(data['restaurant_long']),
        restaurantDescription: data['restaurant_description'] as String?,
        restaurantRating: castToType<double>(data['restaurant_rating']),
        restaurantType: data['restaurant_type'] as String?,
        restaurantSpecialities: getDataList(data['restaurant_specialities']),
        logoUrl: data['logo_url'] as String?,
        videoUrl: data['video_url'] as String?,
        videoTotalViews: castToType<int>(data['video_total_views']),
        videoTotalLikes: castToType<int>(data['video_total_likes']),
        videoTotalShares: castToType<int>(data['video_total_shares']),
        videoId: data['video_id'] as String?,
      );

  static VideoAndRestaurantStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoAndRestaurantStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'restaurant_id': _restaurantId,
        'restaurant_name': _restaurantName,
        'restaurant_lat': _restaurantLat,
        'restaurant_long': _restaurantLong,
        'restaurant_description': _restaurantDescription,
        'restaurant_rating': _restaurantRating,
        'restaurant_type': _restaurantType,
        'restaurant_specialities': _restaurantSpecialities,
        'logo_url': _logoUrl,
        'video_url': _videoUrl,
        'video_total_views': _videoTotalViews,
        'video_total_likes': _videoTotalLikes,
        'video_total_shares': _videoTotalShares,
        'video_id': _videoId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'restaurant_id': serializeParam(
          _restaurantId,
          ParamType.String,
        ),
        'restaurant_name': serializeParam(
          _restaurantName,
          ParamType.String,
        ),
        'restaurant_lat': serializeParam(
          _restaurantLat,
          ParamType.double,
        ),
        'restaurant_long': serializeParam(
          _restaurantLong,
          ParamType.double,
        ),
        'restaurant_description': serializeParam(
          _restaurantDescription,
          ParamType.String,
        ),
        'restaurant_rating': serializeParam(
          _restaurantRating,
          ParamType.double,
        ),
        'restaurant_type': serializeParam(
          _restaurantType,
          ParamType.String,
        ),
        'restaurant_specialities': serializeParam(
          _restaurantSpecialities,
          ParamType.String,
          isList: true,
        ),
        'logo_url': serializeParam(
          _logoUrl,
          ParamType.String,
        ),
        'video_url': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
        'video_total_views': serializeParam(
          _videoTotalViews,
          ParamType.int,
        ),
        'video_total_likes': serializeParam(
          _videoTotalLikes,
          ParamType.int,
        ),
        'video_total_shares': serializeParam(
          _videoTotalShares,
          ParamType.int,
        ),
        'video_id': serializeParam(
          _videoId,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoAndRestaurantStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VideoAndRestaurantStruct(
        restaurantId: deserializeParam(
          data['restaurant_id'],
          ParamType.String,
          false,
        ),
        restaurantName: deserializeParam(
          data['restaurant_name'],
          ParamType.String,
          false,
        ),
        restaurantLat: deserializeParam(
          data['restaurant_lat'],
          ParamType.double,
          false,
        ),
        restaurantLong: deserializeParam(
          data['restaurant_long'],
          ParamType.double,
          false,
        ),
        restaurantDescription: deserializeParam(
          data['restaurant_description'],
          ParamType.String,
          false,
        ),
        restaurantRating: deserializeParam(
          data['restaurant_rating'],
          ParamType.double,
          false,
        ),
        restaurantType: deserializeParam(
          data['restaurant_type'],
          ParamType.String,
          false,
        ),
        restaurantSpecialities: deserializeParam<String>(
          data['restaurant_specialities'],
          ParamType.String,
          true,
        ),
        logoUrl: deserializeParam(
          data['logo_url'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['video_url'],
          ParamType.String,
          false,
        ),
        videoTotalViews: deserializeParam(
          data['video_total_views'],
          ParamType.int,
          false,
        ),
        videoTotalLikes: deserializeParam(
          data['video_total_likes'],
          ParamType.int,
          false,
        ),
        videoTotalShares: deserializeParam(
          data['video_total_shares'],
          ParamType.int,
          false,
        ),
        videoId: deserializeParam(
          data['video_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoAndRestaurantStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VideoAndRestaurantStruct &&
        restaurantId == other.restaurantId &&
        restaurantName == other.restaurantName &&
        restaurantLat == other.restaurantLat &&
        restaurantLong == other.restaurantLong &&
        restaurantDescription == other.restaurantDescription &&
        restaurantRating == other.restaurantRating &&
        restaurantType == other.restaurantType &&
        listEquality.equals(
            restaurantSpecialities, other.restaurantSpecialities) &&
        logoUrl == other.logoUrl &&
        videoUrl == other.videoUrl &&
        videoTotalViews == other.videoTotalViews &&
        videoTotalLikes == other.videoTotalLikes &&
        videoTotalShares == other.videoTotalShares &&
        videoId == other.videoId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        restaurantId,
        restaurantName,
        restaurantLat,
        restaurantLong,
        restaurantDescription,
        restaurantRating,
        restaurantType,
        restaurantSpecialities,
        logoUrl,
        videoUrl,
        videoTotalViews,
        videoTotalLikes,
        videoTotalShares,
        videoId
      ]);
}

VideoAndRestaurantStruct createVideoAndRestaurantStruct({
  String? restaurantId,
  String? restaurantName,
  double? restaurantLat,
  double? restaurantLong,
  String? restaurantDescription,
  double? restaurantRating,
  String? restaurantType,
  String? logoUrl,
  String? videoUrl,
  int? videoTotalViews,
  int? videoTotalLikes,
  int? videoTotalShares,
  String? videoId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideoAndRestaurantStruct(
      restaurantId: restaurantId,
      restaurantName: restaurantName,
      restaurantLat: restaurantLat,
      restaurantLong: restaurantLong,
      restaurantDescription: restaurantDescription,
      restaurantRating: restaurantRating,
      restaurantType: restaurantType,
      logoUrl: logoUrl,
      videoUrl: videoUrl,
      videoTotalViews: videoTotalViews,
      videoTotalLikes: videoTotalLikes,
      videoTotalShares: videoTotalShares,
      videoId: videoId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideoAndRestaurantStruct? updateVideoAndRestaurantStruct(
  VideoAndRestaurantStruct? videoAndRestaurant, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    videoAndRestaurant
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideoAndRestaurantStructData(
  Map<String, dynamic> firestoreData,
  VideoAndRestaurantStruct? videoAndRestaurant,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (videoAndRestaurant == null) {
    return;
  }
  if (videoAndRestaurant.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && videoAndRestaurant.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videoAndRestaurantData =
      getVideoAndRestaurantFirestoreData(videoAndRestaurant, forFieldValue);
  final nestedData =
      videoAndRestaurantData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      videoAndRestaurant.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideoAndRestaurantFirestoreData(
  VideoAndRestaurantStruct? videoAndRestaurant, [
  bool forFieldValue = false,
]) {
  if (videoAndRestaurant == null) {
    return {};
  }
  final firestoreData = mapToFirestore(videoAndRestaurant.toMap());

  // Add any Firestore field values
  videoAndRestaurant.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideoAndRestaurantListFirestoreData(
  List<VideoAndRestaurantStruct>? videoAndRestaurants,
) =>
    videoAndRestaurants
        ?.map((e) => getVideoAndRestaurantFirestoreData(e, true))
        .toList() ??
    [];
