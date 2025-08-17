import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'side_nav_menus_model.dart';
export 'side_nav_menus_model.dart';

class SideNavMenusWidget extends StatefulWidget {
  const SideNavMenusWidget({
    super.key,
    String? navName,
    required this.navIcon,
    String? navActive,
  })  : this.navName = navName ?? 'menu',
        this.navActive = navActive ?? 'OrdersPage';

  final String navName;
  final Widget? navIcon;
  final String navActive;

  @override
  State<SideNavMenusWidget> createState() => _SideNavMenusWidgetState();
}

class _SideNavMenusWidgetState extends State<SideNavMenusWidget> {
  late SideNavMenusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavMenusModel());

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getCurrentRoute(context) == '/${widget.navActive}'
                ? Color(0xFFB19341)
                : Color(0x00000000),
            getCurrentRoute(context) == '/${widget.navActive}'
                ? Color(0xFFECDDAD)
                : Color(0x00000000)
          ],
          stops: [0.8, 1.0],
          begin: AlignmentDirectional(0.0, 1.0),
          end: AlignmentDirectional(0, -1.0),
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
              child: widget.navIcon!,
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                widget.navName,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                      color: getCurrentRoute(context) == '/${widget.navActive}'
                          ? FlutterFlowTheme.of(context).white100
                          : FlutterFlowTheme.of(context).black100,
                      fontSize: 12.8,
                      letterSpacing: 0.0,
                      lineHeight: 1.2,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).labelSmallIsCustom,
                    ),
              ),
            ),
          ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
