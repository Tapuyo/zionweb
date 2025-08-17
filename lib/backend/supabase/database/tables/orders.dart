import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'Orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get orderDate => getField<DateTime>('order_date');
  set orderDate(DateTime? value) => setField<DateTime>('order_date', value);

  int? get deliveryId => getField<int>('delivery_id');
  set deliveryId(int? value) => setField<int>('delivery_id', value);

  int? get customerId => getField<int>('customer_id');
  set customerId(int? value) => setField<int>('customer_id', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  int? get dispatcherId => getField<int>('dispatcher_id');
  set dispatcherId(int? value) => setField<int>('dispatcher_id', value);

  String? get deliveryAddress => getField<String>('delivery_address');
  set deliveryAddress(String? value) =>
      setField<String>('delivery_address', value);

  DateTime? get deliveryStartDate => getField<DateTime>('delivery_start_date');
  set deliveryStartDate(DateTime? value) =>
      setField<DateTime>('delivery_start_date', value);

  DateTime? get deliveryEndDate => getField<DateTime>('delivery_end_date');
  set deliveryEndDate(DateTime? value) =>
      setField<DateTime>('delivery_end_date', value);

  String? get voucherCode => getField<String>('voucher_code');
  set voucherCode(String? value) => setField<String>('voucher_code', value);

  double? get shippingFee => getField<double>('shipping_fee');
  set shippingFee(double? value) => setField<double>('shipping_fee', value);

  bool? get xDeal => getField<bool>('x_deal');
  set xDeal(bool? value) => setField<bool>('x_deal', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get paymentId => getField<int>('payment_id');
  set paymentId(int? value) => setField<int>('payment_id', value);

  int? get warehouseId => getField<int>('warehouse_id');
  set warehouseId(int? value) => setField<int>('warehouse_id', value);

  bool? get isThirdParty => getField<bool>('is_third_party');
  set isThirdParty(bool? value) => setField<bool>('is_third_party', value);

  int? get thirdPartyCourierId => getField<int>('third_party_courier_id');
  set thirdPartyCourierId(int? value) =>
      setField<int>('third_party_courier_id', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get remarks => getField<String>('remarks');
  set remarks(String? value) => setField<String>('remarks', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get updatedBy => getField<int>('updated_by');
  set updatedBy(int? value) => setField<int>('updated_by', value);

  int? get truckId => getField<int>('truck_id');
  set truckId(int? value) => setField<int>('truck_id', value);
}
