import '../database.dart';

class VouchersTable extends SupabaseTable<VouchersRow> {
  @override
  String get tableName => 'Vouchers';

  @override
  VouchersRow createRow(Map<String, dynamic> data) => VouchersRow(data);
}

class VouchersRow extends SupabaseDataRow {
  VouchersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VouchersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  DateTime? get expiry => getField<DateTime>('expiry');
  set expiry(DateTime? value) => setField<DateTime>('expiry', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  int? get limit => getField<int>('limit');
  set limit(int? value) => setField<int>('limit', value);
}
