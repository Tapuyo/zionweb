import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modal_details_component_model.dart';
export 'modal_details_component_model.dart';

class ModalDetailsComponentWidget extends StatefulWidget {
  const ModalDetailsComponentWidget({
    super.key,
    String? label,
    String? value,
  })  : this.label = label ?? 'label',
        this.value = value ?? 'value';

  final String label;
  final String value;

  @override
  State<ModalDetailsComponentWidget> createState() =>
      _ModalDetailsComponentWidgetState();
}

class _ModalDetailsComponentWidgetState
    extends State<ModalDetailsComponentWidget> {
  late ModalDetailsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalDetailsComponentModel());

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
                  color: FlutterFlowTheme.of(context).black50,
                  fontSize: 12.8,
                  letterSpacing: 0.0,
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
