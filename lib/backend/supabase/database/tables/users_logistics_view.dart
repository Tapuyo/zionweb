import '../database.dart';

class UsersLogisticsViewTable extends SupabaseTable<UsersLogisticsViewRow> {
  @override
  String get tableName => 'users_logistics_view';

  @override
  UsersLogisticsViewRow createRow(Map<String, dynamic> data) =>
      UsersLogisticsViewRow(data);
}

class UsersLogisticsViewRow extends SupabaseDataRow {
  UsersLogisticsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersLogisticsViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  bool? get deleted => getField<bool>('deleted');
  set deleted(bool? value) => setField<bool>('deleted', value);

  int? get userTypeId => getField<int>('user_type_id');
  set userTypeId(int? value) => setField<int>('user_type_id', value);

  String? get userType => getField<String>('user_type');
  set userType(String? value) => setField<String>('user_type', value);
}
