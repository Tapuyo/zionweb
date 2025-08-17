import '/backend/supabase/supabase.dart';
import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/order/wizard_step/wizard_step_widget.dart';
import 'add_voucher_widget.dart' show AddVoucherWidget;
import 'package:flutter/material.dart';

class AddVoucherModel extends FlutterFlowModel<AddVoucherWidget> {
  ///  Local state fields for this component.

  int? index = 0;

  String? vouchercode;

  ///  State fields for stateful widgets in this component.

  // Model for WizardStep component.
  late WizardStepModel wizardStepModel1;
  // Model for WizardStep component.
  late WizardStepModel wizardStepModel2;
  // State field(s) for vcode widget.
  FocusNode? vcodeFocusNode;
  TextEditingController? vcodeTextController;
  String? Function(BuildContext, String?)? vcodeTextControllerValidator;
  // State field(s) for vtype widget.
  String? vtypeValue;
  FormFieldController<String>? vtypeValueController;
  // State field(s) for vamount widget.
  FocusNode? vamountFocusNode;
  TextEditingController? vamountTextController;
  String? Function(BuildContext, String?)? vamountTextControllerValidator;
  // State field(s) for vquantity widget.
  FocusNode? vquantityFocusNode;
  TextEditingController? vquantityTextController;
  String? Function(BuildContext, String?)? vquantityTextControllerValidator;
  // State field(s) for birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateTextController;
  String? Function(BuildContext, String?)? birthdateTextControllerValidator;
  DateTime? datePicked;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel;
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
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  VouchersRow? addvoucherresult;

  @override
  void initState(BuildContext context) {
    wizardStepModel1 = createModel(context, () => WizardStepModel());
    wizardStepModel2 = createModel(context, () => WizardStepModel());
    modalDetailsTitleComponentModel =
        createModel(context, () => ModalDetailsTitleComponentModel());
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
    wizardStepModel1.dispose();
    wizardStepModel2.dispose();
    vcodeFocusNode?.dispose();
    vcodeTextController?.dispose();

    vamountFocusNode?.dispose();
    vamountTextController?.dispose();

    vquantityFocusNode?.dispose();
    vquantityTextController?.dispose();

    birthdateFocusNode?.dispose();
    birthdateTextController?.dispose();

    modalDetailsTitleComponentModel.dispose();
    modalDetailsComponentModel1.dispose();
    modalDetailsComponentModel2.dispose();
    modalDetailsComponentModel3.dispose();
    modalDetailsComponentModel4.dispose();
    modalDetailsComponentModel5.dispose();
  }
}
