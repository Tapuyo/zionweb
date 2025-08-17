import '/backend/supabase/supabase.dart';
import '/components/order_filter_component_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/order/order_modal/order_modal_widget.dart';
import '/order/order_summary/order_summary_widget.dart';
import '/pages/side_nav/side_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'order_page_model.dart';
export 'order_page_model.dart';

class OrderPageWidget extends StatefulWidget {
  const OrderPageWidget({
    super.key,
    int? rowCount,
  }) : this.rowCount = rowCount ?? 10;

  final int rowCount;

  static String routeName = 'OrderPage';
  static String routePath = '/orderPage';

  @override
  State<OrderPageWidget> createState() => _OrderPageWidgetState();
}

class _OrderPageWidgetState extends State<OrderPageWidget> {
  late OrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderPageModel());

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
    return FutureBuilder<List<OrderSummaryByMonthViewRow>>(
      future: OrderSummaryByMonthViewTable().queryRows(
        queryFn: (q) => q,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<OrderSummaryByMonthViewRow>
            orderPageOrderSummaryByMonthViewRowList = snapshot.data!;

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
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(),
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: wrapWithModel(
                                        model: _model.sideNavModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 32.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.67),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Salesman Dela Cruz',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFFB19341),
                                                        Color(0xFFECDDAD)
                                                      ],
                                                      stops: [0.6, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      end: AlignmentDirectional(
                                                          0, -1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  6.0,
                                                                  16.0,
                                                                  6.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      OrderModalWidget(
                                                                    onAddProduct:
                                                                        (products) async {},
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        text:
                                                            'Create New Order',
                                                        icon: Icon(
                                                          Icons.add,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      12.0,
                                                                      16.0,
                                                                      12.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0x004B39EF),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 12,
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 6,
                                                        child: Container(
                                                          height: 214.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x12504239),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                            _model.summaryChoiceValue =
                                                                                val?.firstOrNull);
                                                                        _model.summaryChoice =
                                                                            await OrderSummaryByRangeViewTable().queryRows(
                                                                          queryFn: (q) =>
                                                                              q.eqOrNull(
                                                                            'range_label',
                                                                            _model.summaryChoiceValue,
                                                                          ),
                                                                        );

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            Color(0x09504239),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Proxima Nova',
                                                                              color: FlutterFlowTheme.of(context).brown100,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              lineHeight: 1.2,
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            14.0,
                                                                        elevation:
                                                                            0.0,
                                                                        borderColor:
                                                                            Color(0x29504239),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Proxima Nova',
                                                                              color: Color(0xFF504239),
                                                                              letterSpacing: 0.0,
                                                                              lineHeight: 1.2,
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            14.0,
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      chipSpacing:
                                                                          0.0,
                                                                      rowSpacing:
                                                                          8.0,
                                                                      multiselect:
                                                                          false,
                                                                      initialized:
                                                                          _model.summaryChoiceValue !=
                                                                              null,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .summaryChoiceValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
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
                                                                    EdgeInsets
                                                                        .all(
                                                                            16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        minWidth:
                                                                            200.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .orderSummaryModel1,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            OrderSummaryWidget(
                                                                          title:
                                                                              'Total Revenue (PHP)',
                                                                          value:
                                                                              valueOrDefault<double>(
                                                                            _model.summaryChoice?.firstOrNull?.totalRevenue,
                                                                            0.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children:
                                                                              [
                                                                            wrapWithModel(
                                                                              model: _model.orderSummaryModel2,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: OrderSummaryWidget(
                                                                                title: 'Total Orders',
                                                                                value: valueOrDefault<double>(
                                                                                  _model.summaryChoice?.firstOrNull?.totalOrders?.toDouble(),
                                                                                  0.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            wrapWithModel(
                                                                              model: _model.orderSummaryModel3,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: OrderSummaryWidget(
                                                                                title: 'Total Shipping',
                                                                                value: valueOrDefault<double>(
                                                                                  _model.summaryChoice?.firstOrNull?.totalShippingFee,
                                                                                  0.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            wrapWithModel(
                                                                              model: _model.orderSummaryModel4,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: OrderSummaryWidget(
                                                                                title: 'Cancelled Orders',
                                                                                value: valueOrDefault<double>(
                                                                                  _model.summaryChoice?.firstOrNull?.totalCancelledOrders?.toDouble(),
                                                                                  0.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ].addToEnd(SizedBox(
                                                                height: 32.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 6,
                                                        child: Container(
                                                          height: 214.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x12504239),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      'Total Sales',
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
                                                                            _model.salesChoiceValue =
                                                                                val?.firstOrNull);
                                                                        _model.salesChoice =
                                                                            await OrderSalesDeliveredByRangeViewTable().queryRows(
                                                                          queryFn: (q) =>
                                                                              q.eqOrNull(
                                                                            'range_label',
                                                                            _model.salesChoiceValue,
                                                                          ),
                                                                        );

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            Color(0x09504239),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Proxima Nova',
                                                                              color: FlutterFlowTheme.of(context).brown100,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              lineHeight: 1.2,
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            14.0,
                                                                        elevation:
                                                                            0.0,
                                                                        borderColor:
                                                                            Color(0x29504239),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Proxima Nova',
                                                                              color: Color(0xFF504239),
                                                                              letterSpacing: 0.0,
                                                                              lineHeight: 1.2,
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            14.0,
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      chipSpacing:
                                                                          0.0,
                                                                      rowSpacing:
                                                                          8.0,
                                                                      multiselect:
                                                                          false,
                                                                      initialized:
                                                                          _model.salesChoiceValue !=
                                                                              null,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .salesChoiceValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
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
                                                                    EdgeInsets
                                                                        .all(
                                                                            16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .orderSummaryModel5,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            OrderSummaryWidget(
                                                                          title:
                                                                              'PHP Value',
                                                                          value:
                                                                              valueOrDefault<double>(
                                                                            _model.salesChoice?.firstOrNull?.totalSalesDelivered,
                                                                            0.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              370.0,
                                                                          height:
                                                                              100.0,
                                                                          child:
                                                                              FlutterFlowBarChart(
                                                                            barData: [
                                                                              FFBarChartData(
                                                                                yData: orderPageOrderSummaryByMonthViewRowList.map((e) => e.totalSales).withoutNulls.toList(),
                                                                                color: Color(0xFFB19341),
                                                                                borderWidth: 1.0,
                                                                                borderColor: Color(0x80504239),
                                                                              )
                                                                            ],
                                                                            xLabels:
                                                                                orderPageOrderSummaryByMonthViewRowList.map((e) => e.monthLabel).withoutNulls.toList(),
                                                                            barWidth:
                                                                                55.83,
                                                                            barBorderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(2.0),
                                                                              topRight: Radius.circular(2.0),
                                                                            ),
                                                                            groupSpace:
                                                                                1.0,
                                                                            alignment:
                                                                                BarChartAlignment.spaceAround,
                                                                            chartStylingInfo:
                                                                                ChartStylingInfo(
                                                                              backgroundColor: Color(0x00504239),
                                                                              showGrid: true,
                                                                              showBorder: false,
                                                                            ),
                                                                            axisBounds:
                                                                                AxisBounds(),
                                                                            xAxisLabelInfo:
                                                                                AxisLabelInfo(
                                                                              showLabels: true,
                                                                              labelInterval: 10.0,
                                                                              reservedSize: 20.0,
                                                                            ),
                                                                            yAxisLabelInfo:
                                                                                AxisLabelInfo(
                                                                              showLabels: true,
                                                                              labelInterval: 20000.0,
                                                                              labelFormatter: LabelFormatter(
                                                                                numberFormat: (val) => formatNumber(
                                                                                  val,
                                                                                  formatType: FormatType.compact,
                                                                                  currency: '\$',
                                                                                ),
                                                                              ),
                                                                              reservedSize: 50.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ].addToEnd(SizedBox(
                                                                height: 32.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
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
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0x14504239),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .orderFilterComponentModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  OrderFilterComponentWidget(),
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
      },
    );
  }
}
