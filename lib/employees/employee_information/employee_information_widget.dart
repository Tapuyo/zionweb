import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'employee_information_model.dart';
export 'employee_information_model.dart';

class EmployeeInformationWidget extends StatefulWidget {
  const EmployeeInformationWidget({
    super.key,
    this.firstName,
    this.lastName,
    this.role,
    this.email,
    this.phone,
  });

  final String? firstName;
  final String? lastName;
  final String? role;
  final String? email;
  final String? phone;

  @override
  State<EmployeeInformationWidget> createState() =>
      _EmployeeInformationWidgetState();
}

class _EmployeeInformationWidgetState extends State<EmployeeInformationWidget> {
  late EmployeeInformationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeInformationModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryBackground,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Employee Information',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).choco100,
                    fontSize: 12.8,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.modalDetailsComponentModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: ModalDetailsComponentWidget(
                    label: 'First Name',
                    value: widget.firstName,
                  ),
                ),
                wrapWithModel(
                  model: _model.modalDetailsComponentModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: ModalDetailsComponentWidget(
                    label: 'Last Name',
                    value: widget.lastName,
                  ),
                ),
                wrapWithModel(
                  model: _model.modalDetailsComponentModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: ModalDetailsComponentWidget(
                    label: 'Role / Position',
                    value: widget.role,
                  ),
                ),
                wrapWithModel(
                  model: _model.modalDetailsComponentModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: ModalDetailsComponentWidget(
                    label: 'Email',
                    value: widget.email,
                  ),
                ),
                wrapWithModel(
                  model: _model.modalDetailsComponentModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: ModalDetailsComponentWidget(
                    label: 'Phone Number',
                    value: widget.phone,
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
