import '../database.dart';

class RestaurantSpecialitiesTable
    extends SupabaseTable<RestaurantSpecialitiesRow> {
  @override
  String get tableName => 'restaurant_specialities';

  @override
  RestaurantSpecialitiesRow createRow(Map<String, dynamic> data) =>
      RestaurantSpecialitiesRow(data);
}

class RestaurantSpecialitiesRow extends SupabaseDataRow {
  RestaurantSpecialitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RestaurantSpecialitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
