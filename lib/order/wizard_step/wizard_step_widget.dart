import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'wizard_step_model.dart';
export 'wizard_step_model.dart';

class WizardStepWidget extends StatefulWidget {
  const WizardStepWidget({
    super.key,
    int? step,
    String? stepTitle,
    this.bgColor,
    this.txtColor,
  })  : this.step = step ?? 1,
        this.stepTitle = stepTitle ?? 'Step';

  final int step;
  final String stepTitle;
  final Color? bgColor;
  final Color? txtColor;

  @override
  State<WizardStepWidget> createState() => _WizardStepWidgetState();
}

class _WizardStepWidgetState extends State<WizardStepWidget> {
  late WizardStepModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WizardStepModel());

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
          Container(
            width: 23.0,
            height: 23.0,
            decoration: BoxDecoration(
              color: widget.bgColor,
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              widget.step.toString(),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: widget.txtColor,
                    fontSize: 12.8,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
          ),
          Text(
            widget.stepTitle,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 10.24,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}
