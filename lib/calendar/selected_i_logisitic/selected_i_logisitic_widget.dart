import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'selected_i_logisitic_model.dart';
export 'selected_i_logisitic_model.dart';

class SelectedILogisiticWidget extends StatefulWidget {
  const SelectedILogisiticWidget({
    super.key,
    this.parameter1,
    bool? parameter2,
  }) : this.parameter2 = parameter2 ?? false;

  final int? parameter1;
  final bool parameter2;

  @override
  State<SelectedILogisiticWidget> createState() =>
      _SelectedILogisiticWidgetState();
}

class _SelectedILogisiticWidgetState extends State<SelectedILogisiticWidget> {
  late SelectedILogisiticModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedILogisiticModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Color(0x16151006),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://picsum.photos/seed/339/600',
                width: 40.0,
                height: 40.0,
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
                    'Christian Santos',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          lineHeight: 1.2,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  Text(
                    'Hello World',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0x15AA3C2D),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.minus,
                  color: Color(0xFFAA3C2D),
                  size: 15.0,
                ),
              ),
            ),
          ]
              .divide(SizedBox(width: 8.0))
              .addToStart(SizedBox(width: 8.0))
              .addToEnd(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
