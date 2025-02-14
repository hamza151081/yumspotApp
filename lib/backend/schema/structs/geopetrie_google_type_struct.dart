// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeopetrieGoogleTypeStruct extends FFFirebaseStruct {
  GeopetrieGoogleTypeStruct({
    LocationGoogleTypeStruct? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _location = location,
        super(firestoreUtilData);

  // "location" field.
  LocationGoogleTypeStruct? _location;
  LocationGoogleTypeStruct get location =>
      _location ?? LocationGoogleTypeStruct();
  set location(LocationGoogleTypeStruct? val) => _location = val;

  void updateLocation(Function(LocationGoogleTypeStruct) updateFn) {
    updateFn(_location ??= LocationGoogleTypeStruct());
  }

  bool hasLocation() => _location != null;

  static GeopetrieGoogleTypeStruct fromMap(Map<String, dynamic> data) =>
      GeopetrieGoogleTypeStruct(
        location: data['location'] is LocationGoogleTypeStruct
            ? data['location']
            : LocationGoogleTypeStruct.maybeFromMap(data['location']),
      );

  static GeopetrieGoogleTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? GeopetrieGoogleTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'location': _location?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static GeopetrieGoogleTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GeopetrieGoogleTypeStruct(
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationGoogleTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GeopetrieGoogleTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GeopetrieGoogleTypeStruct && location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([location]);
}

GeopetrieGoogleTypeStruct createGeopetrieGoogleTypeStruct({
  LocationGoogleTypeStruct? location,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeopetrieGoogleTypeStruct(
      location:
          location ?? (clearUnsetFields ? LocationGoogleTypeStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GeopetrieGoogleTypeStruct? updateGeopetrieGoogleTypeStruct(
  GeopetrieGoogleTypeStruct? geopetrieGoogleType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    geopetrieGoogleType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGeopetrieGoogleTypeStructData(
  Map<String, dynamic> firestoreData,
  GeopetrieGoogleTypeStruct? geopetrieGoogleType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (geopetrieGoogleType == null) {
    return;
  }
  if (geopetrieGoogleType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && geopetrieGoogleType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final geopetrieGoogleTypeData =
      getGeopetrieGoogleTypeFirestoreData(geopetrieGoogleType, forFieldValue);
  final nestedData =
      geopetrieGoogleTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      geopetrieGoogleType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGeopetrieGoogleTypeFirestoreData(
  GeopetrieGoogleTypeStruct? geopetrieGoogleType, [
  bool forFieldValue = false,
]) {
  if (geopetrieGoogleType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(geopetrieGoogleType.toMap());

  // Handle nested data for "location" field.
  addLocationGoogleTypeStructData(
    firestoreData,
    geopetrieGoogleType.hasLocation() ? geopetrieGoogleType.location : null,
    'location',
    forFieldValue,
  );

  // Add any Firestore field values
  geopetrieGoogleType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeopetrieGoogleTypeListFirestoreData(
  List<GeopetrieGoogleTypeStruct>? geopetrieGoogleTypes,
) =>
    geopetrieGoogleTypes
        ?.map((e) => getGeopetrieGoogleTypeFirestoreData(e, true))
        .toList() ??
    [];
