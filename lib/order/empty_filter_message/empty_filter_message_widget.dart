import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_filter_message_model.dart';
export 'empty_filter_message_model.dart';

class EmptyFilterMessageWidget extends StatefulWidget {
  const EmptyFilterMessageWidget({
    super.key,
    String? message,
  }) : this.message = message ?? 'Empty';

  final String message;

  @override
  State<EmptyFilterMessageWidget> createState() =>
      _EmptyFilterMessageWidgetState();
}

class _EmptyFilterMessageWidgetState extends State<EmptyFilterMessageWidget> {
  late EmptyFilterMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyFilterMessageModel());

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.message,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                fontSize: 34.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodyMediumIsCustom,
              ),
        ),
      ],
    );
  }
}
