import '../database.dart';

class OrderSalesDeliveredByRangeViewTable
    extends SupabaseTable<OrderSalesDeliveredByRangeViewRow> {
  @override
  String get tableName => 'order_sales_delivered_by_range_view';

  @override
  OrderSalesDeliveredByRangeViewRow createRow(Map<String, dynamic> data) =>
      OrderSalesDeliveredByRangeViewRow(data);
}

class OrderSalesDeliveredByRangeViewRow extends SupabaseDataRow {
  OrderSalesDeliveredByRangeViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderSalesDeliveredByRangeViewTable();

  String? get rangeLabel => getField<String>('range_label');
  set rangeLabel(String? value) => setField<String>('range_label', value);

  double? get totalSalesDelivered => getField<double>('total_sales_delivered');
  set totalSalesDelivered(double? value) =>
      setField<double>('total_sales_delivered', value);
}
