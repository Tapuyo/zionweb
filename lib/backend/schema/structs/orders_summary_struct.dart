// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersSummaryStruct extends BaseStruct {
  OrdersSummaryStruct({
    String? rangeLabel,
    double? totalRevenue,
    int? totalOrders,
    double? totalShippingFee,
    int? totalCancelledOrders,
  })  : _rangeLabel = rangeLabel,
        _totalRevenue = totalRevenue,
        _totalOrders = totalOrders,
        _totalShippingFee = totalShippingFee,
        _totalCancelledOrders = totalCancelledOrders;

  // "range_label" field.
  String? _rangeLabel;
  String get rangeLabel => _rangeLabel ?? '0';
  set rangeLabel(String? val) => _rangeLabel = val;

  bool hasRangeLabel() => _rangeLabel != null;

  // "total_revenue" field.
  double? _totalRevenue;
  double get totalRevenue => _totalRevenue ?? 0.0;
  set totalRevenue(double? val) => _totalRevenue = val;

  void incrementTotalRevenue(double amount) =>
      totalRevenue = totalRevenue + amount;

  bool hasTotalRevenue() => _totalRevenue != null;

  // "total_orders" field.
  int? _totalOrders;
  int get totalOrders => _totalOrders ?? 0;
  set totalOrders(int? val) => _totalOrders = val;

  void incrementTotalOrders(int amount) => totalOrders = totalOrders + amount;

  bool hasTotalOrders() => _totalOrders != null;

  // "total_shipping_fee" field.
  double? _totalShippingFee;
  double get totalShippingFee => _totalShippingFee ?? 0.0;
  set totalShippingFee(double? val) => _totalShippingFee = val;

  void incrementTotalShippingFee(double amount) =>
      totalShippingFee = totalShippingFee + amount;

  bool hasTotalShippingFee() => _totalShippingFee != null;

  // "total_cancelled_orders" field.
  int? _totalCancelledOrders;
  int get totalCancelledOrders => _totalCancelledOrders ?? 0;
  set totalCancelledOrders(int? val) => _totalCancelledOrders = val;

  void incrementTotalCancelledOrders(int amount) =>
      totalCancelledOrders = totalCancelledOrders + amount;

  bool hasTotalCancelledOrders() => _totalCancelledOrders != null;

  static OrdersSummaryStruct fromMap(Map<String, dynamic> data) =>
      OrdersSummaryStruct(
        rangeLabel: data['range_label'] as String?,
        totalRevenue: castToType<double>(data['total_revenue']),
        totalOrders: castToType<int>(data['total_orders']),
        totalShippingFee: castToType<double>(data['total_shipping_fee']),
        totalCancelledOrders: castToType<int>(data['total_cancelled_orders']),
      );

  static OrdersSummaryStruct? maybeFromMap(dynamic data) => data is Map
      ? OrdersSummaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'range_label': _rangeLabel,
        'total_revenue': _totalRevenue,
        'total_orders': _totalOrders,
        'total_shipping_fee': _totalShippingFee,
        'total_cancelled_orders': _totalCancelledOrders,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'range_label': serializeParam(
          _rangeLabel,
          ParamType.String,
        ),
        'total_revenue': serializeParam(
          _totalRevenue,
          ParamType.double,
        ),
        'total_orders': serializeParam(
          _totalOrders,
          ParamType.int,
        ),
        'total_shipping_fee': serializeParam(
          _totalShippingFee,
          ParamType.double,
        ),
        'total_cancelled_orders': serializeParam(
          _totalCancelledOrders,
          ParamType.int,
        ),
      }.withoutNulls;

  static OrdersSummaryStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrdersSummaryStruct(
        rangeLabel: deserializeParam(
          data['range_label'],
          ParamType.String,
          false,
        ),
        totalRevenue: deserializeParam(
          data['total_revenue'],
          ParamType.double,
          false,
        ),
        totalOrders: deserializeParam(
          data['total_orders'],
          ParamType.int,
          false,
        ),
        totalShippingFee: deserializeParam(
          data['total_shipping_fee'],
          ParamType.double,
          false,
        ),
        totalCancelledOrders: deserializeParam(
          data['total_cancelled_orders'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OrdersSummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrdersSummaryStruct &&
        rangeLabel == other.rangeLabel &&
        totalRevenue == other.totalRevenue &&
        totalOrders == other.totalOrders &&
        totalShippingFee == other.totalShippingFee &&
        totalCancelledOrders == other.totalCancelledOrders;
  }

  @override
  int get hashCode => const ListEquality().hash([
        rangeLabel,
        totalRevenue,
        totalOrders,
        totalShippingFee,
        totalCancelledOrders
      ]);
}

OrdersSummaryStruct createOrdersSummaryStruct({
  String? rangeLabel,
  double? totalRevenue,
  int? totalOrders,
  double? totalShippingFee,
  int? totalCancelledOrders,
}) =>
    OrdersSummaryStruct(
      rangeLabel: rangeLabel,
      totalRevenue: totalRevenue,
      totalOrders: totalOrders,
      totalShippingFee: totalShippingFee,
      totalCancelledOrders: totalCancelledOrders,
    );
