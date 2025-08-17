import '/calendar/dispatch_modal/dispatch_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'action_buttons_model.dart';
export 'action_buttons_model.dart';

class ActionButtonsWidget extends StatefulWidget {
  const ActionButtonsWidget({
    super.key,
    required this.status,
    required this.orderId,
  });

  final String? status;
  final int? orderId;

  @override
  State<ActionButtonsWidget> createState() => _ActionButtonsWidgetState();
}

class _ActionButtonsWidgetState extends State<ActionButtonsWidget> {
  late ActionButtonsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionButtonsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.status == FFAppConstants.ReadyToDispatch,
      child: Builder(
        builder: (context) => FFButtonWidget(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: DispatchModalWidget(
                    id: widget.orderId!,
                  ),
                );
              },
            );
          },
          text: 'Dispatch',
          icon: Icon(
            Icons.fire_truck,
            size: 15.0,
          ),
          options: FFButtonOptions(
            height: 40.0,
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: Color(0xFF0D6986),
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  color: Colors.white,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).titleSmallIsCustom,
                ),
            elevation: 0.0,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
