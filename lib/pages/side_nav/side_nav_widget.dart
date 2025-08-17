import '/components/side_nav_menus_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'side_nav_model.dart';
export 'side_nav_model.dart';

class SideNavWidget extends StatefulWidget {
  const SideNavWidget({
    super.key,
    required this.setActiveTab,
  });

  final String? setActiveTab;

  @override
  State<SideNavWidget> createState() => _SideNavWidgetState();
}

class _SideNavWidgetState extends State<SideNavWidget> {
  late SideNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Make this side nav a component. You can then set the colors of the icons to be selected base on an integer.
        Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
        child: Container(
          width: 104.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).alternate,
                offset: Offset(
                  1.0,
                  0.0,
                ),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/PNG_2_(1).png',
                            width: 40.7,
                            height: 32.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 8.0))
                      .addToStart(SizedBox(height: 8.0)),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                OrderPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: wrapWithModel(
                              model: _model.sideNavMenusModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: SideNavMenusWidget(
                                navName: 'Orders',
                                navIcon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color:
                                      'zionweb://zionweb.com${GoRouterState.of(context).uri.toString()}' ==
                                              'ordersPage'
                                          ? FFAppConstants.selectedNavText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                ),
                                navActive: 'OrdersPage',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                VoucherPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: wrapWithModel(
                              model: _model.sideNavMenusModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: SideNavMenusWidget(
                                navName: 'Vouchers',
                                navIcon: Icon(
                                  Icons.percent_outlined,
                                  color:
                                      'zionweb://zionweb.com${GoRouterState.of(context).uri.toString()}' ==
                                              'vouchersPage'
                                          ? FFAppConstants.selectedNavText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                ),
                                navActive: 'VouchersPage',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                EmployeesPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: wrapWithModel(
                              model: _model.sideNavMenusModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: SideNavMenusWidget(
                                navName: 'Employee',
                                navIcon: Icon(
                                  Icons.person,
                                  color:
                                      'zionweb://zionweb.com${GoRouterState.of(context).uri.toString()}' ==
                                              'employeePage'
                                          ? FFAppConstants.selectedNavText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                ),
                                navActive: 'employeesPage',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                ImsPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: wrapWithModel(
                              model: _model.sideNavMenusModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: SideNavMenusWidget(
                                navName: 'Inventory',
                                navIcon: Icon(
                                  Icons.inventory_2_outlined,
                                  color:
                                      'zionweb://zionweb.com${GoRouterState.of(context).uri.toString()}' ==
                                              'imsPage'
                                          ? FFAppConstants.selectedNavText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                ),
                                navActive: 'imsPage',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                WarehousePageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: wrapWithModel(
                              model: _model.sideNavMenusModel5,
                              updateCallback: () => safeSetState(() {}),
                              child: SideNavMenusWidget(
                                navName: 'Warehouse',
                                navIcon: Icon(
                                  Icons.warehouse_outlined,
                                  color:
                                      'zionweb://zionweb.com${GoRouterState.of(context).uri.toString()}' ==
                                              'warehousePage'
                                          ? FFAppConstants.selectedNavText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                  size: 24.0,
                                ),
                                navActive: 'warehousePage',
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  CalendarPageWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: wrapWithModel(
                                model: _model.sideNavMenusModel6,
                                updateCallback: () => safeSetState(() {}),
                                child: SideNavMenusWidget(
                                  navName: 'Dispatch Calendar',
                                  navIcon: Icon(
                                    Icons.calendar_today_outlined,
                                    color:
                                        'zionweb://zionweb.com${GoRouterState.of(context).uri.toString()}' ==
                                                'dispatchPage'
                                            ? FFAppConstants.selectedNavText
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                  ),
                                  navActive: 'calendarPage',
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Logout'),
                                content: Text('Logout'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                color: Color(0xFFFD7F6F),
                                size: 24.0,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Sign Out',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Color(0xFFFD7F6F),
                                        fontSize: 12.8,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
