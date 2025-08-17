import '../database.dart';

class OrderCodeSeriesTable extends SupabaseTable<OrderCodeSeriesRow> {
  @override
  String get tableName => 'OrderCodeSeries';

  @override
  OrderCodeSeriesRow createRow(Map<String, dynamic> data) =>
      OrderCodeSeriesRow(data);
}

class OrderCodeSeriesRow extends SupabaseDataRow {
  OrderCodeSeriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderCodeSeriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);
}
