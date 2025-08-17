import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/side_nav/side_nav_widget.dart';
import 'employees_page_widget.dart' show EmployeesPageWidget;
import 'package:flutter/material.dart';

class EmployeesPageModel extends FlutterFlowModel<EmployeesPageWidget> {
  ///  Local state fields for this page.

  List<EmployeeviewRow> employeeList = [];
  void addToEmployeeList(EmployeeviewRow item) => employeeList.add(item);
  void removeFromEmployeeList(EmployeeviewRow item) =>
      employeeList.remove(item);
  void removeAtIndexFromEmployeeList(int index) => employeeList.removeAt(index);
  void insertAtIndexInEmployeeList(int index, EmployeeviewRow item) =>
      employeeList.insert(index, item);
  void updateEmployeeListAtIndex(
          int index, Function(EmployeeviewRow) updateFn) =>
      employeeList[index] = updateFn(employeeList[index]);

  bool refreshTrigger = false;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for SummaryChoice widget.
  FormFieldController<List<String>>? summaryChoiceValueController;
  String? get summaryChoiceValue =>
      summaryChoiceValueController?.value?.firstOrNull;
  set summaryChoiceValue(String? val) =>
      summaryChoiceValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in SummaryChoice widget.
  List<EmployeeCountByRangeViewRow>? summaryChoice;
  // State field(s) for Roles widget.
  FormFieldController<List<String>>? rolesValueController;
  String? get rolesValue => rolesValueController?.value?.firstOrNull;
  set rolesValue(String? val) =>
      rolesValueController?.value = val != null ? [val] : [];
  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<EmployeeviewRow>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    paginatedDataTableController.dispose();
  }

  /// Action blocks.
  Future filterList(BuildContext context) async {
    List<EmployeeviewRow>? filteredEmployeeByAll;
    List<EmployeeviewRow>? filteredEmployeeByArchived;
    List<EmployeeviewRow>? filteredEmployeeByRole;

    if (rolesValue == 'All') {
      filteredEmployeeByAll = await EmployeeviewTable().queryRows(
        queryFn: (q) => q.ilike(
          'search_text',
          '%${searchTextController.text}%',
        ),
      );
      employeeList = filteredEmployeeByAll.toList().cast<EmployeeviewRow>();
    } else if (rolesValue == 'Archived') {
      filteredEmployeeByArchived = await EmployeeviewTable().queryRows(
        queryFn: (q) => q
            .ilike(
              'search_text',
              '%${searchTextController.text}%',
            )
            .eqOrNull(
              'deleted',
              true,
            ),
      );
      employeeList =
          filteredEmployeeByArchived.toList().cast<EmployeeviewRow>();
    } else {
      filteredEmployeeByRole = await EmployeeviewTable().queryRows(
        queryFn: (q) => q
            .ilike(
              'search_text',
              '%${searchTextController.text}%',
            )
            .eqOrNull(
              'type',
              rolesValue,
            )
            .eqOrNull(
              'deleted',
              false,
            ),
      );
      employeeList = filteredEmployeeByRole.toList().cast<EmployeeviewRow>();
    }
  }
}
