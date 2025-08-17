import '../database.dart';

class WarehouseTable extends SupabaseTable<WarehouseRow> {
  @override
  String get tableName => 'Warehouse';

  @override
  WarehouseRow createRow(Map<String, dynamic> data) => WarehouseRow(data);
}

class WarehouseRow extends SupabaseDataRow {
  WarehouseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WarehouseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  bool? get deleted => getField<bool>('deleted');
  set deleted(bool? value) => setField<bool>('deleted', value);
}
