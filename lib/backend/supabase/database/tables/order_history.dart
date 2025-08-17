import '../database.dart';

class OrderHistoryTable extends SupabaseTable<OrderHistoryRow> {
  @override
  String get tableName => 'OrderHistory';

  @override
  OrderHistoryRow createRow(Map<String, dynamic> data) => OrderHistoryRow(data);
}

class OrderHistoryRow extends SupabaseDataRow {
  OrderHistoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderHistoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get remarks => getField<String>('remarks');
  set remarks(String? value) => setField<String>('remarks', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
