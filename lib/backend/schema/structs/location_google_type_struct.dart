// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LocationGoogleTypeStruct extends FFFirebaseStruct {
  LocationGoogleTypeStruct({
    double? lat,
    double? lng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lat = lat,
        _lng = lng,
        super(firestoreUtilData);

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;

  void incrementLng(double amount) => lng = lng + amount;

  bool hasLng() => _lng != null;

  static LocationGoogleTypeStruct fromMap(Map<String, dynamic> data) =>
      LocationGoogleTypeStruct(
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
      );

  static LocationGoogleTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationGoogleTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lng': _lng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
      }.withoutNulls;

  static LocationGoogleTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LocationGoogleTypeStruct(
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'LocationGoogleTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationGoogleTypeStruct &&
        lat == other.lat &&
        lng == other.lng;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lng]);
}

LocationGoogleTypeStruct createLocationGoogleTypeStruct({
  double? lat,
  double? lng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationGoogleTypeStruct(
      lat: lat,
      lng: lng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationGoogleTypeStruct? updateLocationGoogleTypeStruct(
  LocationGoogleTypeStruct? locationGoogleType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationGoogleType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationGoogleTypeStructData(
  Map<String, dynamic> firestoreData,
  LocationGoogleTypeStruct? locationGoogleType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationGoogleType == null) {
    return;
  }
  if (locationGoogleType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationGoogleType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationGoogleTypeData =
      getLocationGoogleTypeFirestoreData(locationGoogleType, forFieldValue);
  final nestedData =
      locationGoogleTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      locationGoogleType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationGoogleTypeFirestoreData(
  LocationGoogleTypeStruct? locationGoogleType, [
  bool forFieldValue = false,
]) {
  if (locationGoogleType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationGoogleType.toMap());

  // Add any Firestore field values
  locationGoogleType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationGoogleTypeListFirestoreData(
  List<LocationGoogleTypeStruct>? locationGoogleTypes,
) =>
    locationGoogleTypes
        ?.map((e) => getLocationGoogleTypeFirestoreData(e, true))
        .toList() ??
    [];
