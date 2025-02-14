import '../database.dart';

class RestaurantVideosTable extends SupabaseTable<RestaurantVideosRow> {
  @override
  String get tableName => 'restaurant_videos';

  @override
  RestaurantVideosRow createRow(Map<String, dynamic> data) =>
      RestaurantVideosRow(data);
}

class RestaurantVideosRow extends SupabaseDataRow {
  RestaurantVideosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RestaurantVideosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get restaurantId => getField<String>('restaurant_id');
  set restaurantId(String? value) => setField<String>('restaurant_id', value);

  String? get videoId => getField<String>('video_id');
  set videoId(String? value) => setField<String>('video_id', value);
}
