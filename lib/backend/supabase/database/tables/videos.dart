import '../database.dart';

class VideosTable extends SupabaseTable<VideosRow> {
  @override
  String get tableName => 'videos';

  @override
  VideosRow createRow(Map<String, dynamic> data) => VideosRow(data);
}

class VideosRow extends SupabaseDataRow {
  VideosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VideosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get videoUrl => getField<String>('video_url');
  set videoUrl(String? value) => setField<String>('video_url', value);

  int? get totalViews => getField<int>('total_views');
  set totalViews(int? value) => setField<int>('total_views', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);

  int? get totalShares => getField<int>('total_shares');
  set totalShares(int? value) => setField<int>('total_shares', value);

  String? get fileHash => getField<String>('file_hash');
  set fileHash(String? value) => setField<String>('file_hash', value);

  String? get coverImageUrl => getField<String>('cover_image_url');
  set coverImageUrl(String? value) =>
      setField<String>('cover_image_url', value);

  int? get totalComment => getField<int>('total_comment');
  set totalComment(int? value) => setField<int>('total_comment', value);
}
