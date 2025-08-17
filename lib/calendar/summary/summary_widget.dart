import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'summary_model.dart';
export 'summary_model.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({
    super.key,
    required this.status,
    required this.value,
    required this.orderCount,
  });

  final String? status;
  final double? value;
  final int? orderCount;

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  late SummaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummaryModel());

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
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget.status,
                'status',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).black50,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'PHP',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).black100,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        lineHeight: 1.2,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    formatNumber(
                      widget.value,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.periodDecimal,
                    ),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 25.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        lineHeight: 1.2,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ].divide(SizedBox(width: 4.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'From',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 12.8,
                        letterSpacing: 0.0,
                        lineHeight: 1.2,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    '${widget.orderCount?.toString()} Orders',
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 12.8,
                        letterSpacing: 0.0,
                        lineHeight: 1.2,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ].divide(SizedBox(width: 4.0)),
            ),
          ].divide(SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
