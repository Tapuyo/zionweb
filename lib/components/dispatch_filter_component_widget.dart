import '/backend/supabase/supabase.dart';
import '/components/action_buttons_widget.dart';
import '/components/status_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/order/empty_filter_message/empty_filter_message_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'dispatch_filter_component_model.dart';
export 'dispatch_filter_component_model.dart';

class DispatchFilterComponentWidget extends StatefulWidget {
  const DispatchFilterComponentWidget({super.key});

  @override
  State<DispatchFilterComponentWidget> createState() =>
      _DispatchFilterComponentWidgetState();
}

class _DispatchFilterComponentWidgetState
    extends State<DispatchFilterComponentWidget> with TickerProviderStateMixin {
  late DispatchFilterComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DispatchFilterComponentModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        Expanded(
          flex: 12,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              constraints: BoxConstraints(
                minHeight: 100.0,
                maxHeight: 400.0,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment(-1.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: false,
                          isScrollable: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.2,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                          unselectedLabelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                lineHeight: 1.2,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                          labelColor: FlutterFlowTheme.of(context).brown100,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).brown100,
                          backgroundColor: FlutterFlowTheme.of(context).brown4,
                          borderColor: FlutterFlowTheme.of(context).brown16,
                          borderWidth: 1.0,
                          borderRadius: 8.0,
                          elevation: 0.0,
                          labelPadding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          tabs: [
                            Tab(
                              text: 'All Orders',
                            ),
                            Tab(
                              text: 'My Dispatched',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).black8,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData('All'),
                                                ChipData(FFAppConstants
                                                    .ReadyToDispatch),
                                                ChipData(
                                                    FFAppConstants.Dispatched),
                                                ChipData(
                                                    FFAppConstants.InTransit),
                                                ChipData(
                                                    FFAppConstants.Delivered),
                                                ChipData(FFAppConstants.OnHold),
                                                ChipData(
                                                    FFAppConstants.Cancelled)
                                              ],
                                              onChanged: (val) async {
                                                safeSetState(() =>
                                                    _model.statusesValue =
                                                        val?.firstOrNull);
                                                _model.filteredOrderListFrStatus =
                                                    await _model
                                                        .filterList(context);
                                                if (!(_model.filteredOrderListFrStatus !=
                                                        null &&
                                                    (_model.filteredOrderListFrStatus)!
                                                        .isNotEmpty)) {
                                                  _model.emptyMessage =
                                                      'No orders found for the selected status.';
                                                  safeSetState(() {});
                                                }
                                                _model
                                                    .paginatedDataTableController
                                                    .paginatorController
                                                    .goToPageWithRow(0);

                                                safeSetState(() {});
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFFB19341),
                                                textStyle: FlutterFlowTheme.of(
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
                                                              .info,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(
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
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              chipSpacing: 8.0,
                                              rowSpacing: 8.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.statusesValue != null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .statusesValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                ['All'],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 294.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    _model.filterOrderListFrSearch =
                                                        await _model.filterList(
                                                            context);
                                                    _model
                                                        .paginatedDataTableController
                                                        .paginatorController
                                                        .goToPageWithRow(0);

                                                    safeSetState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumIsCustom,
                                                          ),
                                                  hintText:
                                                      'Search for Order ID, Customer',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumIsCustom,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .brown16,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  prefixIcon: Icon(
                                                    Icons.search_sharp,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final orderDt =
                                                  _model.ordersList.toList();
                                              if (orderDt.isEmpty) {
                                                return EmptyFilterMessageWidget(
                                                  message: _model.emptyMessage,
                                                );
                                              }

                                              return FlutterFlowDataTable<
                                                  OrderPageViewRow>(
                                                controller: _model
                                                    .paginatedDataTableController,
                                                data: orderDt,
                                                columnsBuilder:
                                                    (onSortChanged) => [
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Order ID',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Proxima Nova',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brown100,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    onSort: onSortChanged,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Product Unit',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Proxima Nova',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brown100,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    onSort: onSortChanged,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Customer',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Proxima Nova',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brown100,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Scheduler',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .brown100,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Logistics',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLargeIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Status',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLargeIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Payment Details',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLargeIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Actions',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLargeIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                    fixedWidth: 120.0,
                                                  ),
                                                ],
                                                dataRowBuilder: (orderDtItem,
                                                        orderDtIndex,
                                                        selected,
                                                        onSelectChanged) =>
                                                    DataRow(
                                                  color:
                                                      WidgetStateProperty.all(
                                                    orderDtIndex % 2 == 0
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : Color(0x00F1F4F8),
                                                  ),
                                                  cells: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        orderDtItem.code,
                                                        'id',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              orderDtItem
                                                                  .productImage,
                                                              'https://isxrwikfznijgmlgvtws.supabase.co/storage/v1/object/public/zion/Products/1744276339434000.png',
                                                            ),
                                                            width: 64.0,
                                                            height: 64.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            orderDtItem
                                                                .productName,
                                                            'name',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${orderDtItem.firstName} ${orderDtItem.lastName}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              orderDtItem
                                                                  .address,
                                                              'test',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              orderDtItem
                                                                  .contact,
                                                              '123',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      '-',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Text(
                                                      '-',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    StatusWidget(
                                                      key: Key(
                                                          'Keyxds_${orderDtIndex}_of_${orderDt.length}'),
                                                      status: valueOrDefault<
                                                          String>(
                                                        orderDtItem.status,
                                                        'Status',
                                                      ),
                                                      isHeader: false,
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              orderDtItem.price,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .periodDecimal,
                                                              currency: 'PHP ',
                                                            ),
                                                            'PHP 10000',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            orderDtItem
                                                                .paymentMethod,
                                                            'method',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .actionButtonsModels
                                                          .getModel(
                                                        orderDtItem.orderId!
                                                            .toString(),
                                                        orderDtIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ActionButtonsWidget(
                                                        key: Key(
                                                          'Keyzsw_${orderDtItem.orderId!.toString()}',
                                                        ),
                                                        status:
                                                            orderDtItem.status!,
                                                        orderId: orderDtItem
                                                            .orderId!,
                                                      ),
                                                    ),
                                                  ]
                                                      .map((c) => DataCell(c))
                                                      .toList(),
                                                ),
                                                emptyBuilder: () =>
                                                    EmptyFilterMessageWidget(
                                                  message: _model.emptyMessage,
                                                ),
                                                onSortChanged: (columnIndex,
                                                    ascending) async {},
                                                paginated: true,
                                                selectable: false,
                                                hidePaginator: false,
                                                showFirstLastButtons: false,
                                                headingRowHeight: 40.0,
                                                dataRowHeight: 80.0,
                                                columnSpacing: 10.0,
                                                headingRowColor:
                                                    FlutterFlowTheme.of(context)
                                                        .brown4,
                                                sortIconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                addHorizontalDivider: true,
                                                addTopAndBottomDivider: true,
                                                hideDefaultHorizontalDivider:
                                                    true,
                                                horizontalDividerColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                horizontalDividerThickness: 1.0,
                                                addVerticalDivider: false,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData('ALL'),
                        ChipData('1D'),
                        ChipData('WTD'),
                        ChipData('MTD'),
                        ChipData('YTD')
                      ],
                      onChanged: (val) async {
                        safeSetState(
                            () => _model.dateRangerValue = val?.firstOrNull);
                        _model.filteredOrderListFrDateRange =
                            await _model.filterList(context);
                        if (!(_model.filteredOrderListFrDateRange != null &&
                            (_model.filteredOrderListFrDateRange)!
                                .isNotEmpty)) {
                          _model.emptyMessage =
                              'No orders found for the selected time period.';
                          safeSetState(() {});
                        }
                        _model.paginatedDataTableController.paginatorController
                            .goToPageWithRow(0);

                        safeSetState(() {});
                      },
                      selectedChipStyle: ChipStyle(
                        backgroundColor: Color(0x09504239),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Proxima Nova',
                                  color: FlutterFlowTheme.of(context).brown100,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.2,
                                ),
                        iconColor: Color(0x00000000),
                        iconSize: 14.0,
                        elevation: 0.0,
                        borderColor: Color(0x29504239),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Proxima Nova',
                                  color: Color(0xFF504239),
                                  letterSpacing: 0.0,
                                  lineHeight: 1.2,
                                ),
                        iconColor: Color(0x00000000),
                        iconSize: 14.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 0.0,
                      rowSpacing: 8.0,
                      multiselect: false,
                      initialized: _model.dateRangerValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.dateRangerValueController ??=
                          FormFieldController<List<String>>(
                        ['1D'],
                      ),
                      wrapped: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ].addToEnd(SizedBox(height: 32.0)),
    );
  }
}
