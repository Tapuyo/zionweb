import '/employees/employee_basic_detail/employee_basic_detail_widget.dart';
import '/employees/employee_information/employee_information_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'employee_detail_widget.dart' show EmployeeDetailWidget;
import 'package:flutter/material.dart';

class EmployeeDetailModel extends FlutterFlowModel<EmployeeDetailWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EmployeeBasicDetail component.
  late EmployeeBasicDetailModel employeeBasicDetailModel;
  // Model for EmployeeInformation component.
  late EmployeeInformationModel employeeInformationModel;

  @override
  void initState(BuildContext context) {
    employeeBasicDetailModel =
        createModel(context, () => EmployeeBasicDetailModel());
    employeeInformationModel =
        createModel(context, () => EmployeeInformationModel());
  }

  @override
  void dispose() {
    employeeBasicDetailModel.dispose();
    employeeInformationModel.dispose();
  }
}
