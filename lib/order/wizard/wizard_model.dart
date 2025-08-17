import '/flutter_flow/flutter_flow_util.dart';
import '/order/wizard_step/wizard_step_widget.dart';
import 'wizard_widget.dart' show WizardWidget;
import 'package:flutter/material.dart';

class WizardModel extends FlutterFlowModel<WizardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for WizardStep component.
  late WizardStepModel wizardStepModel1;
  // Model for WizardStep component.
  late WizardStepModel wizardStepModel2;
  // Model for WizardStep component.
  late WizardStepModel wizardStepModel3;

  @override
  void initState(BuildContext context) {
    wizardStepModel1 = createModel(context, () => WizardStepModel());
    wizardStepModel2 = createModel(context, () => WizardStepModel());
    wizardStepModel3 = createModel(context, () => WizardStepModel());
  }

  @override
  void dispose() {
    wizardStepModel1.dispose();
    wizardStepModel2.dispose();
    wizardStepModel3.dispose();
  }
}
