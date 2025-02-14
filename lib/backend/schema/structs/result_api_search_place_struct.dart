// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultApiSearchPlaceStruct extends FFFirebaseStruct {
  ResultApiSearchPlaceStruct({
    String? formattedAddress,
    GeopetrieGoogleTypeStruct? geometry,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _formattedAddress = formattedAddress,
        _geometry = geometry,
        super(firestoreUtilData);

  // "formatted_address" field.
  String? _formattedAddress;
  String get formattedAddress => _formattedAddress ?? '';
  set formattedAddress(String? val) => _formattedAddress = val;

  bool hasFormattedAddress() => _formattedAddress != null;

  // "geometry" field.
  GeopetrieGoogleTypeStruct? _geometry;
  GeopetrieGoogleTypeStruct get geometry =>
      _geometry ?? GeopetrieGoogleTypeStruct();
  set geometry(GeopetrieGoogleTypeStruct? val) => _geometry = val;

  void updateGeometry(Function(GeopetrieGoogleTypeStruct) updateFn) {
    updateFn(_geometry ??= GeopetrieGoogleTypeStruct());
  }

  bool hasGeometry() => _geometry != null;

  static ResultApiSearchPlaceStruct fromMap(Map<String, dynamic> data) =>
      ResultApiSearchPlaceStruct(
        formattedAddress: data['formatted_address'] as String?,
        geometry: data['geometry'] is GeopetrieGoogleTypeStruct
            ? data['geometry']
            : GeopetrieGoogleTypeStruct.maybeFromMap(data['geometry']),
      );

  static ResultApiSearchPlaceStruct? maybeFromMap(dynamic data) => data is Map
      ? ResultApiSearchPlaceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'formatted_address': _formattedAddress,
        'geometry': _geometry?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'formatted_address': serializeParam(
          _formattedAddress,
          ParamType.String,
        ),
        'geometry': serializeParam(
          _geometry,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ResultApiSearchPlaceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ResultApiSearchPlaceStruct(
        formattedAddress: deserializeParam(
          data['formatted_address'],
          ParamType.String,
          false,
        ),
        geometry: deserializeStructParam(
          data['geometry'],
          ParamType.DataStruct,
          false,
          structBuilder: GeopetrieGoogleTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ResultApiSearchPlaceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResultApiSearchPlaceStruct &&
        formattedAddress == other.formattedAddress &&
        geometry == other.geometry;
  }

  @override
  int get hashCode => const ListEquality().hash([formattedAddress, geometry]);
}

ResultApiSearchPlaceStruct createResultApiSearchPlaceStruct({
  String? formattedAddress,
  GeopetrieGoogleTypeStruct? geometry,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResultApiSearchPlaceStruct(
      formattedAddress: formattedAddress,
      geometry:
          geometry ?? (clearUnsetFields ? GeopetrieGoogleTypeStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResultApiSearchPlaceStruct? updateResultApiSearchPlaceStruct(
  ResultApiSearchPlaceStruct? resultApiSearchPlace, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    resultApiSearchPlace
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResultApiSearchPlaceStructData(
  Map<String, dynamic> firestoreData,
  ResultApiSearchPlaceStruct? resultApiSearchPlace,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (resultApiSearchPlace == null) {
    return;
  }
  if (resultApiSearchPlace.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && resultApiSearchPlace.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final resultApiSearchPlaceData =
      getResultApiSearchPlaceFirestoreData(resultApiSearchPlace, forFieldValue);
  final nestedData =
      resultApiSearchPlaceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      resultApiSearchPlace.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResultApiSearchPlaceFirestoreData(
  ResultApiSearchPlaceStruct? resultApiSearchPlace, [
  bool forFieldValue = false,
]) {
  if (resultApiSearchPlace == null) {
    return {};
  }
  final firestoreData = mapToFirestore(resultApiSearchPlace.toMap());

  // Handle nested data for "geometry" field.
  addGeopetrieGoogleTypeStructData(
    firestoreData,
    resultApiSearchPlace.hasGeometry() ? resultApiSearchPlace.geometry : null,
    'geometry',
    forFieldValue,
  );

  // Add any Firestore field values
  resultApiSearchPlace.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResultApiSearchPlaceListFirestoreData(
  List<ResultApiSearchPlaceStruct>? resultApiSearchPlaces,
) =>
    resultApiSearchPlaces
        ?.map((e) => getResultApiSearchPlaceFirestoreData(e, true))
        .toList() ??
    [];
