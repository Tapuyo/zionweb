import '/backend/supabase/supabase.dart';
import '/calendar/summary/summary_widget.dart';
import '/components/dispatch_filter_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/side_nav/side_nav_widget.dart';
import 'calendar_page_widget.dart' show CalendarPageWidget;
import 'package:flutter/material.dart';

class CalendarPageModel extends FlutterFlowModel<CalendarPageWidget> {
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

  List<OrderStatusSummaryByRangeViewRow> orderSummary = [];
  void addToOrderSummary(OrderStatusSummaryByRangeViewRow item) =>
      orderSummary.add(item);
  void removeFromOrderSummary(OrderStatusSummaryByRangeViewRow item) =>
      orderSummary.remove(item);
  void removeAtIndexFromOrderSummary(int index) => orderSummary.removeAt(index);
  void insertAtIndexInOrderSummary(
          int index, OrderStatusSummaryByRangeViewRow item) =>
      orderSummary.insert(index, item);
  void updateOrderSummaryAtIndex(
          int index, Function(OrderStatusSummaryByRangeViewRow) updateFn) =>
      orderSummary[index] = updateFn(orderSummary[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in CalendarPage widget.
  List<ProductsRow>? productsInitList;
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for DateRanger widget.
  FormFieldController<List<String>>? dateRangerValueController;
  String? get dateRangerValue => dateRangerValueController?.value?.firstOrNull;
  set dateRangerValue(String? val) =>
      dateRangerValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in DateRanger widget.
  List<OrderStatusSummaryByRangeViewRow>? orderStatusSummaryQuery;
  // Model for Summary component.
  late SummaryModel summaryModel1;
  // Model for Summary component.
  late SummaryModel summaryModel2;
  // Model for Summary component.
  late SummaryModel summaryModel3;
  // Model for Summary component.
  late SummaryModel summaryModel4;
  // Model for Summary component.
  late SummaryModel summaryModel5;
  // Model for Summary component.
  late SummaryModel summaryModel6;
  // Model for DispatchFilterComponent component.
  late DispatchFilterComponentModel dispatchFilterComponentModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    summaryModel1 = createModel(context, () => SummaryModel());
    summaryModel2 = createModel(context, () => SummaryModel());
    summaryModel3 = createModel(context, () => SummaryModel());
    summaryModel4 = createModel(context, () => SummaryModel());
    summaryModel5 = createModel(context, () => SummaryModel());
    summaryModel6 = createModel(context, () => SummaryModel());
    dispatchFilterComponentModel =
        createModel(context, () => DispatchFilterComponentModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    summaryModel1.dispose();
    summaryModel2.dispose();
    summaryModel3.dispose();
    summaryModel4.dispose();
    summaryModel5.dispose();
    summaryModel6.dispose();
    dispatchFilterComponentModel.dispose();
  }
}
