import '../database.dart';

class FavorisTable extends SupabaseTable<FavorisRow> {
  @override
  String get tableName => 'favoris';

  @override
  FavorisRow createRow(Map<String, dynamic> data) => FavorisRow(data);
}

class FavorisRow extends SupabaseDataRow {
  FavorisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavorisTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get restaurantId => getField<String>('restaurant_id');
  set restaurantId(String? value) => setField<String>('restaurant_id', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
