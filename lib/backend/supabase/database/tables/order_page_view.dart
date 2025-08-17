import '../database.dart';

class OrderPageViewTable extends SupabaseTable<OrderPageViewRow> {
  @override
  String get tableName => 'order_page_view';

  @override
  OrderPageViewRow createRow(Map<String, dynamic> data) =>
      OrderPageViewRow(data);
}

class OrderPageViewRow extends SupabaseDataRow {
  OrderPageViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderPageViewTable();

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  double? get quantity => getField<double>('quantity');
  set quantity(double? value) => setField<double>('quantity', value);

  double? get discountedPrice => getField<double>('discounted_price');
  set discountedPrice(double? value) =>
      setField<double>('discounted_price', value);

  double? get voucherAmount => getField<double>('voucher_amount');
  set voucherAmount(double? value) => setField<double>('voucher_amount', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get productImage => getField<String>('product_image');
  set productImage(String? value) => setField<String>('product_image', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get contact => getField<String>('contact');
  set contact(String? value) => setField<String>('contact', value);

  String? get paymentMethod => getField<String>('payment_method');
  set paymentMethod(String? value) => setField<String>('payment_method', value);

  String? get warehouseName => getField<String>('warehouse_name');
  set warehouseName(String? value) => setField<String>('warehouse_name', value);

  DateTime? get deliveryStartDate => getField<DateTime>('delivery_start_date');
  set deliveryStartDate(DateTime? value) =>
      setField<DateTime>('delivery_start_date', value);

  String? get searchableText => getField<String>('searchable_text');
  set searchableText(String? value) =>
      setField<String>('searchable_text', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get updatedHoursAgo => getField<int>('updated_hours_ago');
  set updatedHoursAgo(int? value) => setField<int>('updated_hours_ago', value);
}
