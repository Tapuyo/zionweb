import '../database.dart';

class OrderSummaryByMonthViewTable
    extends SupabaseTable<OrderSummaryByMonthViewRow> {
  @override
  String get tableName => 'order_summary_by_month_view';

  @override
  OrderSummaryByMonthViewRow createRow(Map<String, dynamic> data) =>
      OrderSummaryByMonthViewRow(data);
}

class OrderSummaryByMonthViewRow extends SupabaseDataRow {
  OrderSummaryByMonthViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderSummaryByMonthViewTable();

  String? get monthLabel => getField<String>('month_label');
  set monthLabel(String? value) => setField<String>('month_label', value);

  DateTime? get monthDate => getField<DateTime>('month_date');
  set monthDate(DateTime? value) => setField<DateTime>('month_date', value);

  double? get totalSales => getField<double>('total_sales');
  set totalSales(double? value) => setField<double>('total_sales', value);

  int? get totalOrders => getField<int>('total_orders');
  set totalOrders(int? value) => setField<int>('total_orders', value);
}
