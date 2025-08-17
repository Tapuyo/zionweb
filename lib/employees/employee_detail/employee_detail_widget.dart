import '/backend/supabase/supabase.dart';
import '/employees/employee_basic_detail/employee_basic_detail_widget.dart';
import '/employees/employee_information/employee_information_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'employee_detail_model.dart';
export 'employee_detail_model.dart';

class EmployeeDetailWidget extends StatefulWidget {
  const EmployeeDetailWidget({
    super.key,
    required this.employeeDetail,
  });

  final EmployeeviewRow? employeeDetail;

  @override
  State<EmployeeDetailWidget> createState() => _EmployeeDetailWidgetState();
}

class _EmployeeDetailWidgetState extends State<EmployeeDetailWidget> {
  late EmployeeDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeDetailModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.employeeBasicDetailModel,
            updateCallback: () => safeSetState(() {}),
            child: EmployeeBasicDetailWidget(
              image: widget.employeeDetail?.image,
              id: valueOrDefault<int>(
                widget.employeeDetail?.id,
                1,
              ),
              firstName: valueOrDefault<String>(
                widget.employeeDetail?.firstName,
                'Chris',
              ),
              lastName: valueOrDefault<String>(
                widget.employeeDetail?.lastName,
                'Santos',
              ),
              daysRegistered: valueOrDefault<double>(
                widget.employeeDetail?.daysSinceRegistration,
                1.0,
              ),
            ),
          ),
          wrapWithModel(
            model: _model.employeeInformationModel,
            updateCallback: () => safeSetState(() {}),
            child: EmployeeInformationWidget(
              firstName: valueOrDefault<String>(
                widget.employeeDetail?.firstName,
                'Chris',
              ),
              lastName: valueOrDefault<String>(
                widget.employeeDetail?.lastName,
                'Santos',
              ),
              role: valueOrDefault<String>(
                widget.employeeDetail?.type,
                'Admin',
              ),
              email: valueOrDefault<String>(
                widget.employeeDetail?.email,
                'csantos@gmail.com',
              ),
              phone: valueOrDefault<String>(
                widget.employeeDetail?.phoneNumber,
                '123',
              ),
            ),
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
