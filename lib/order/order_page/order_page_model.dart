import '/backend/supabase/supabase.dart';
import '/components/order_filter_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/order/order_summary/order_summary_widget.dart';
import '/pages/side_nav/side_nav_widget.dart';
import 'order_page_widget.dart' show OrderPageWidget;
import 'package:flutter/material.dart';

class OrderPageModel extends FlutterFlowModel<OrderPageWidget> {
  ///  Local state fields for this page.

  List<ProductsRow> productList = [];
  void addToProductList(ProductsRow item) => productList.add(item);
  void removeFromProductList(ProductsRow item) => productList.remove(item);
  void removeAtIndexFromProductList(int index) => productList.removeAt(index);
  void insertAtIndexInProductList(int index, ProductsRow item) =>
      productList.insert(index, item);
  void updateProductListAtIndex(int index, Function(ProductsRow) updateFn) =>
      productList[index] = updateFn(productList[index]);

  bool? isArchived;

  List<OrderPageViewRow> ordersList = [];
  void addToOrdersList(OrderPageViewRow item) => ordersList.add(item);
  void removeFromOrdersList(OrderPageViewRow item) => ordersList.remove(item);
  void removeAtIndexFromOrdersList(int index) => ordersList.removeAt(index);
  void insertAtIndexInOrdersList(int index, OrderPageViewRow item) =>
      ordersList.insert(index, item);
  void updateOrdersListAtIndex(
          int index, Function(OrderPageViewRow) updateFn) =>
      ordersList[index] = updateFn(ordersList[index]);

  String selectedStatus = 'All';

  String? searchText;

  String selectedDateRange = 'ALL';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in OrderPage widget.
  List<ProductsRow>? productsInitList;
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for SummaryChoice widget.
  FormFieldController<List<String>>? summaryChoiceValueController;
  String? get summaryChoiceValue =>
      summaryChoiceValueController?.value?.firstOrNull;
  set summaryChoiceValue(String? val) =>
      summaryChoiceValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in SummaryChoice widget.
  List<OrderSummaryByRangeViewRow>? summaryChoice;
  // Model for OrderSummary component.
  late OrderSummaryModel orderSummaryModel1;
  // Model for OrderSummary component.
  late OrderSummaryModel orderSummaryModel2;
  // Model for OrderSummary component.
  late OrderSummaryModel orderSummaryModel3;
  // Model for OrderSummary component.
  late OrderSummaryModel orderSummaryModel4;
  // State field(s) for SalesChoice widget.
  FormFieldController<List<String>>? salesChoiceValueController;
  String? get salesChoiceValue =>
      salesChoiceValueController?.value?.firstOrNull;
  set salesChoiceValue(String? val) =>
      salesChoiceValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in SalesChoice widget.
  List<OrderSalesDeliveredByRangeViewRow>? salesChoice;
  // Model for OrderSummary component.
  late OrderSummaryModel orderSummaryModel5;
  // Model for OrderFilterComponent component.
  late OrderFilterComponentModel orderFilterComponentModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    orderSummaryModel1 = createModel(context, () => OrderSummaryModel());
    orderSummaryModel2 = createModel(context, () => OrderSummaryModel());
    orderSummaryModel3 = createModel(context, () => OrderSummaryModel());
    orderSummaryModel4 = createModel(context, () => OrderSummaryModel());
    orderSummaryModel5 = createModel(context, () => OrderSummaryModel());
    orderFilterComponentModel =
        createModel(context, () => OrderFilterComponentModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    orderSummaryModel1.dispose();
    orderSummaryModel2.dispose();
    orderSummaryModel3.dispose();
    orderSummaryModel4.dispose();
    orderSummaryModel5.dispose();
    orderFilterComponentModel.dispose();
  }
}
