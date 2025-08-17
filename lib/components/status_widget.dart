import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'status_model.dart';
export 'status_model.dart';

class StatusWidget extends StatefulWidget {
  const StatusWidget({
    super.key,
    String? status,
    bool? isHeader,
  })  : this.status = status ?? 'New',
        this.isHeader = isHeader ?? false;

  final String status;
  final bool isHeader;

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  late StatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusModel());

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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.status == FFAppConstants.AwaitingLogisticsConfirmation)
          Container(
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.fire_truck_outlined,
                    color: FlutterFlowTheme.of(context).green100,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: AutoSizeText(
                      widget.status.maybeHandleOverflow(
                        maxChars: 12,
                        replacement: '…',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).green100,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
        if (widget.status == FFAppConstants.ReadyToDispatch)
          Container(
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.fire_truck_outlined,
                    color: FlutterFlowTheme.of(context).green100,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      widget.status,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).green100,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
        if (widget.status == FFAppConstants.Dispatched)
          Container(
            height: 30.0,
            decoration: BoxDecoration(
              color: widget.isHeader ? Color(0x00000000) : Color(0x140D6986),
              borderRadius: BorderRadius.circular(99.0),
              border: Border.all(
                color: widget.isHeader ? Color(0x00000000) : Color(0x140D6986),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.fire_truck_outlined,
                    color: Color(0xFF0D6986),
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      widget.status,
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
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
        if (widget.status == FFAppConstants.NewOrder)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.energy_savings_leaf_outlined,
                    color: FlutterFlowTheme.of(context).green100,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      widget.status,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).green100,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
        if (widget.status == FFAppConstants.Delivered)
          Container(
            decoration: BoxDecoration(
              color: widget.isHeader
                  ? Color(0x00000000)
                  : FlutterFlowTheme.of(context).green8,
              borderRadius: BorderRadius.circular(99.0),
              border: Border.all(
                color: widget.isHeader
                    ? Color(0x00000000)
                    : FlutterFlowTheme.of(context).green100,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check,
                    color: FlutterFlowTheme.of(context).green100,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      widget.status,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).green100,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
        if (widget.status == FFAppConstants.OnHold)
          Container(
            decoration: BoxDecoration(
              color: widget.isHeader
                  ? Color(0x00000000)
                  : FlutterFlowTheme.of(context).red8,
              borderRadius: BorderRadius.circular(99.0),
              border: Border.all(
                color: widget.isHeader
                    ? Color(0x00000000)
                    : FlutterFlowTheme.of(context).red100,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.back_hand,
                    color: FlutterFlowTheme.of(context).red100,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      widget.status,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).red100,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
        if (widget.status == FFAppConstants.Cancelled)
          Container(
            decoration: BoxDecoration(
              color: widget.isHeader
                  ? Color(0x00000000)
                  : FlutterFlowTheme.of(context).red8,
              borderRadius: BorderRadius.circular(99.0),
              border: Border.all(
                color: widget.isHeader
                    ? Color(0x00000000)
                    : FlutterFlowTheme.of(context).red100,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).red100,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      widget.status,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).red100,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
        if (widget.status == FFAppConstants.InTransit)
          Container(
            decoration: BoxDecoration(
              color: widget.isHeader ? Color(0x00000000) : Color(0x15C28434),
              borderRadius: BorderRadius.circular(99.0),
              border: Border.all(
                color: widget.isHeader ? Color(0x00000000) : Color(0xFFC28434),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.fire_truck_outlined,
                    color: Color(0xFFC28434),
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      widget.status,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFFC28434),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
        if (widget.status == FFAppConstants.Drafts)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.edit_document,
                    color: FlutterFlowTheme.of(context).black100,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      widget.status,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).black100,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 2.0))
                    .addToStart(SizedBox(width: 2.0))
                    .addToEnd(SizedBox(width: 2.0)),
              ),
            ),
          ),
      ],
    );
  }
}
