import '../database.dart';

class PaymentMethodTable extends SupabaseTable<PaymentMethodRow> {
  @override
  String get tableName => 'PaymentMethod';

  @override
  PaymentMethodRow createRow(Map<String, dynamic> data) =>
      PaymentMethodRow(data);
}

class PaymentMethodRow extends SupabaseDataRow {
  PaymentMethodRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PaymentMethodTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get method => getField<String>('method');
  set method(String? value) => setField<String>('method', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);
}
