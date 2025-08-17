import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'new_order_updated_modal_model.dart';
export 'new_order_updated_modal_model.dart';

class NewOrderUpdatedModalWidget extends StatefulWidget {
  const NewOrderUpdatedModalWidget({
    super.key,
    required this.orderCode,
    required this.products,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.total,
    required this.isXdeal,
    required this.isDraft,
  });

  final String? orderCode;
  final List<OrderProductsStruct>? products;
  final double? subtotal;
  final double? tax;
  final double? discount;
  final double? total;
  final bool? isXdeal;
  final bool? isDraft;

  @override
  State<NewOrderUpdatedModalWidget> createState() =>
      _NewOrderUpdatedModalWidgetState();
}

class _NewOrderUpdatedModalWidgetState
    extends State<NewOrderUpdatedModalWidget> {
  late NewOrderUpdatedModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewOrderUpdatedModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isDraft == false) {
        if (widget.isXdeal!) {
          _model.pdfWarranty = await actions.pdfInvoice(
            widget.products?.toList(),
            widget.subtotal,
            widget.tax,
            widget.discount,
            widget.total,
          );
          _model.pdfGenerate = _model.pdfWarranty;
          safeSetState(() {});
        } else {
          _model.pdfWarranty1 = await actions.pdfInvoice(
            widget.products?.toList(),
            widget.subtotal,
            widget.tax,
            widget.discount,
            widget.total,
          );
          _model.pdfCertificate = await actions.pdfWarranty(
            widget.products?.toList(),
            widget.subtotal,
            widget.tax,
            widget.discount,
            widget.total,
            widget.orderCode,
          );
          _model.pdfGenerate = _model.pdfWarranty1;
          safeSetState(() {});
        }
      } else {
        _model.pdfQuotation = await actions.pdfQuotation(
          widget.products?.toList(),
          widget.subtotal,
          widget.tax,
          widget.discount,
          widget.total,
        );
        _model.pdfGenerate = _model.pdfQuotation;
        safeSetState(() {});
      }
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
                            Text(
                              'Updating New Order...',
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
                                          widget.orderCode,
                                          'ZION123',
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          size: 64.0,
                                        ),
                                        Text(
                                          'New order has been created!',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                    StyledDivider(
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).alternate,
                      lineStyle: DividerLineStyle.dashed,
                    ),
                    FlutterFlowPdfViewer(
                      fileBytes: _model.pdfGenerate?.bytes,
                      height: 300.0,
                      horizontalScroll: false,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 12,
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (widget.isDraft!) {
                                  await downloadFile(
                                    filename: 'Quotation',
                                    uploadedFile: _model.pdfQuotation!,
                                  );
                                } else {
                                  if (widget.isXdeal!) {
                                    await downloadFile(
                                      filename: 'Warranty',
                                      uploadedFile: _model.pdfWarranty!,
                                    );
                                  } else {
                                    await downloadFile(
                                      filename: 'Warranty',
                                      uploadedFile: _model.pdfWarranty1!,
                                    );
                                    await downloadFile(
                                      filename: 'Cartificate',
                                      uploadedFile: _model.pdfCertificate!,
                                    );
                                  }
                                }
                              },
                              text: 'Download Invoice',
                              icon: Icon(
                                Icons.download,
                                size: 16.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconAlignment: IconAlignment.end,
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFB19341),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).white100,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
