import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantRecord extends FirestoreRecord {
  RestaurantRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "placeid" field.
  String? _placeid;
  String get placeid => _placeid ?? '';
  bool hasPlaceid() => _placeid != null;

  // "videos" field.
  List<VideoStruct>? _videos;
  List<VideoStruct> get videos => _videos ?? const [];
  bool hasVideos() => _videos != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "latlanfg" field.
  LatLng? _latlanfg;
  LatLng? get latlanfg => _latlanfg;
  bool hasLatlanfg() => _latlanfg != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _placeid = snapshotData['placeid'] as String?;
    _videos = getStructList(
      snapshotData['videos'],
      VideoStruct.fromMap,
    );
    _type = snapshotData['type'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _latlanfg = snapshotData['latlanfg'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurant');

  static Stream<RestaurantRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantRecord.fromSnapshot(s));

  static Future<RestaurantRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantRecord.fromSnapshot(s));

  static RestaurantRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantRecordData({
  String? name,
  LatLng? location,
  String? placeid,
  String? type,
  DocumentReference? userref,
  LatLng? latlanfg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'placeid': placeid,
      'type': type,
      'userref': userref,
      'latlanfg': latlanfg,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantRecordDocumentEquality implements Equality<RestaurantRecord> {
  const RestaurantRecordDocumentEquality();

  @override
  bool equals(RestaurantRecord? e1, RestaurantRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.placeid == e2?.placeid &&
        listEquality.equals(e1?.videos, e2?.videos) &&
        e1?.type == e2?.type &&
        e1?.userref == e2?.userref &&
        e1?.latlanfg == e2?.latlanfg;
  }

  @override
  int hash(RestaurantRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.placeid,
        e?.videos,
        e?.type,
        e?.userref,
        e?.latlanfg
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantRecord;
}
