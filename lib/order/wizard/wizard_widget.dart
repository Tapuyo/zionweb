import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/order/wizard_step/wizard_step_widget.dart';
import 'package:flutter/material.dart';
import 'wizard_model.dart';
export 'wizard_model.dart';

class WizardWidget extends StatefulWidget {
  const WizardWidget({
    super.key,
    int? index,
  }) : this.index = index ?? 90;

  final int index;

  @override
  State<WizardWidget> createState() => _WizardWidgetState();
}

class _WizardWidgetState extends State<WizardWidget> {
  late WizardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WizardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          wrapWithModel(
            model: _model.wizardStepModel1,
            updateCallback: () => safeSetState(() {}),
            child: WizardStepWidget(
              step: 1,
              stepTitle: 'Information',
              bgColor: widget.index == 0
                  ? FlutterFlowTheme.of(context).choco100
                  : FlutterFlowTheme.of(context).choco4,
              txtColor: widget.index == 0
                  ? FlutterFlowTheme.of(context).white100
                  : FlutterFlowTheme.of(context).choco100,
            ),
          ),
          wrapWithModel(
            model: _model.wizardStepModel2,
            updateCallback: () => safeSetState(() {}),
            child: WizardStepWidget(
              step: 2,
              stepTitle: 'Orders',
              bgColor: widget.index == 1
                  ? FlutterFlowTheme.of(context).choco100
                  : FlutterFlowTheme.of(context).choco4,
              txtColor: widget.index == 1
                  ? FlutterFlowTheme.of(context).white100
                  : FlutterFlowTheme.of(context).choco100,
            ),
          ),
          wrapWithModel(
            model: _model.wizardStepModel3,
            updateCallback: () => safeSetState(() {}),
            child: WizardStepWidget(
              step: 3,
              stepTitle: 'Summary',
              bgColor: widget.index == 2
                  ? FlutterFlowTheme.of(context).choco100
                  : FlutterFlowTheme.of(context).choco4,
              txtColor: widget.index == 2
                  ? FlutterFlowTheme.of(context).white100
                  : FlutterFlowTheme.of(context).choco100,
            ),
          ),
        ],
      ),
    );
  }
}
