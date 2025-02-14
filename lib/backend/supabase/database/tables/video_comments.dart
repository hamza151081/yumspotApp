import '../database.dart';

class VideoCommentsTable extends SupabaseTable<VideoCommentsRow> {
  @override
  String get tableName => 'video_comments';

  @override
  VideoCommentsRow createRow(Map<String, dynamic> data) =>
      VideoCommentsRow(data);
}

class VideoCommentsRow extends SupabaseDataRow {
  VideoCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VideoCommentsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get videoId => getField<String>('video_id');
  set videoId(String? value) => setField<String>('video_id', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userFullName => getField<String>('user_full_name');
  set userFullName(String? value) => setField<String>('user_full_name', value);

  String? get userProfilePicture => getField<String>('user_profile_picture');
  set userProfilePicture(String? value) =>
      setField<String>('user_profile_picture', value);
}
