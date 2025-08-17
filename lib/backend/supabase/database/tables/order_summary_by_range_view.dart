import '../database.dart';

class OrderSummaryByRangeViewTable
    extends SupabaseTable<OrderSummaryByRangeViewRow> {
  @override
  String get tableName => 'order_summary_by_range_view';

  @override
  OrderSummaryByRangeViewRow createRow(Map<String, dynamic> data) =>
      OrderSummaryByRangeViewRow(data);
}

class OrderSummaryByRangeViewRow extends SupabaseDataRow {
  OrderSummaryByRangeViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderSummaryByRangeViewTable();

  String? get rangeLabel => getField<String>('range_label');
  set rangeLabel(String? value) => setField<String>('range_label', value);

  double? get totalRevenue => getField<double>('total_revenue');
  set totalRevenue(double? value) => setField<double>('total_revenue', value);

  int? get totalOrders => getField<int>('total_orders');
  set totalOrders(int? value) => setField<int>('total_orders', value);

  double? get totalShippingFee => getField<double>('total_shipping_fee');
  set totalShippingFee(double? value) =>
      setField<double>('total_shipping_fee', value);

  int? get totalCancelledOrders => getField<int>('total_cancelled_orders');
  set totalCancelledOrders(int? value) =>
      setField<int>('total_cancelled_orders', value);
}
