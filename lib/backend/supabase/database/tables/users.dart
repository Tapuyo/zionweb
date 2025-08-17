import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'Users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  bool? get deleted => getField<bool>('deleted');
  set deleted(bool? value) => setField<bool>('deleted', value);

  int? get userTypeId => getField<int>('user_type_id');
  set userTypeId(int? value) => setField<int>('user_type_id', value);

  String? get userGuid => getField<String>('user_guid');
  set userGuid(String? value) => setField<String>('user_guid', value);
}
