// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OpeningGetterStruct extends FFFirebaseStruct {
  OpeningGetterStruct({
    String? openAt,
    String? closeAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _openAt = openAt,
        _closeAt = closeAt,
        super(firestoreUtilData);

  // "openAt" field.
  String? _openAt;
  String get openAt => _openAt ?? '';
  set openAt(String? val) => _openAt = val;

  bool hasOpenAt() => _openAt != null;

  // "closeAt" field.
  String? _closeAt;
  String get closeAt => _closeAt ?? '';
  set closeAt(String? val) => _closeAt = val;

  bool hasCloseAt() => _closeAt != null;

  static OpeningGetterStruct fromMap(Map<String, dynamic> data) =>
      OpeningGetterStruct(
        openAt: data['openAt'] as String?,
        closeAt: data['closeAt'] as String?,
      );

  static OpeningGetterStruct? maybeFromMap(dynamic data) => data is Map
      ? OpeningGetterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'openAt': _openAt,
        'closeAt': _closeAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'openAt': serializeParam(
          _openAt,
          ParamType.String,
        ),
        'closeAt': serializeParam(
          _closeAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static OpeningGetterStruct fromSerializableMap(Map<String, dynamic> data) =>
      OpeningGetterStruct(
        openAt: deserializeParam(
          data['openAt'],
          ParamType.String,
          false,
        ),
        closeAt: deserializeParam(
          data['closeAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OpeningGetterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OpeningGetterStruct &&
        openAt == other.openAt &&
        closeAt == other.closeAt;
  }

  @override
  int get hashCode => const ListEquality().hash([openAt, closeAt]);
}

OpeningGetterStruct createOpeningGetterStruct({
  String? openAt,
  String? closeAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OpeningGetterStruct(
      openAt: openAt,
      closeAt: closeAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OpeningGetterStruct? updateOpeningGetterStruct(
  OpeningGetterStruct? openingGetter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    openingGetter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOpeningGetterStructData(
  Map<String, dynamic> firestoreData,
  OpeningGetterStruct? openingGetter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (openingGetter == null) {
    return;
  }
  if (openingGetter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && openingGetter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final openingGetterData =
      getOpeningGetterFirestoreData(openingGetter, forFieldValue);
  final nestedData =
      openingGetterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = openingGetter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOpeningGetterFirestoreData(
  OpeningGetterStruct? openingGetter, [
  bool forFieldValue = false,
]) {
  if (openingGetter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(openingGetter.toMap());

  // Add any Firestore field values
  openingGetter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOpeningGetterListFirestoreData(
  List<OpeningGetterStruct>? openingGetters,
) =>
    openingGetters
        ?.map((e) => getOpeningGetterFirestoreData(e, true))
        .toList() ??
    [];
