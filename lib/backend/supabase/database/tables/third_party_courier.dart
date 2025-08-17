import '../database.dart';

class ThirdPartyCourierTable extends SupabaseTable<ThirdPartyCourierRow> {
  @override
  String get tableName => 'ThirdPartyCourier';

  @override
  ThirdPartyCourierRow createRow(Map<String, dynamic> data) =>
      ThirdPartyCourierRow(data);
}

class ThirdPartyCourierRow extends SupabaseDataRow {
  ThirdPartyCourierRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ThirdPartyCourierTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
