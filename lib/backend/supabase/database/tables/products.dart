import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'Products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get sold => getField<int>('sold');
  set sold(int? value) => setField<int>('sold', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  bool? get archived => getField<bool>('archived');
  set archived(bool? value) => setField<bool>('archived', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);
}
