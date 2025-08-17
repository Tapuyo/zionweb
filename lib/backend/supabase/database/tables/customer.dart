import '../database.dart';

class CustomerTable extends SupabaseTable<CustomerRow> {
  @override
  String get tableName => 'Customer';

  @override
  CustomerRow createRow(Map<String, dynamic> data) => CustomerRow(data);
}

class CustomerRow extends SupabaseDataRow {
  CustomerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CustomerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get company => getField<String>('company');
  set company(String? value) => setField<String>('company', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get landmark => getField<String>('landmark');
  set landmark(String? value) => setField<String>('landmark', value);

  int? get zipCode => getField<int>('zip_code');
  set zipCode(int? value) => setField<int>('zip_code', value);

  String? get contact => getField<String>('contact');
  set contact(String? value) => setField<String>('contact', value);

  DateTime? get birthdate => getField<DateTime>('birthdate');
  set birthdate(DateTime? value) => setField<DateTime>('birthdate', value);
}
