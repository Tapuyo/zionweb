import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'employee_information_widget.dart' show EmployeeInformationWidget;
import 'package:flutter/material.dart';

class EmployeeInformationModel
    extends FlutterFlowModel<EmployeeInformationWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel1;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel2;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel3;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel4;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel5;

  @override
  void initState(BuildContext context) {
    modalDetailsComponentModel1 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel2 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel3 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel4 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel5 =
        createModel(context, () => ModalDetailsComponentModel());
  }

  @override
  void dispose() {
    modalDetailsComponentModel1.dispose();
    modalDetailsComponentModel2.dispose();
    modalDetailsComponentModel3.dispose();
    modalDetailsComponentModel4.dispose();
    modalDetailsComponentModel5.dispose();
  }
}
