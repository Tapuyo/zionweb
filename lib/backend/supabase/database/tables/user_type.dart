import '../database.dart';

class UserTypeTable extends SupabaseTable<UserTypeRow> {
  @override
  String get tableName => 'UserType';

  @override
  UserTypeRow createRow(Map<String, dynamic> data) => UserTypeRow(data);
}

class UserTypeRow extends SupabaseDataRow {
  UserTypeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTypeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  bool? get deleted => getField<bool>('deleted');
  set deleted(bool? value) => setField<bool>('deleted', value);
}
