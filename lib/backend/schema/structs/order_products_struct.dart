// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderProductsStruct extends BaseStruct {
  OrderProductsStruct({
    int? id,
    String? code,
    String? name,
    int? price,
    int? quantity,
    String? voucher,
    String? image,
  })  : _id = id,
        _code = code,
        _name = name,
        _price = price,
        _quantity = quantity,
        _voucher = voucher,
        _image = image;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "Voucher" field.
  String? _voucher;
  String get voucher => _voucher ?? '';
  set voucher(String? val) => _voucher = val;

  bool hasVoucher() => _voucher != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static OrderProductsStruct fromMap(Map<String, dynamic> data) =>
      OrderProductsStruct(
        id: castToType<int>(data['Id']),
        code: data['Code'] as String?,
        name: data['Name'] as String?,
        price: castToType<int>(data['Price']),
        quantity: castToType<int>(data['Quantity']),
        voucher: data['Voucher'] as String?,
        image: data['Image'] as String?,
      );

  static OrderProductsStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderProductsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Code': _code,
        'Name': _name,
        'Price': _price,
        'Quantity': _quantity,
        'Voucher': _voucher,
        'Image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Code': serializeParam(
          _code,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Price': serializeParam(
          _price,
          ParamType.int,
        ),
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'Voucher': serializeParam(
          _voucher,
          ParamType.String,
        ),
        'Image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrderProductsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderProductsStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        code: deserializeParam(
          data['Code'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['Price'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
        voucher: deserializeParam(
          data['Voucher'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['Image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrderProductsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderProductsStruct &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        price == other.price &&
        quantity == other.quantity &&
        voucher == other.voucher &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, code, name, price, quantity, voucher, image]);
}

OrderProductsStruct createOrderProductsStruct({
  int? id,
  String? code,
  String? name,
  int? price,
  int? quantity,
  String? voucher,
  String? image,
}) =>
    OrderProductsStruct(
      id: id,
      code: code,
      name: name,
      price: price,
      quantity: quantity,
      voucher: voucher,
      image: image,
    );
