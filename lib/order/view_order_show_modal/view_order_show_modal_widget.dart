import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/calendar/modal_main_details700_component/modal_main_details700_component_widget.dart';
import '/calendar/modal_main_details_component/modal_main_details_component_widget.dart';
import '/components/status_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/order/new_order_cancelled_modal/new_order_cancelled_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'view_order_show_modal_model.dart';
export 'view_order_show_modal_model.dart';

class ViewOrderShowModalWidget extends StatefulWidget {
  const ViewOrderShowModalWidget({
    super.key,
    int? id,
  }) : this.id = id ?? 0;

  final int id;

  @override
  State<ViewOrderShowModalWidget> createState() =>
      _ViewOrderShowModalWidgetState();
}

class _ViewOrderShowModalWidgetState extends State<ViewOrderShowModalWidget> {
  late ViewOrderShowModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewOrderShowModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Get Order
      _model.orderQuery = await OrdersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.id,
        ),
      );
      _model.order = _model.orderQuery?.firstOrNull;
      safeSetState(() {});
      _model.customerQuery = await CustomerTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          _model.orderQuery?.firstOrNull?.id,
        ),
      );
      _model.customer = _model.customerQuery?.firstOrNull;
      safeSetState(() {});
      _model.apiResultkkj = await GetOrderSubtotalCall.call(
        orderId: widget.id,
      );

      if ((_model.apiResultkkj?.succeeded ?? true)) {
        _model.subtotal = valueOrDefault<double>(
          GetOrderSubtotalCall.subtotal(
            (_model.apiResultkkj?.jsonBody ?? ''),
          )?.toDouble(),
          0.0,
        );
        safeSetState(() {});
      } else {
        _model.subtotal = 0.0;
        safeSetState(() {});
      }

      _model.total =
          (_model.subtotal!) + (_model.orderQuery!.firstOrNull!.shippingFee!);
      safeSetState(() {});
    });

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
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: 450.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              child: wrapWithModel(
                                model: _model.statusModel,
                                updateCallback: () => safeSetState(() {}),
                                child: StatusWidget(
                                  status:
                                      _model.orderQuery?.firstOrNull?.status,
                                  isHeader: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close_rounded,
                              color: Color(0xFF57636C),
                              size: 32.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFB19341),
                                FlutterFlowTheme.of(context).primary
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/917/600',
                                          width: 32.0,
                                          height: 32.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sales made by',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white100,
                                                  fontSize: 12.8,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'Christian Santos',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .white100,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          _model.order?.code,
                                          'Zion13',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white100,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Icon(
                                        Icons.content_copy,
                                        color: FlutterFlowTheme.of(context)
                                            .white100,
                                        size: 24.0,
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    constraints: BoxConstraints(
                      minWidth: 10.0,
                      minHeight: 10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: wrapWithModel(
                                  model:
                                      _model.modalDetailsTitleComponentModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ModalDetailsTitleComponentWidget(
                                    title: 'Client\'s Information',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Full Name',
                                  value: valueOrDefault<String>(
                                    '${_model.customer?.firstName} ${_model.customer?.lastName}',
                                    '-',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Contact Number',
                                  value: valueOrDefault<String>(
                                    _model.customer?.contact,
                                    '-',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Email',
                                  value: valueOrDefault<String>(
                                    _model.customer?.email,
                                    '-',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Company Name',
                                  value: valueOrDefault<String>(
                                    _model.customer?.company,
                                    '-',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Birth Date',
                                  value: valueOrDefault<String>(
                                    _model.customer?.birthdate?.toString(),
                                    '-',
                                  ),
                                ),
                              ),
                              if (false)
                                wrapWithModel(
                                  model: _model.modalDetailsComponentModel6,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ModalDetailsComponentWidget(
                                    label: 'Country',
                                    value: '-',
                                  ),
                                ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel7,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Zip Code',
                                  value: valueOrDefault<String>(
                                    _model.customer?.zipCode?.toString(),
                                    '-',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel8,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Address',
                                  value: valueOrDefault<String>(
                                    _model.customer?.address,
                                    '-',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel9,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Payment Method',
                                  value: valueOrDefault<String>(
                                    _model.order?.paymentId?.toString(),
                                    '-',
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    constraints: BoxConstraints(
                      minWidth: 10.0,
                      minHeight: 10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: wrapWithModel(
                                  model:
                                      _model.modalDetailsTitleComponentModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ModalDetailsTitleComponentWidget(
                                    title: 'Order Breakdown',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          FutureBuilder<List<OrderPageViewRow>>(
                            future: OrderPageViewTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'order_id',
                                widget.id,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<OrderPageViewRow>
                                  columnOrderPageViewRowList = snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnOrderPageViewRowList.length,
                                    (columnIndex) {
                                  final columnOrderPageViewRow =
                                      columnOrderPageViewRowList[columnIndex];
                                  return ModalMainDetailsComponentWidget(
                                    key: Key(
                                        'Keyjc0_${columnIndex}_of_${columnOrderPageViewRowList.length}'),
                                    label:
                                        '${columnOrderPageViewRow.productName} [${columnOrderPageViewRow.quantity?.toString()}]',
                                    value: valueOrDefault<String>(
                                      formatNumber(
                                        (columnOrderPageViewRow.price!) *
                                            (columnOrderPageViewRow.quantity!),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: 'PHP ',
                                      ),
                                      '0',
                                    ),
                                  );
                                }).divide(SizedBox(height: 8.0)),
                              );
                            },
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          wrapWithModel(
                            model: _model.modalMainDetails700ComponentModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: ModalMainDetails700ComponentWidget(
                              label: 'Subtotal',
                              value: valueOrDefault<String>(
                                formatNumber(
                                  _model.subtotal,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                  currency: 'PHP ',
                                ),
                                '0',
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    constraints: BoxConstraints(
                      minWidth: 10.0,
                      minHeight: 10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: wrapWithModel(
                                  model:
                                      _model.modalDetailsTitleComponentModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ModalDetailsTitleComponentWidget(
                                    title: 'Payment Breakdown',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel10,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Subtotal',
                                  value: valueOrDefault<String>(
                                    formatNumber(
                                      _model.subtotal,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                      currency: 'PHP ',
                                    ),
                                    '0',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel11,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Shipping Fee',
                                  value: valueOrDefault<String>(
                                    formatNumber(
                                      _model
                                          .orderQuery?.firstOrNull?.shippingFee,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                      currency: 'PHP ',
                                    ),
                                    '0',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel12,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Item Discounts',
                                  value: '- PHP 0',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel13,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Order Voucher',
                                  value: '- PHP 0',
                                ),
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              wrapWithModel(
                                model:
                                    _model.modalMainDetails700ComponentModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalMainDetails700ComponentWidget(
                                  label: 'Total',
                                  value: valueOrDefault<String>(
                                    formatNumber(
                                      _model.total,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                      currency: 'PHP ',
                                    ),
                                    '0',
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
                if (_model.orderQuery?.firstOrNull?.status != 'Cancelled')
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!_model.isCancel)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Download Invoice',
                                      icon: Icon(
                                        Icons.download_sharp,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconAlignment: IconAlignment.end,
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.isCancel = true;
                                        safeSetState(() {});
                                      },
                                      text: 'Mark as Cancelled',
                                      icon: Icon(
                                        Icons.info_outlined,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).red4,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .red100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Update',
                                      icon: FaIcon(
                                        FontAwesomeIcons.edit,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x0B151006),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              lineHeight: 1.2,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      if (_model.isCancel)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 12,
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownRemarksValueController ??=
                                          FormFieldController<String>(null),
                                      options: [
                                        'Emergency',
                                        'Cancel order by Customer',
                                        'Product Damaged',
                                        'Product Dispute / Wrong Package',
                                        'Others'
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.dropDownRemarksValue = val),
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      hintText: 'Remarks',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).choco100,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.isCancel = false;
                                        safeSetState(() {});
                                      },
                                      text: 'Disregard',
                                      icon: Icon(
                                        Icons.close,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).black4,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          await OrdersTable().update(
                                            data: {
                                              'status': Statuses.Cancelled.name,
                                              'remarks':
                                                  _model.dropDownRemarksValue,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              widget.id,
                                            ),
                                          );
                                          // Create Order History
                                          await OrderHistoryTable().insert({
                                            'order_id': _model
                                                .orderQuery?.firstOrNull?.id,
                                            'status': Statuses.Cancelled.name,
                                            'remarks':
                                                _model.dropDownRemarksValue,
                                          });
                                          Navigator.pop(context);
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child:
                                                    NewOrderCancelledModalWidget(
                                                  orderCode: _model.orderQuery!
                                                      .firstOrNull!.code!,
                                                  status:
                                                      Statuses.Cancelled.name,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Proceed',
                                        icon: Icon(
                                          Icons.arrow_forward_sharp,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .red100,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white100,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                lineHeight: 1.2,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
