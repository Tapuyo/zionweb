import '../database.dart';

class TruckTable extends SupabaseTable<TruckRow> {
  @override
  String get tableName => 'Truck';

  @override
  TruckRow createRow(Map<String, dynamic> data) => TruckRow(data);
}

class TruckRow extends SupabaseDataRow {
  TruckRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TruckTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get plateNumber => getField<String>('plate_number');
  set plateNumber(String? value) => setField<String>('plate_number', value);

  bool? get isRegional => getField<bool>('is_regional');
  set isRegional(bool? value) => setField<bool>('is_regional', value);
}
