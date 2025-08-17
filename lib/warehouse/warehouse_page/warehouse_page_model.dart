import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/side_nav/side_nav_widget.dart';
import 'warehouse_page_widget.dart' show WarehousePageWidget;
import 'package:flutter/material.dart';

class WarehousePageModel extends FlutterFlowModel<WarehousePageWidget> {
  ///  Local state fields for this page.

  List<WarehouseRow> whList = [];
  void addToWhList(WarehouseRow item) => whList.add(item);
  void removeFromWhList(WarehouseRow item) => whList.remove(item);
  void removeAtIndexFromWhList(int index) => whList.removeAt(index);
  void insertAtIndexInWhList(int index, WarehouseRow item) =>
      whList.insert(index, item);
  void updateWhListAtIndex(int index, Function(WarehouseRow) updateFn) =>
      whList[index] = updateFn(whList[index]);

  bool? isArchived;

  int? totalWarehouses;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in WarehousePage widget.
  List<WarehouseRow>? warehouseInitList;
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Query Rows] action in Tab widget.
  List<WarehouseRow>? warehouseActiveList;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<WarehouseRow>();
  // Stores action output result for [Backend Call - Query Rows] action in Tab widget.
  List<WarehouseRow>? warehouseArchiveList;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<WarehouseRow>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in TextField widget.
  List<WarehouseRow>? searchWarehouse;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    tabBarController?.dispose();
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
