import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modal_main_details700_component_model.dart';
export 'modal_main_details700_component_model.dart';

class ModalMainDetails700ComponentWidget extends StatefulWidget {
  const ModalMainDetails700ComponentWidget({
    super.key,
    String? label,
    String? value,
  })  : this.label = label ?? 'label',
        this.value = value ?? 'value';

  final String label;
  final String value;

  @override
  State<ModalMainDetails700ComponentWidget> createState() =>
      _ModalMainDetails700ComponentWidgetState();
}

class _ModalMainDetails700ComponentWidgetState
    extends State<ModalMainDetails700ComponentWidget> {
  late ModalMainDetails700ComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalMainDetails700ComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            widget.label,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).black100,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  lineHeight: 1.2,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            widget.value,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).black100,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  lineHeight: 1.2,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ),
      ],
    );
  }
}
