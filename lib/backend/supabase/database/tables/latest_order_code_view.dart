import '../database.dart';

class LatestOrderCodeViewTable extends SupabaseTable<LatestOrderCodeViewRow> {
  @override
  String get tableName => 'latest_order_code_view';

  @override
  LatestOrderCodeViewRow createRow(Map<String, dynamic> data) =>
      LatestOrderCodeViewRow(data);
}

class LatestOrderCodeViewRow extends SupabaseDataRow {
  LatestOrderCodeViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LatestOrderCodeViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);
}
