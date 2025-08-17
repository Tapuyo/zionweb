import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/calendar/modal_main_details700_component/modal_main_details700_component_widget.dart';
import '/calendar/modal_main_details_component/modal_main_details_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ready_to_dispatch_modal_model.dart';
export 'ready_to_dispatch_modal_model.dart';

class ReadyToDispatchModalWidget extends StatefulWidget {
  const ReadyToDispatchModalWidget({
    super.key,
    int? updateStep,
  }) : this.updateStep = updateStep ?? 0;

  final int updateStep;

  @override
  State<ReadyToDispatchModalWidget> createState() =>
      _ReadyToDispatchModalWidgetState();
}

class _ReadyToDispatchModalWidgetState
    extends State<ReadyToDispatchModalWidget> {
  late ReadyToDispatchModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadyToDispatchModalModel());

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
                            Icon(
                              Icons.check,
                              color: FlutterFlowTheme.of(context).green100,
                              size: 24.0,
                            ),
                            Text(
                              'Ready to Dispatch',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).green100,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
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
                                        'ZIO12345',
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
                                  value: 'Kevin',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Contact Number',
                                  value: '09291231234',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Email',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Company Name',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Birth Date',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel6,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Country',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel7,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Zip Code',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel8,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Address',
                                  value:
                                      '1234 Broadway Avenue, Apartment 5B, New York, NY 10001, USA',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel9,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Payment Method',
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.modalMainDetailsComponentModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalMainDetailsComponentWidget(
                                  label: 'Zion VIP',
                                  value: 'PHP 260,000',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalMainDetailsComponentModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalMainDetailsComponentWidget(
                                  label: 'Zion VIP',
                                  value: 'PHP 260,000',
                                ),
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              wrapWithModel(
                                model:
                                    _model.modalMainDetails700ComponentModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalMainDetails700ComponentWidget(
                                  label: 'Subtotal',
                                  value: 'PHP 315,000',
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
                                  value: 'PHP 315,000',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel11,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Shipping Fee',
                                  value: 'PHP 65',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel12,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Item Discounts',
                                  value: '- PHP 31,500',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.modalDetailsComponentModel13,
                                updateCallback: () => safeSetState(() {}),
                                child: ModalDetailsComponentWidget(
                                  label: 'Order Voucher',
                                  value: '- PHP 31,500',
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
                                  value: 'PHP 303,615',
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
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
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
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Dispatch',
                              icon: FaIcon(
                                FontAwesomeIcons.carSide,
                                size: 13.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x0B151006),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).black100,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 8.0)),
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
