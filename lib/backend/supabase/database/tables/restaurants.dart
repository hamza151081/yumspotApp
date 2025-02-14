import '../database.dart';

class RestaurantsTable extends SupabaseTable<RestaurantsRow> {
  @override
  String get tableName => 'restaurants';

  @override
  RestaurantsRow createRow(Map<String, dynamic> data) => RestaurantsRow(data);
}

class RestaurantsRow extends SupabaseDataRow {
  RestaurantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RestaurantsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get long => getField<double>('long');
  set long(double? value) => setField<double>('long', value);

  String? get googlePlaceId => getField<String>('google_place_id');
  set googlePlaceId(String? value) =>
      setField<String>('google_place_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  List<String> get weekdayText => getListField<String>('weekday_text');
  set weekdayText(List<String>? value) =>
      setListField<String>('weekday_text', value);

  String? get formattedAddress => getField<String>('formatted_address');
  set formattedAddress(String? value) =>
      setField<String>('formatted_address', value);

  String? get formattedPhoneNumber =>
      getField<String>('formatted_phone_number');
  set formattedPhoneNumber(String? value) =>
      setField<String>('formatted_phone_number', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  List<String> get specialities => getListField<String>('specialities');
  set specialities(List<String>? value) =>
      setListField<String>('specialities', value);

  dynamic get openingPeriods => getField<dynamic>('opening_periods');
  set openingPeriods(dynamic value) =>
      setField<dynamic>('opening_periods', value);

  int? get userRatingsTotal => getField<int>('user_ratings_total');
  set userRatingsTotal(int? value) =>
      setField<int>('user_ratings_total', value);
}
