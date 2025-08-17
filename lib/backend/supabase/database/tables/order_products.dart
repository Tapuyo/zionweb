import '../database.dart';

class OrderProductsTable extends SupabaseTable<OrderProductsRow> {
  @override
  String get tableName => 'OrderProducts';

  @override
  OrderProductsRow createRow(Map<String, dynamic> data) =>
      OrderProductsRow(data);
}

class OrderProductsRow extends SupabaseDataRow {
  OrderProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  double? get quantity => getField<double>('quantity');
  set quantity(double? value) => setField<double>('quantity', value);

  String? get voucherCode => getField<String>('voucher_code');
  set voucherCode(String? value) => setField<String>('voucher_code', value);

  double? get discountedPrice => getField<double>('discounted_price');
  set discountedPrice(double? value) =>
      setField<double>('discounted_price', value);

  double? get voucherAmount => getField<double>('voucher_amount');
  set voucherAmount(double? value) => setField<double>('voucher_amount', value);
}
