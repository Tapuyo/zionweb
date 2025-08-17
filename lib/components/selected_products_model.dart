import '/backend/schema/structs/index.dart';
import '/components/order_breakdown_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'selected_products_widget.dart' show SelectedProductsWidget;
import 'package:flutter/material.dart';

class SelectedProductsModel extends FlutterFlowModel<SelectedProductsWidget> {
  ///  Local state fields for this component.

  List<OrderProductsStruct> products = [];
  void addToProducts(OrderProductsStruct item) => products.add(item);
  void removeFromProducts(OrderProductsStruct item) => products.remove(item);
  void removeAtIndexFromProducts(int index) => products.removeAt(index);
  void insertAtIndexInProducts(int index, OrderProductsStruct item) =>
      products.insert(index, item);
  void updateProductsAtIndex(
          int index, Function(OrderProductsStruct) updateFn) =>
      products[index] = updateFn(products[index]);

  ///  State fields for stateful widgets in this component.

  // Models for orderBreakdownComponent dynamic component.
  late FlutterFlowDynamicModels<OrderBreakdownComponentModel>
      orderBreakdownComponentModels;

  @override
  void initState(BuildContext context) {
    orderBreakdownComponentModels =
        FlutterFlowDynamicModels(() => OrderBreakdownComponentModel());
  }

  @override
  void dispose() {
    orderBreakdownComponentModels.dispose();
  }
}
