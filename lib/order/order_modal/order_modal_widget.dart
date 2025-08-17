import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/calendar/modal_main_details700_component/modal_main_details700_component_widget.dart';
import '/calendar/modal_main_details_component/modal_main_details_component_widget.dart';
import '/components/order_breakdown_component_widget.dart';
import '/components/status_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/order/list_view_payment_method_component/list_view_payment_method_component_widget.dart';
import '/order/list_view_product_component/list_view_product_component_widget.dart';
import '/order/new_order_draft_modal/new_order_draft_modal_widget.dart';
import '/order/new_order_updated_modal/new_order_updated_modal_widget.dart';
import '/order/wizard/wizard_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'order_modal_model.dart';
export 'order_modal_model.dart';

class OrderModalWidget extends StatefulWidget {
  const OrderModalWidget({
    super.key,
    this.onAddProduct,
    bool? isUpdate,
    this.orderid,
  }) : this.isUpdate = isUpdate ?? false;

  final Future Function(ProductsRow products)? onAddProduct;
  final bool isUpdate;
  final int? orderid;

  @override
  State<OrderModalWidget> createState() => _OrderModalWidgetState();
}

class _OrderModalWidgetState extends State<OrderModalWidget> {
  late OrderModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isUpdate == false) {
        _model.getLatestId = await LatestOrderCodeViewTable().queryRows(
          queryFn: (q) => q,
        );
        if (_model.getLatestId != null && (_model.getLatestId)!.isNotEmpty) {
          _model.latestId = (_model.getLatestId!.firstOrNull!.id!) + 1;
          safeSetState(() {});
        } else {
          _model.latestId = 1;
          safeSetState(() {});
        }

        _model.orderCode =
            'ZION${functions.padNumberWithZeroes(_model.latestId, 10)}';
        safeSetState(() {});
        await OrderCodeSeriesTable().insert({
          'code': _model.orderCode,
        });
      } else {
        _model.resRowUpdateOrder = await OrdersTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.orderid,
          ),
        );
        _model.customerUpdateRes = await CustomerTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            _model.resRowUpdateOrder?.firstOrNull?.customerId,
          ),
        );
        _model.userId = _model.customerUpdateRes?.firstOrNull?.id;
        safeSetState(() {});
        if (_model.customerUpdateRes != null &&
            (_model.customerUpdateRes)!.isNotEmpty) {
          _model.orderProdResult = await OrderProductsTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'order_id',
              widget.orderid,
            ),
          );
          for (int loop1Index = 0;
              loop1Index <
                  _model.orderProdResult!.map((e) => e).toList().length;
              loop1Index++) {
            final currentLoop1Item =
                _model.orderProdResult!.map((e) => e).toList()[loop1Index];
            _model.prodDetails = await ProductsTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'id',
                currentLoop1Item.productId,
              ),
            );
            _model.addToOrderProduct(OrderProductsStruct(
              id: widget.orderid,
              code: currentLoop1Item.productId?.toString(),
              name: _model.prodDetails?.firstOrNull?.name,
              price: _model.prodDetails?.firstOrNull?.price,
              quantity: 1,
            ));
            safeSetState(() {});
          }
          safeSetState(() {
            _model.firstNameTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.firstName!;
          });
          safeSetState(() {
            _model.lastNameTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.lastName!;
          });
          safeSetState(() {
            _model.contactTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.contact!;
          });
          safeSetState(() {
            _model.emailTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.email!;
          });
          safeSetState(() {
            _model.companyTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.company!;
          });
          safeSetState(() {
            _model.zipCodeTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.zipCode!.toString();
          });
          safeSetState(() {
            _model.landmarkTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.landmark!;
          });
          safeSetState(() {
            _model.birthdateTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.birthdate!.toString();
          });
          safeSetState(() {
            _model.userAddressTextController?.text =
                _model.customerUpdateRes!.firstOrNull!.address!;
          });
          safeSetState(() {
            _model.deliveryAddressTextController?.text =
                _model.resRowUpdateOrder!.firstOrNull!.deliveryAddress!;
          });
          safeSetState(() {
            _model.paymentMethodTextController?.text =
                _model.resRowUpdateOrder!.firstOrNull!.paymentId!.toString();
          });
          _model.computePrice = 0;
          safeSetState(() {});
          await Future.delayed(
            Duration(
              milliseconds: 3000,
            ),
          );
          for (int loop2Index = 0;
              loop2Index < _model.orderProduct.length;
              loop2Index++) {
            final currentLoop2Item = _model.orderProduct[loop2Index];
            _model.computePrice =
                currentLoop2Item.price * currentLoop2Item.quantity;
            safeSetState(() {});
            _model.subtotal = _model.subtotal! + _model.computePrice;
            safeSetState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _model.subtotal!.toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
          safeSetState(() {
            _model.shippingFeeTextController?.text =
                _model.resRowUpdateOrder!.firstOrNull!.shippingFee!.toString();
          });
          _model.orderCode = _model.resRowUpdateOrder!.firstOrNull!.code!;
          _model.paymentXdeal = _model.resRowUpdateOrder!.firstOrNull!.xDeal!;
          safeSetState(() {});
        }
      }
    });

    _model.firstNameTextController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();

    _model.contactTextController ??= TextEditingController();
    _model.contactFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.companyTextController ??= TextEditingController();
    _model.companyFocusNode ??= FocusNode();

    _model.birthdateTextController ??=
        TextEditingController(text: dateTimeFormat("yMMMd", _model.birthdate));
    _model.birthdateFocusNode ??= FocusNode();

    _model.userAddressTextController ??= TextEditingController();
    _model.userAddressFocusNode ??= FocusNode();

    _model.landmarkTextController ??= TextEditingController();
    _model.landmarkFocusNode ??= FocusNode();

    _model.zipCodeTextController ??= TextEditingController();
    _model.zipCodeFocusNode ??= FocusNode();

    _model.productsTextController ??= TextEditingController();
    _model.productsFocusNode ??= FocusNode();

    _model.voucherCodeTextController ??= TextEditingController();
    _model.voucherCodeFocusNode ??= FocusNode();

    _model.deliveryAddressTextController ??= TextEditingController();
    _model.deliveryAddressFocusNode ??= FocusNode();

    _model.contactNumberTextController ??= TextEditingController();
    _model.contactNumberFocusNode ??= FocusNode();

    _model.paymentMethodTextController ??= TextEditingController();
    _model.paymentMethodFocusNode ??= FocusNode();

    _model.paymentTermsTextController ??= TextEditingController();
    _model.paymentTermsFocusNode ??= FocusNode();

    _model.referenceNumberTextController ??= TextEditingController();
    _model.referenceNumberFocusNode ??= FocusNode();

    _model.shippingFeeTextController ??= TextEditingController();
    _model.shippingFeeFocusNode ??= FocusNode();

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
                            if (!widget.isUpdate)
                              Text(
                                'New Order...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.2,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            if (widget.isUpdate)
                              Container(
                                child: wrapWithModel(
                                  model: _model.statusModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: StatusWidget(
                                    status: 'Updating Order...',
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
                                          _model.orderCode,
                                          'ZION234',
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
                wrapWithModel(
                  model: _model.wizardModel,
                  updateCallback: () => safeSetState(() {}),
                  child: WizardWidget(
                    index: _model.pageIndex,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 500.0,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Form(
                              key: _model.formKey2,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      constraints: BoxConstraints(
                                        minWidth: 10.0,
                                        minHeight: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'First Name',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .firstNameTextController,
                                                          focusNode: _model
                                                              .firstNameFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black8,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .firstNameTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Last Name',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .lastNameTextController,
                                                          focusNode: _model
                                                              .lastNameFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black8,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .lastNameTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Contact Number',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .contactTextController,
                                                          focusNode: _model
                                                              .contactFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black8,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .contactTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Email (Optional)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .emailTextController,
                                                          focusNode: _model
                                                              .emailFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black8,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .emailTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Company Name (Optional)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .companyTextController,
                                                          focusNode: _model
                                                              .companyFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black8,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .companyTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Birth Date (Optional)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            TextFormField(
                                                              controller: _model
                                                                  .birthdateTextController,
                                                              focusNode: _model
                                                                  .birthdateFocusNode,
                                                              autofocus: false,
                                                              readOnly: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                                hintText:
                                                                    'TextField',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black8,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              validator: _model
                                                                  .birthdateTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                final _datePickedDate =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      getCurrentTimestamp,
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      getCurrentTimestamp,
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (_datePickedDate !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked =
                                                                        DateTime(
                                                                      _datePickedDate
                                                                          .year,
                                                                      _datePickedDate
                                                                          .month,
                                                                      _datePickedDate
                                                                          .day,
                                                                    );
                                                                  });
                                                                } else if (_model
                                                                        .datePicked !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked =
                                                                        getCurrentTimestamp;
                                                                  });
                                                                }
                                                                safeSetState(
                                                                    () {
                                                                  _model.birthdateTextController
                                                                          ?.text =
                                                                      dateTimeFormat(
                                                                          "yMMMd",
                                                                          _model
                                                                              .datePicked);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Address',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .userAddressTextController,
                                                          focusNode: _model
                                                              .userAddressFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintText:
                                                                'TextField',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black8,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          maxLines: 2,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .userAddressTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Landmark (Optional)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .landmarkTextController,
                                                          focusNode: _model
                                                              .landmarkFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintText:
                                                                'TextField',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black8,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .landmarkTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Zip Code (Optional)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.8,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.2,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .zipCodeTextController,
                                                          focusNode: _model
                                                              .zipCodeFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintText:
                                                                'TextField',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black8,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .zipCodeTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                              flex: 6,
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: 'Cancel',
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x0B151006),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .black100,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (_model.formKey2
                                                              .currentState ==
                                                          null ||
                                                      !_model.formKey2
                                                          .currentState!
                                                          .validate()) {
                                                    return;
                                                  }
                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                  _model.pageIndex = _model
                                                      .pageViewCurrentIndex;
                                                  safeSetState(() {});
                                                },
                                                text: 'Next',
                                                icon: Icon(
                                                  Icons.check,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .black100,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .white100,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
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
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    constraints: BoxConstraints(
                                      minWidth: 10.0,
                                      minHeight: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Form(
                                      key: _model.formKey1,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Add Product',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.8,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.2,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .productsTextController,
                                                        focusNode: _model
                                                            .productsFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          hintText:
                                                              'Select products',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x14151006),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          prefixIcon: Icon(
                                                            Icons.search_sharp,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .productsTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
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
                                                                    ListViewProductComponentWidget(
                                                                  onAddProduct:
                                                                      (selectedProductDetail) async {
                                                                    if (_model
                                                                        .orderProduct
                                                                        .isNotEmpty) {
                                                                      if (functions
                                                                              .checkProductId(_model.orderProduct.toList(), selectedProductDetail.id)
                                                                              .toString() !=
                                                                          '-1') {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Message'),
                                                                              content: Text('Item already in the list.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        _model.addToOrderProduct(
                                                                            selectedProductDetail);
                                                                        safeSetState(
                                                                            () {});
                                                                        // Set Subtotal
                                                                        _model
                                                                            .subtotal = _model
                                                                                .subtotal! +
                                                                            selectedProductDetail.price;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    } else {
                                                                      _model.addToOrderProduct(
                                                                          selectedProductDetail);
                                                                      safeSetState(
                                                                          () {});
                                                                      // Set Subtotal
                                                                      _model
                                                                          .subtotal = _model
                                                                              .subtotal! +
                                                                          selectedProductDetail
                                                                              .price;
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Voucher Code',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.8,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.2,
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
                                                    Expanded(
                                                      flex: 9,
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .voucherCodeTextController,
                                                          focusNode: _model
                                                              .voucherCodeFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintText:
                                                                'Enter voucher code',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x14151006),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .voucherCodeTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.voucherResult =
                                                              await VouchersTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'code',
                                                              _model
                                                                  .voucherCodeTextController
                                                                  .text,
                                                            ),
                                                          );
                                                          if (_model.voucherResult !=
                                                                  null &&
                                                              (_model.voucherResult)!
                                                                  .isNotEmpty) {
                                                            if (_model
                                                                    .voucherResult
                                                                    ?.firstOrNull
                                                                    ?.type ==
                                                                'Off') {
                                                              if (_model
                                                                      .voucherResult!
                                                                      .firstOrNull!
                                                                      .expiry!
                                                                      .millisecondsSinceEpoch >=
                                                                  getCurrentTimestamp
                                                                      .millisecondsSinceEpoch) {
                                                                _model.offAmount =
                                                                    valueOrDefault<
                                                                        double>(
                                                                  ((_model.voucherResult!.firstOrNull!
                                                                              .amount!) /
                                                                          100) *
                                                                      _model
                                                                          .subtotal!
                                                                          .toDouble(),
                                                                  0.0,
                                                                );
                                                                _model.isShippingFree =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Voucher'),
                                                                      content: Text(
                                                                          'Voucher code is already expired'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            } else {
                                                              if (_model
                                                                      .voucherResult
                                                                      ?.firstOrNull
                                                                      ?.type ==
                                                                  'Free shipping') {
                                                                _model.shippingFee =
                                                                    0;
                                                                _model.isShippingFree =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model.shippingFeeTextController
                                                                          ?.text =
                                                                      'Free';
                                                                });
                                                              } else {
                                                                _model.offAmount = _model
                                                                    .voucherResult
                                                                    ?.firstOrNull
                                                                    ?.amount;
                                                                _model.isShippingFree =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            }

                                                            _model.voucherId =
                                                                _model
                                                                    .voucherResult
                                                                    ?.firstOrNull
                                                                    ?.id;
                                                            _model.voucherCounts =
                                                                valueOrDefault<
                                                                    int>(
                                                              _model
                                                                  .voucherResult
                                                                  ?.firstOrNull
                                                                  ?.quantity,
                                                              0,
                                                            );
                                                            safeSetState(() {});
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Voucher'),
                                                                  content: Text(
                                                                      'Voucher code is invalid'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text: 'Apply',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    lineHeight:
                                                                        1.2,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Delivery Address',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.8,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.2,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Same address from user?',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                                  fontSize:
                                                                      12.8,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      1.2,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                          Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                      .checkboxValue1 ??=
                                                                  false,
                                                              onChanged:
                                                                  (newValue) async {
                                                                safeSetState(() =>
                                                                    _model.checkboxValue1 =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  _model.isThirdParty =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model.deliveryAddressTextController
                                                                            ?.text =
                                                                        _model
                                                                            .userAddressTextController
                                                                            .text;
                                                                  });
                                                                } else {
                                                                  _model.isThirdParty =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .deliveryAddressTextController
                                                                        ?.text = '';
                                                                  });
                                                                }
                                                              },
                                                              side: (FlutterFlowTheme.of(
                                                                              context)
                                                                          .choco100 !=
                                                                      null)
                                                                  ? BorderSide(
                                                                      width: 2,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .choco100,
                                                                    )
                                                                  : null,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .deliveryAddressTextController,
                                                    focusNode: _model
                                                        .deliveryAddressFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      hintText:
                                                          'Enter delivery address',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x14151006),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    maxLines: 2,
                                                    minLines: 1,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .deliveryAddressTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Contact Number',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.8,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.2,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Same contact number from user?',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                                  fontSize:
                                                                      12.8,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      1.2,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                          Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                      .checkboxValue2 ??=
                                                                  false,
                                                              onChanged:
                                                                  (newValue) async {
                                                                safeSetState(() =>
                                                                    _model.checkboxValue2 =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  _model.isThirdParty =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model.contactNumberTextController
                                                                            ?.text =
                                                                        _model
                                                                            .contactTextController
                                                                            .text;
                                                                  });
                                                                } else {
                                                                  _model.isThirdParty =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .contactNumberTextController
                                                                        ?.text = '';
                                                                  });
                                                                }
                                                              },
                                                              side: (FlutterFlowTheme.of(
                                                                              context)
                                                                          .choco100 !=
                                                                      null)
                                                                  ? BorderSide(
                                                                      width: 2,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .choco100,
                                                                    )
                                                                  : null,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .contactNumberTextController,
                                                    focusNode: _model
                                                        .contactNumberFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      hintText:
                                                          'Enter contact number',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x14151006),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .contactNumberTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Payment',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.8,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.2,
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                safeSetState(() =>
                                                                    _model.paymentXdeal =
                                                                        !_model
                                                                            .paymentXdeal);
                                                                _model.paymentXdeal =
                                                                    true;
                                                                _model.paymentYes =
                                                                    false;
                                                                _model.paymentNo =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              value: _model
                                                                  .paymentXdeal,
                                                              onIcon: Icon(
                                                                Icons
                                                                    .radio_button_checked,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .choco100,
                                                                size: 24.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .radio_button_off,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .choco100,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'XDEAL',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black50,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.2,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ]
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          4.0))
                                                              .addToEnd(
                                                                  SizedBox(
                                                                      width:
                                                                          4.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                safeSetState(() =>
                                                                    _model.paymentYes =
                                                                        !_model
                                                                            .paymentYes);
                                                                _model.paymentXdeal =
                                                                    false;
                                                                _model.paymentYes =
                                                                    true;
                                                                _model.paymentNo =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              value: _model
                                                                  .paymentYes,
                                                              onIcon: Icon(
                                                                Icons
                                                                    .radio_button_checked,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .choco100,
                                                                size: 24.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .radio_button_off,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .choco100,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'YES',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black50,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.2,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ]
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          4.0))
                                                              .addToEnd(
                                                                  SizedBox(
                                                                      width:
                                                                          4.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                safeSetState(() =>
                                                                    _model.paymentNo =
                                                                        !_model
                                                                            .paymentNo);
                                                                _model.paymentXdeal =
                                                                    false;
                                                                _model.paymentYes =
                                                                    false;
                                                                _model.paymentNo =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              value: _model
                                                                  .paymentNo,
                                                              onIcon: Icon(
                                                                Icons
                                                                    .radio_button_checked,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .choco100,
                                                                size: 24.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .radio_button_off,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .choco100,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'NO',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black50,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.2,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ]
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          4.0))
                                                              .addToEnd(
                                                                  SizedBox(
                                                                      width:
                                                                          4.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .paymentMethodTextController,
                                                        focusNode: _model
                                                            .paymentMethodFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          hintText:
                                                              'Select Payment Method',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x14151006),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          suffixIcon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_outlined,
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .paymentMethodTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
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
                                                                    ListViewPaymentMethodComponentWidget(
                                                                  onSelect:
                                                                      (paymentMethod) async {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.paymentMethodTextController
                                                                              ?.text =
                                                                          paymentMethod
                                                                              .method!;
                                                                    });
                                                                    _model.paymentId =
                                                                        paymentMethod
                                                                            .id;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            if (_model.paymentYes == true)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Payment Terms',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 12.8,
                                                              letterSpacing:
                                                                  0.0,
                                                              lineHeight: 1.2,
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
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(() =>
                                                                      _model.paymentPartial =
                                                                          !_model
                                                                              .paymentPartial);
                                                                  _model.paymentFull =
                                                                      false;
                                                                  _model.paymentPartial =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                value: _model
                                                                    .paymentPartial,
                                                                onIcon: Icon(
                                                                  Icons
                                                                      .radio_button_checked,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                                  size: 24.0,
                                                                ),
                                                                offIcon: Icon(
                                                                  Icons
                                                                      .radio_button_off,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'PARTIAL',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black50,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.2,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ]
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            4.0))
                                                                .addToEnd(
                                                                    SizedBox(
                                                                        width:
                                                                            4.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(() =>
                                                                      _model.paymentFull =
                                                                          !_model
                                                                              .paymentFull);
                                                                  _model.paymentFull =
                                                                      true;
                                                                  _model.paymentPartial =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                value: _model
                                                                    .paymentFull,
                                                                onIcon: Icon(
                                                                  Icons
                                                                      .radio_button_checked,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                                  size: 24.0,
                                                                ),
                                                                offIcon: Icon(
                                                                  Icons
                                                                      .radio_button_off,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .choco100,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'FULL',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black50,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.2,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ]
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            4.0))
                                                                .addToEnd(
                                                                    SizedBox(
                                                                        width:
                                                                            4.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .paymentTermsTextController,
                                                      focusNode: _model
                                                          .paymentTermsFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                        hintText: '0',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x14151006),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
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
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .paymentTermsTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'referenceNumber',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.8,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.2,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .referenceNumberTextController,
                                                    focusNode: _model
                                                        .referenceNumberFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      hintText:
                                                          'Enter Reference Number',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x14151006),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .referenceNumberTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Shipping Fee',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.8,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.2,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .shippingFeeTextController,
                                                    focusNode: _model
                                                        .shippingFeeFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.shippingFeeTextController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () async {
                                                        _model.shippingFee =
                                                            int.tryParse(_model
                                                                .shippingFeeTextController
                                                                .text);
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    readOnly:
                                                        _model.isShippingFree,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      hintText:
                                                          'Enter Shipping Fee',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x14151006),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .shippingFeeTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    constraints: BoxConstraints(
                                      minWidth: 10.0,
                                      minHeight: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
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
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .modalDetailsTitleComponentModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      ModalDetailsTitleComponentWidget(
                                                    title: 'Order Breakdown',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final producstLv = _model
                                                          .orderProduct
                                                          .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            producstLv.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 12.0),
                                                        itemBuilder: (context,
                                                            producstLvIndex) {
                                                          final producstLvItem =
                                                              producstLv[
                                                                  producstLvIndex];
                                                          return wrapWithModel(
                                                            model: _model
                                                                .orderBreakdownComponentModels
                                                                .getModel(
                                                              producstLvItem.id
                                                                  .toString(),
                                                              producstLvIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                OrderBreakdownComponentWidget(
                                                              key: Key(
                                                                'Keykkd_${producstLvItem.id.toString()}',
                                                              ),
                                                              productDetails:
                                                                  producstLvItem,
                                                              onUpdateQuantity:
                                                                  (qty, price,
                                                                      prod) async {
                                                                if (qty <= 0) {
                                                                  _model
                                                                      .removeFromOrderProduct(
                                                                          prod);
                                                                  safeSetState(
                                                                      () {});
                                                                  // Set Subtotal
                                                                  _model.subtotal =
                                                                      _model.subtotal! +
                                                                          price;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .updateOrderProductAtIndex(
                                                                    producstLvIndex,
                                                                    (e) => e
                                                                      ..quantity =
                                                                          qty
                                                                      ..price =
                                                                          price,
                                                                  );
                                                                  _model.subtotal =
                                                                      0;
                                                                  safeSetState(
                                                                      () {});
                                                                  for (int loop1Index =
                                                                          0;
                                                                      loop1Index <
                                                                          _model
                                                                              .orderProduct
                                                                              .length;
                                                                      loop1Index++) {
                                                                    final currentLoop1Item =
                                                                        _model.orderProduct[
                                                                            loop1Index];
                                                                    if (currentLoop1Item
                                                                            .quantity <=
                                                                        0) {
                                                                      _model.removeFromOrderProduct(
                                                                          currentLoop1Item);
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    _model
                                                                        .computePrice = currentLoop1Item
                                                                            .price *
                                                                        currentLoop1Item
                                                                            .quantity;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model
                                                                        .subtotal = _model
                                                                            .subtotal! +
                                                                        _model
                                                                            .computePrice;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.computePrice =
                                                                        0;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                }
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  StyledDivider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    lineStyle:
                                                        DividerLineStyle.dashed,
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .modalDetailsComponentModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ModalDetailsComponentWidget(
                                                  label: 'Subtotal',
                                                  value: valueOrDefault<String>(
                                                    formatNumber(
                                                      _model.subtotal,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: 'PHP ',
                                                    ),
                                                    'PHP 1,000.00',
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    constraints: BoxConstraints(
                                      minWidth: 10.0,
                                      minHeight: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
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
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .modalDetailsTitleComponentModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      ModalDetailsTitleComponentWidget(
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
                                                model: _model
                                                    .modalDetailsComponentModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ModalDetailsComponentWidget(
                                                  label: 'Subtotal',
                                                  value: valueOrDefault<String>(
                                                    formatNumber(
                                                      _model.subtotal,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: 'PHP ',
                                                    ),
                                                    'PHP 1,000.00',
                                                  ),
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .modalDetailsComponentModel3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ModalDetailsComponentWidget(
                                                  label: 'Shipping Fee',
                                                  value: valueOrDefault<String>(
                                                    formatNumber(
                                                      _model.shippingFee,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: 'PHP ',
                                                    ),
                                                    'PHP 1',
                                                  ),
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .modalDetailsComponentModel4,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ModalDetailsComponentWidget(
                                                  label: 'Item Discounts',
                                                  value: '- PHP 0',
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .modalDetailsComponentModel5,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ModalDetailsComponentWidget(
                                                  label: 'Order Voucher',
                                                  value:
                                                      '- PHP ${valueOrDefault<String>(
                                                    _model.offAmount
                                                        ?.toString(),
                                                    '0',
                                                  )}',
                                                ),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .modalMainDetails700ComponentModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ModalMainDetails700ComponentWidget(
                                                  label: 'Total',
                                                  value: valueOrDefault<String>(
                                                    _model.paymentXdeal
                                                        ? '0'
                                                        : valueOrDefault<
                                                            String>(
                                                            formatNumber(
                                                              _model.subtotal!
                                                                      .toDouble() +
                                                                  _model
                                                                      .shippingFee!
                                                                      .toDouble() -
                                                                  (_model
                                                                      .offAmount!),
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .periodDecimal,
                                                              currency: 'PHP ',
                                                            ),
                                                            '1000',
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .black4,
                                            icon: Icon(
                                              Icons.arrow_back,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black100,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              await _model.pageViewController
                                                  ?.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                              _model.pageIndex =
                                                  _model.pageViewCurrentIndex;
                                              safeSetState(() {});
                                            },
                                          ),
                                          Expanded(
                                            flex: 12,
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.orderFormOutput = true;
                                                if (_model.formKey1
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey1.currentState!
                                                        .validate()) {
                                                  safeSetState(() => _model
                                                      .orderFormOutput = false);
                                                  return;
                                                }
                                                await _model.pageViewController
                                                    ?.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                                _model.pageIndex =
                                                    _model.pageViewCurrentIndex;
                                                safeSetState(() {});

                                                safeSetState(() {});
                                              },
                                              text: 'Next',
                                              icon: Icon(
                                                Icons.arrow_right_alt,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black100,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white100,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  minWidth: 10.0,
                                  minHeight: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .modalDetailsTitleComponentModel3,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ModalDetailsTitleComponentWidget(
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
                                            model: _model
                                                .modalDetailsComponentModel6,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Full Name',
                                              value:
                                                  '${_model.firstNameTextController.text} ${_model.lastNameTextController.text}',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel7,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Contact Number',
                                              value: _model
                                                  .contactTextController.text,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel8,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Email',
                                              value: _model
                                                  .emailTextController.text,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel9,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Company Name',
                                              value: _model
                                                  .companyTextController.text,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel10,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Birth Date',
                                              value: _model
                                                  .birthdateTextController.text,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel11,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Country',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel12,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Zip Code',
                                              value: _model
                                                  .zipCodeTextController.text,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel13,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Address',
                                              value: _model
                                                  .userAddressTextController
                                                  .text,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel14,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Payment Method',
                                              value: _model
                                                  .paymentMethodTextController
                                                  .text,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel15,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Reference Number',
                                              value: _model
                                                  .referenceNumberTextController
                                                  .text,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel16,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Upload Receipt',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel17,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Shipping Fee',
                                              value: _model
                                                  .shippingFeeTextController
                                                  .text,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  minWidth: 10.0,
                                  minHeight: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .modalDetailsTitleComponentModel4,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ModalDetailsTitleComponentWidget(
                                                title: 'Order Breakdown',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final orderProductLv =
                                                  _model.orderProduct.toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    orderProductLv.length,
                                                itemBuilder: (context,
                                                    orderProductLvIndex) {
                                                  final orderProductLvItem =
                                                      orderProductLv[
                                                          orderProductLvIndex];
                                                  return ModalMainDetailsComponentWidget(
                                                    key: Key(
                                                        'Keyd2d_${orderProductLvIndex}_of_${orderProductLv.length}'),
                                                    label:
                                                        '${orderProductLvItem.name}(${orderProductLvItem.quantity.toString()})',
                                                    value: formatNumber(
                                                      orderProductLvItem.price
                                                              .toDouble() *
                                                          orderProductLvItem
                                                              .quantity,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: 'PHP ',
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalMainDetails700ComponentModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                ModalMainDetails700ComponentWidget(
                                              label: 'Subtotal',
                                              value: formatNumber(
                                                _model.subtotal,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: 'PHP ',
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  minWidth: 10.0,
                                  minHeight: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .modalDetailsTitleComponentModel5,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ModalDetailsTitleComponentWidget(
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
                                            model: _model
                                                .modalDetailsComponentModel18,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Subtotal',
                                              value: formatNumber(
                                                _model.subtotal,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: 'PHP ',
                                              ),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel19,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Shipping Fee',
                                              value: formatNumber(
                                                _model.shippingFee,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: 'PHP ',
                                              ),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel20,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Item Discounts',
                                              value: '-0',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalDetailsComponentModel21,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModalDetailsComponentWidget(
                                              label: 'Order Voucher',
                                              value: '-0',
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .modalMainDetails700ComponentModel3,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                ModalMainDetails700ComponentWidget(
                                              label: 'Total',
                                              value: formatNumber(
                                                _model.subtotal!.toDouble() +
                                                    _model.shippingFee!
                                                        .toDouble() -
                                                    (_model.offAmount!),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: 'PHP ',
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor:
                                            FlutterFlowTheme.of(context).black4,
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .black100,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                          _model.pageIndex =
                                              _model.pageViewCurrentIndex;
                                          safeSetState(() {});
                                        },
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              _model.clientInsertDraftOutput =
                                                  await CustomerTable().insert({
                                                'first_name': _model
                                                    .firstNameTextController
                                                    .text,
                                                'last_name': _model
                                                    .lastNameTextController
                                                    .text,
                                                'company': _model
                                                    .companyTextController.text,
                                                'email': _model
                                                    .emailTextController.text,
                                                'address': _model
                                                    .userAddressTextController
                                                    .text,
                                                'landmark': _model
                                                    .landmarkTextController
                                                    .text,
                                                'zip_code': int.tryParse(_model
                                                    .zipCodeTextController
                                                    .text),
                                                'contact': (_model
                                                            .contactFocusNode
                                                            ?.hasFocus ??
                                                        false)
                                                    .toString(),
                                                'birthdate':
                                                    supaSerialize<DateTime>(
                                                        _model.birthdate),
                                              });
                                              _model.orderInsertDraftsOutput =
                                                  await OrdersTable().insert({
                                                'customer_id': _model
                                                    .clientInsertOutput?.id,
                                                'delivery_address': _model
                                                    .deliveryAddressTextController
                                                    .text,
                                                'voucher_code': '',
                                                'shipping_fee': _model
                                                    .shippingFee
                                                    ?.toDouble(),
                                                'payment_id': _model.paymentId,
                                                'x_deal': _model.paymentXdeal,
                                                'status': 'Drafts',
                                              });
                                              await OrdersTable().update(
                                                data: {
                                                  'code': _model
                                                      .orderInsertDraftsOutput
                                                      ?.id
                                                      .toString(),
                                                },
                                                matchingRows: (rows) =>
                                                    rows.eqOrNull(
                                                  'id',
                                                  _model.orderInsertDraftsOutput
                                                      ?.id,
                                                ),
                                              );
                                              for (int loop1Index = 0;
                                                  loop1Index <
                                                      _model
                                                          .orderProduct.length;
                                                  loop1Index++) {
                                                final currentLoop1Item = _model
                                                    .orderProduct[loop1Index];
                                                await OrderProductsTable()
                                                    .insert({
                                                  'order_id': _model
                                                      .orderInsertOutput?.id,
                                                  'product_id':
                                                      currentLoop1Item.id,
                                                  'price': currentLoop1Item
                                                      .price
                                                      .toDouble(),
                                                  'quantity': currentLoop1Item
                                                      .quantity
                                                      .toDouble(),
                                                });
                                              }
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Zion'),
                                                    content: Text(
                                                        'Order has been created!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child:
                                                        NewOrderDraftModalWidget(
                                                      orderCode:
                                                          _model.orderCode,
                                                    ),
                                                  );
                                                },
                                              );

                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child:
                                                        NewOrderUpdatedModalWidget(
                                                      orderCode:
                                                          _model.orderCode,
                                                      products:
                                                          _model.orderProduct,
                                                      subtotal: _model.subtotal!
                                                          .toDouble(),
                                                      tax: 0.0,
                                                      discount:
                                                          _model.offAmount!,
                                                      total:
                                                          _model.subtotal!
                                                                  .toDouble() +
                                                              _model
                                                                  .shippingFee!
                                                                  .toDouble() -
                                                              (_model
                                                                  .offAmount!),
                                                      isXdeal:
                                                          _model.paymentXdeal,
                                                      isDraft: true,
                                                    ),
                                                  );
                                                },
                                              );

                                              safeSetState(() {});
                                            },
                                            text: 'Save as Drafts',
                                            icon: FaIcon(
                                              FontAwesomeIcons.edit,
                                              size: 16.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black4,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .black100,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
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
                                      Expanded(
                                        flex: 6,
                                        child: Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              if (widget.isUpdate == false) {
                                                await VouchersTable().update(
                                                  data: {
                                                    'quantity':
                                                        (int voucherCount) {
                                                      return voucherCount++;
                                                    }(_model.voucherCounts!),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    _model.voucherId,
                                                  ),
                                                );
                                                // Capture Client
                                                _model.clientInsertOutput =
                                                    await CustomerTable()
                                                        .insert({
                                                  'first_name': _model
                                                      .firstNameTextController
                                                      .text,
                                                  'last_name': _model
                                                      .lastNameTextController
                                                      .text,
                                                  'company': _model
                                                      .companyTextController
                                                      .text,
                                                  'email': _model
                                                      .emailTextController.text,
                                                  'address': _model
                                                      .userAddressTextController
                                                      .text,
                                                  'landmark': _model
                                                      .landmarkTextController
                                                      .text,
                                                  'zip_code': int.tryParse(
                                                      _model
                                                          .zipCodeTextController
                                                          .text),
                                                  'contact': _model
                                                      .contactTextController
                                                      .text,
                                                  'birthdate':
                                                      supaSerialize<DateTime>(
                                                          _model.birthdate),
                                                });
                                                // Create Order
                                                _model.orderInsertOutput =
                                                    await OrdersTable().insert({
                                                  'customer_id': _model
                                                      .clientInsertOutput?.id,
                                                  'delivery_address': _model
                                                      .deliveryAddressTextController
                                                      .text,
                                                  'voucher_code': _model
                                                      .voucherCodeTextController
                                                      .text,
                                                  'shipping_fee': _model
                                                      .shippingFee
                                                      ?.toDouble(),
                                                  'payment_id':
                                                      _model.paymentId,
                                                  'x_deal': _model.paymentXdeal,
                                                  'status': 'New',
                                                  'code': _model.orderCode,
                                                });
                                                for (int loop1Index = 0;
                                                    loop1Index <
                                                        _model.orderProduct
                                                            .length;
                                                    loop1Index++) {
                                                  final currentLoop1Item =
                                                      _model.orderProduct[
                                                          loop1Index];
                                                  await OrderProductsTable()
                                                      .insert({
                                                    'order_id': _model
                                                        .orderInsertOutput?.id,
                                                    'product_id':
                                                        currentLoop1Item.id,
                                                    'price': currentLoop1Item
                                                        .price
                                                        .toDouble(),
                                                    'quantity': currentLoop1Item
                                                        .quantity
                                                        .toDouble(),
                                                  });
                                                }
                                                // Create Order History
                                                await OrderHistoryTable()
                                                    .insert({
                                                  'order_id': _model
                                                      .orderInsertOutput?.id,
                                                  'status': _model
                                                      .orderInsertOutput
                                                      ?.status,
                                                  'remarks': _model
                                                      .orderInsertOutput
                                                      ?.remarks,
                                                });
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Zion'),
                                                      content: Text(
                                                          'Order has been created!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child:
                                                          NewOrderUpdatedModalWidget(
                                                        orderCode:
                                                            _model.orderCode,
                                                        products:
                                                            _model.orderProduct,
                                                        subtotal: _model
                                                            .subtotal!
                                                            .toDouble(),
                                                        tax: 0.0,
                                                        discount:
                                                            _model.offAmount!,
                                                        total:
                                                            _model.subtotal!
                                                                    .toDouble() +
                                                                _model
                                                                    .shippingFee!
                                                                    .toDouble() -
                                                                (_model
                                                                    .offAmount!),
                                                        isXdeal:
                                                            _model.paymentXdeal,
                                                        isDraft: false,
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                await VouchersTable().update(
                                                  data: {
                                                    'quantity':
                                                        (int voucherCount) {
                                                      return voucherCount++;
                                                    }(_model.voucherCounts!),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    _model.voucherId,
                                                  ),
                                                );
                                                await CustomerTable().update(
                                                  data: {
                                                    'first_name': _model
                                                        .firstNameTextController
                                                        .text,
                                                    'last_name': _model
                                                        .lastNameTextController
                                                        .text,
                                                    'company': _model
                                                        .companyTextController
                                                        .text,
                                                    'email': _model
                                                        .emailTextController
                                                        .text,
                                                    'address': _model
                                                        .userAddressTextController
                                                        .text,
                                                    'landmark': _model
                                                        .landmarkTextController
                                                        .text,
                                                    'zip_code': int.tryParse(
                                                        _model
                                                            .zipCodeTextController
                                                            .text),
                                                    'contact': _model
                                                        .contactTextController
                                                        .text,
                                                    'birthdate':
                                                        supaSerialize<DateTime>(
                                                            _model.datePicked),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    _model.userId,
                                                  ),
                                                );
                                                await OrdersTable().update(
                                                  data: {
                                                    'delivery_address': _model
                                                        .deliveryAddressTextController
                                                        .text,
                                                    'voucher_code': _model
                                                        .voucherCodeTextController
                                                        .text,
                                                    'payment_id':
                                                        _model.paymentId,
                                                    'shipping_fee': _model
                                                        .shippingFee
                                                        ?.toDouble(),
                                                    'x_deal':
                                                        _model.paymentXdeal,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    widget.orderid,
                                                  ),
                                                );
                                                Navigator.pop(context);
                                              }

                                              safeSetState(() {});
                                            },
                                            text: 'Confirm update',
                                            icon: Icon(
                                              Icons.check_outlined,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFB19341),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .white100,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
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
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
