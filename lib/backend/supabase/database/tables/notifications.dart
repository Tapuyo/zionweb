import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'Notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  String? get spiel => getField<String>('spiel');
  set spiel(String? value) => setField<String>('spiel', value);

  bool? get read => getField<bool>('read');
  set read(bool? value) => setField<bool>('read', value);
}
