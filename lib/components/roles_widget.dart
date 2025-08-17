import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'roles_model.dart';
export 'roles_model.dart';

class RolesWidget extends StatefulWidget {
  const RolesWidget({
    super.key,
    this.role,
    bool? isArchived,
  }) : this.isArchived = isArchived ?? false;

  final String? role;
  final bool isArchived;

  @override
  State<RolesWidget> createState() => _RolesWidgetState();
}

class _RolesWidgetState extends State<RolesWidget> {
  late RolesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RolesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (!widget.isArchived)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (false)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.person,
                      color: Color(0xFFB19341),
                      size: 24.0,
                    ),
                    Text(
                      widget.role!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFFB19341),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              if (false)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.person,
                      color: Color(0xFF0D6986),
                      size: 24.0,
                    ),
                    Text(
                      widget.role!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFF0D6986),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xFF0D6986),
                    size: 24.0,
                  ),
                  Text(
                    widget.role!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: Color(0xFF0D6986),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ].divide(SizedBox(width: 4.0)),
              ),
            ],
          ),
        if (widget.isArchived)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.u_turn_right_sharp,
                    color: FlutterFlowTheme.of(context).black50,
                    size: 24.0,
                  ),
                  Text(
                    'Archived',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).black50,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
