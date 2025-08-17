import '/backend/supabase/supabase.dart';
import '/calendar/summary/summary_widget.dart';
import '/components/dispatch_filter_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/side_nav/side_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'calendar_page_model.dart';
export 'calendar_page_model.dart';

class CalendarPageWidget extends StatefulWidget {
  const CalendarPageWidget({super.key});

  static String routeName = 'CalendarPage';
  static String routePath = '/calendarPage';

  @override
  State<CalendarPageWidget> createState() => _CalendarPageWidgetState();
}

class _CalendarPageWidgetState extends State<CalendarPageWidget> {
  late CalendarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isArchived = false;
      safeSetState(() {});
      _model.productsInitList = await ProductsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'archived',
          _model.isArchived,
        ),
      );
      _model.productList =
          _model.productsInitList!.toList().cast<ProductsRow>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: wrapWithModel(
                                    model: _model.sideNavModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SideNavWidget(
                                      setActiveTab:
                                          'zionweb://zionweb.com${GoRouterState.of(context).uri.toString()}',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.67),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.67),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/839/600',
                                                      width: 32.0,
                                                      height: 32.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 16.0,
                                                  height: 0.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                Text(
                                                  'Salesman Dela Cruz',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x12504239),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        8.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Summary',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        lineHeight:
                                                                            1.2,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                FlutterFlowChoiceChips(
                                                                  options: [
                                                                    ChipData(
                                                                        'ALL'),
                                                                    ChipData(
                                                                        '1D'),
                                                                    ChipData(
                                                                        'WTD'),
                                                                    ChipData(
                                                                        'MTD'),
                                                                    ChipData(
                                                                        'YTD')
                                                                  ],
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.dateRangerValue =
                                                                            val?.firstOrNull);
                                                                    _model.orderStatusSummaryQuery =
                                                                        await OrderStatusSummaryByRangeViewTable()
                                                                            .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'range_label',
                                                                        _model
                                                                            .dateRangerValue,
                                                                      ),
                                                                    );
                                                                    _model.orderSummary = _model
                                                                        .orderStatusSummaryQuery!
                                                                        .toList()
                                                                        .cast<
                                                                            OrderStatusSummaryByRangeViewRow>();
                                                                    safeSetState(
                                                                        () {});

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x09504239),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Proxima Nova',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).brown100,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    iconSize:
                                                                        14.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderColor:
                                                                        Color(
                                                                            0x29504239),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Proxima Nova',
                                                                          color:
                                                                              Color(0xFF504239),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    iconSize:
                                                                        14.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      0.0,
                                                                  rowSpacing:
                                                                      8.0,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      _model.dateRangerValue !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .dateRangerValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    ['1D'],
                                                                  ),
                                                                  wrapped:
                                                                      false,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .summaryModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          SummaryWidget(
                                                                        status:
                                                                            'Ready-to-Dispatch',
                                                                        value: valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .orderSummary
                                                                              .where((e) => e.status == 'Ready-to-Dispatch')
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.totalAmount,
                                                                          0.0,
                                                                        ),
                                                                        orderCount:
                                                                            valueOrDefault<int>(
                                                                          _model
                                                                              .orderSummary
                                                                              .where((e) => e.status == 'Ready-to-Dispatch')
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.totalOrders,
                                                                          0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 100.0,
                                                                  child:
                                                                      VerticalDivider(
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 5,
                                                                  child:
                                                                      Container(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.summaryModel2,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                SummaryWidget(
                                                                              status: 'Dispatched',
                                                                              value: valueOrDefault<double>(
                                                                                _model.orderSummary.where((e) => e.status == 'Dispatched').toList().firstOrNull?.totalAmount,
                                                                                0.0,
                                                                              ),
                                                                              orderCount: valueOrDefault<int>(
                                                                                _model.orderSummary.where((e) => e.status == 'Dispatched').toList().firstOrNull?.totalOrders,
                                                                                0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.summaryModel3,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                SummaryWidget(
                                                                              status: 'In-Transit',
                                                                              value: valueOrDefault<double>(
                                                                                _model.orderSummary.where((e) => e.status == 'In-Transit').toList().firstOrNull?.totalAmount,
                                                                                0.0,
                                                                              ),
                                                                              orderCount: valueOrDefault<int>(
                                                                                _model.orderSummary.where((e) => e.status == 'In-Transit').toList().firstOrNull?.totalOrders,
                                                                                0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.summaryModel4,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                SummaryWidget(
                                                                              status: 'Delivered',
                                                                              value: valueOrDefault<double>(
                                                                                _model.orderSummary.where((e) => e.status == 'Delivered').toList().firstOrNull?.totalAmount,
                                                                                0.0,
                                                                              ),
                                                                              orderCount: valueOrDefault<int>(
                                                                                _model.orderSummary.where((e) => e.status == 'Delivered').toList().firstOrNull?.totalOrders,
                                                                                0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.summaryModel5,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                SummaryWidget(
                                                                              status: 'On-hold',
                                                                              value: valueOrDefault<double>(
                                                                                _model.orderSummary.where((e) => e.status == 'On-hold').toList().firstOrNull?.totalAmount,
                                                                                0.0,
                                                                              ),
                                                                              orderCount: valueOrDefault<int>(
                                                                                _model.orderSummary.where((e) => e.status == 'On-hold').toList().firstOrNull?.totalOrders,
                                                                                0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.summaryModel6,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                SummaryWidget(
                                                                              status: 'Cancelled',
                                                                              value: valueOrDefault<double>(
                                                                                _model.orderSummary.where((e) => e.status == 'Cancelled').toList().firstOrNull?.totalAmount,
                                                                                0.0,
                                                                              ),
                                                                              orderCount: valueOrDefault<int>(
                                                                                _model.orderSummary.where((e) => e.status == 'Cancelled').toList().firstOrNull?.totalOrders,
                                                                                0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                          ),
                                                        ].addToEnd(SizedBox(
                                                            height: 32.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .dispatchFilterComponentModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              DispatchFilterComponentWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
