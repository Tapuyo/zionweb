import 'package:collection/collection.dart';

enum Statuses {
  All,
  NewOrders,
  Dispatched,
  InTransit,
  Delivered,
  OnHold,
  Cancelled,
  Drafts,
  ReadyToDispatch,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Statuses):
      return Statuses.values.deserialize(value) as T?;
    default:
      return null;
  }
}
