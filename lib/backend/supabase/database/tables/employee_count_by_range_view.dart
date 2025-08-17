import '../database.dart';

class EmployeeCountByRangeViewTable
    extends SupabaseTable<EmployeeCountByRangeViewRow> {
  @override
  String get tableName => 'employee_count_by_range_view';

  @override
  EmployeeCountByRangeViewRow createRow(Map<String, dynamic> data) =>
      EmployeeCountByRangeViewRow(data);
}

class EmployeeCountByRangeViewRow extends SupabaseDataRow {
  EmployeeCountByRangeViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmployeeCountByRangeViewTable();

  String? get rangeLabel => getField<String>('range_label');
  set rangeLabel(String? value) => setField<String>('range_label', value);

  int? get totalEmployees => getField<int>('total_employees');
  set totalEmployees(int? value) => setField<int>('total_employees', value);

  int? get adminCount => getField<int>('admin_count');
  set adminCount(int? value) => setField<int>('admin_count', value);

  int? get logisticsCount => getField<int>('logistics_count');
  set logisticsCount(int? value) => setField<int>('logistics_count', value);

  int? get salesCount => getField<int>('sales_count');
  set salesCount(int? value) => setField<int>('sales_count', value);

  int? get schedulersCount => getField<int>('schedulers_count');
  set schedulersCount(int? value) => setField<int>('schedulers_count', value);
}
