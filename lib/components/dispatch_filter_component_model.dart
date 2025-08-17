import '/backend/supabase/supabase.dart';
import '/components/action_buttons_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dispatch_filter_component_widget.dart'
    show DispatchFilterComponentWidget;
import 'package:flutter/material.dart';

class DispatchFilterComponentModel
    extends FlutterFlowModel<DispatchFilterComponentWidget> {
  ///  Local state fields for this component.

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

  String emptyMessage = 'Empty';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Statuses widget.
  FormFieldController<List<String>>? statusesValueController;
  String? get statusesValue => statusesValueController?.value?.firstOrNull;
  set statusesValue(String? val) =>
      statusesValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Action Block - filterList] action in Statuses widget.
  List<OrderPageViewRow>? filteredOrderListFrStatus;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Action Block - filterList] action in TextField widget.
  List<OrderPageViewRow>? filterOrderListFrSearch;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<OrderPageViewRow>();
  // Models for ActionButtons dynamic component.
  late FlutterFlowDynamicModels<ActionButtonsModel> actionButtonsModels;
  // State field(s) for DateRanger widget.
  FormFieldController<List<String>>? dateRangerValueController;
  String? get dateRangerValue => dateRangerValueController?.value?.firstOrNull;
  set dateRangerValue(String? val) =>
      dateRangerValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Action Block - filterList] action in DateRanger widget.
  List<OrderPageViewRow>? filteredOrderListFrDateRange;

  @override
  void initState(BuildContext context) {
    actionButtonsModels = FlutterFlowDynamicModels(() => ActionButtonsModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
    actionButtonsModels.dispose();
  }

  /// Action blocks.
  Future<List<OrderPageViewRow>?> filterList(BuildContext context) async {
    DateTime? dateRange;
    List<OrderPageViewRow>? allFilteredList;
    List<OrderPageViewRow>? rTDFilteredList;
    List<OrderPageViewRow>? elseFilteredList;

    selectedStatus = statusesValue!;
    selectedDateRange = dateRangerValue!;
    dateRange = await actions.getStartDateForRange(
      selectedDateRange,
    );
    if (selectedStatus == 'All') {
      allFilteredList = await OrderPageViewTable().queryRows(
        queryFn: (q) => q
            .ilike(
              'searchable_text',
              '%${textController.text}%',
            )
            .gteOrNull(
              'created_at',
              supaSerialize<DateTime>(dateRange),
            )
            .neqOrNull(
              'status',
              'Draft',
            ),
      );
      ordersList = allFilteredList.toList().cast<OrderPageViewRow>();
    } else if ((selectedStatus == 'Ready-to-Dispatch') ||
        (selectedStatus == 'Awaiting-Logistics-Confirmation')) {
      rTDFilteredList = await OrderPageViewTable().queryRows(
        queryFn: (q) => q
            .ilike(
          'searchable_text',
          '%${textController.text}%',
        )
            .inFilterOrNull(
          'status',
          ['Awaiting-Logistics-Confirmation', 'Ready-to-Dispatch'],
        ).gteOrNull(
          'created_at',
          supaSerialize<DateTime>(dateRange),
        ),
      );
      ordersList = rTDFilteredList.toList().cast<OrderPageViewRow>();
    } else {
      elseFilteredList = await OrderPageViewTable().queryRows(
        queryFn: (q) => q
            .ilike(
              'searchable_text',
              '%${textController.text}%',
            )
            .eqOrNull(
              'status',
              selectedStatus,
            )
            .gteOrNull(
              'created_at',
              supaSerialize<DateTime>(dateRange),
            ),
      );
      ordersList = elseFilteredList.toList().cast<OrderPageViewRow>();
    }

    return null;
  }
}
