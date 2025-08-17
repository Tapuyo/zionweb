import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_item_logisitic_model.dart';
export 'list_item_logisitic_model.dart';

class ListItemLogisiticWidget extends StatefulWidget {
  const ListItemLogisiticWidget({
    super.key,
    required this.logisticsDetail,
    required this.onSelectLogistics,
  });

  final UsersLogisticsViewRow? logisticsDetail;
  final Future Function(UsersLogisticsViewRow logisticsDetail)?
      onSelectLogistics;

  @override
  State<ListItemLogisiticWidget> createState() =>
      _ListItemLogisiticWidgetState();
}

class _ListItemLogisiticWidgetState extends State<ListItemLogisiticWidget> {
  late ListItemLogisiticModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListItemLogisiticModel());

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
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.onSelectLogistics?.call(
                widget.logisticsDetail!,
              );
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: _model.isHovered ? Color(0x0B151006) : Color(0x00000000),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget.logisticsDetail?.image,
                          'https://isxrwikfznijgmlgvtws.supabase.co/storage/v1/object/public/zion/Products/Screenshot%202025-04-09%20at%208.23.52%20PM.png',
                        ),
                        width: 32.0,
                        height: 32.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 11,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.logisticsDetail?.firstName} ${widget.logisticsDetail?.lastName}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.2,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.logisticsDetail?.phoneNumber,
                              '09089991231',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ]
                      .divide(SizedBox(width: 8.0))
                      .addToStart(SizedBox(width: 8.0))
                      .addToEnd(SizedBox(width: 8.0)),
                ),
              ),
            ),
          ),
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
          _model.isHovered = true;
          safeSetState(() {});
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
          _model.isHovered = false;
          safeSetState(() {});
        }),
      ),
    );
  }
}
