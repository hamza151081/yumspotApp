import '../database.dart';

class RestaurantCommentsTable extends SupabaseTable<RestaurantCommentsRow> {
  @override
  String get tableName => 'restaurant_comments';

  @override
  RestaurantCommentsRow createRow(Map<String, dynamic> data) =>
      RestaurantCommentsRow(data);
}

class RestaurantCommentsRow extends SupabaseDataRow {
  RestaurantCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RestaurantCommentsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userFullName => getField<String>('user_full_name');
  set userFullName(String? value) => setField<String>('user_full_name', value);

  String? get userProfilePicture => getField<String>('user_profile_picture');
  set userProfilePicture(String? value) =>
      setField<String>('user_profile_picture', value);

  String? get restaurantId => getField<String>('restaurant_id');
  set restaurantId(String? value) => setField<String>('restaurant_id', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
