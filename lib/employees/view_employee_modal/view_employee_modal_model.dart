import '/components/roles_widget.dart';
import '/employees/employee_basic_detail/employee_basic_detail_widget.dart';
import '/employees/employee_detail/employee_detail_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_employee_modal_widget.dart' show ViewEmployeeModalWidget;
import 'package:flutter/material.dart';

class ViewEmployeeModalModel extends FlutterFlowModel<ViewEmployeeModalWidget> {
  ///  Local state fields for this component.

  String? employeeImage;

  int startPage = 0;

  ///  State fields for stateful widgets in this component.

  // Model for roles component.
  late RolesModel rolesModel;
  // State field(s) for ViewPage widget.
  PageController? viewPageController;

  int get viewPageCurrentIndex => viewPageController != null &&
          viewPageController!.hasClients &&
          viewPageController!.page != null
      ? viewPageController!.page!.round()
      : 0;
  // Model for EmployeeDetail component.
  late EmployeeDetailModel employeeDetailModel1;
  // Model for EmployeeDetail component.
  late EmployeeDetailModel employeeDetailModel2;
  // Model for EmployeeBasicDetail component.
  late EmployeeBasicDetailModel employeeBasicDetailModel1;
  // Model for EmployeeDetail component.
  late EmployeeDetailModel employeeDetailModel3;
  // Model for EmployeeDetail component.
  late EmployeeDetailModel employeeDetailModel4;
  // Model for EmployeeBasicDetail component.
  late EmployeeBasicDetailModel employeeBasicDetailModel2;

  @override
  void initState(BuildContext context) {
    rolesModel = createModel(context, () => RolesModel());
    employeeDetailModel1 = createModel(context, () => EmployeeDetailModel());
    employeeDetailModel2 = createModel(context, () => EmployeeDetailModel());
    employeeBasicDetailModel1 =
        createModel(context, () => EmployeeBasicDetailModel());
    employeeDetailModel3 = createModel(context, () => EmployeeDetailModel());
    employeeDetailModel4 = createModel(context, () => EmployeeDetailModel());
    employeeBasicDetailModel2 =
        createModel(context, () => EmployeeBasicDetailModel());
  }

  @override
  void dispose() {
    rolesModel.dispose();
    employeeDetailModel1.dispose();
    employeeDetailModel2.dispose();
    employeeBasicDetailModel1.dispose();
    employeeDetailModel3.dispose();
    employeeDetailModel4.dispose();
    employeeBasicDetailModel2.dispose();
  }
}
