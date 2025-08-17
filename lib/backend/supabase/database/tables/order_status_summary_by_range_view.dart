import '../database.dart';

class OrderStatusSummaryByRangeViewTable
    extends SupabaseTable<OrderStatusSummaryByRangeViewRow> {
  @override
  String get tableName => 'order_status_summary_by_range_view';

  @override
  OrderStatusSummaryByRangeViewRow createRow(Map<String, dynamic> data) =>
      OrderStatusSummaryByRangeViewRow(data);
}

class OrderStatusSummaryByRangeViewRow extends SupabaseDataRow {
  OrderStatusSummaryByRangeViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderStatusSummaryByRangeViewTable();

  String? get rangeLabel => getField<String>('range_label');
  set rangeLabel(String? value) => setField<String>('range_label', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get totalOrders => getField<int>('total_orders');
  set totalOrders(int? value) => setField<int>('total_orders', value);

  double? get totalAmount => getField<double>('total_amount');
  set totalAmount(double? value) => setField<double>('total_amount', value);
}
