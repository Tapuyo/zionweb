import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modal_details_title_component_model.dart';
export 'modal_details_title_component_model.dart';

class ModalDetailsTitleComponentWidget extends StatefulWidget {
  const ModalDetailsTitleComponentWidget({
    super.key,
    String? title,
  }) : this.title = title ?? 'title';

  final String title;

  @override
  State<ModalDetailsTitleComponentWidget> createState() =>
      _ModalDetailsTitleComponentWidgetState();
}

class _ModalDetailsTitleComponentWidgetState
    extends State<ModalDetailsTitleComponentWidget> {
  late ModalDetailsTitleComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalDetailsTitleComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Text(
        widget.title,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).primary,
              fontSize: 12.8,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
            ),
      ),
    );
  }
}
