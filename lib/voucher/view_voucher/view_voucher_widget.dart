import '/backend/supabase/supabase.dart';
import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view_voucher_model.dart';
export 'view_voucher_model.dart';

class ViewVoucherWidget extends StatefulWidget {
  const ViewVoucherWidget({
    super.key,
    required this.voucher,
  });

  final VouchersRow? voucher;

  @override
  State<ViewVoucherWidget> createState() => _ViewVoucherWidgetState();
}

class _ViewVoucherWidgetState extends State<ViewVoucherWidget> {
  late ViewVoucherModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewVoucherModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 500.0,
        height: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Create Voucher',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.2,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        Container(),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
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
                    borderRadius: BorderRadius.circular(12.0),
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
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/voucher.png',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Voucher ID',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .white100,
                                          fontSize: 12.8,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      widget.voucher!.id.toString(),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .white100,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
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
                                widget.voucher!.code!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).white100,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: widget.voucher!.code!));
                                },
                                child: Icon(
                                  Icons.content_copy,
                                  color: FlutterFlowTheme.of(context).white100,
                                  size: 24.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 20.0, 16.0, 50.0),
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
                                      model: _model
                                          .modalDetailsTitleComponentModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ModalDetailsTitleComponentWidget(
                                        title: 'Voucher Information',
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
                                      label: 'Voucher code',
                                      value: widget.voucher?.code,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.modalDetailsComponentModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ModalDetailsComponentWidget(
                                      label: 'Voucher Type',
                                      value: widget.voucher?.type,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.modalDetailsComponentModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ModalDetailsComponentWidget(
                                      label: 'Amount or %',
                                      value:
                                          widget.voucher?.amount?.toString(),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.modalDetailsComponentModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ModalDetailsComponentWidget(
                                      label: 'Usage Quantity',
                                      value: widget.voucher?.limit?.toString(),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.modalDetailsComponentModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ModalDetailsComponentWidget(
                                      label: 'No of use',
                                      value:
                                          widget.voucher?.quantity?.toString(),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.modalDetailsComponentModel6,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ModalDetailsComponentWidget(
                                      label: 'Expiry Date',
                                      value: dateTimeFormat(
                                          "yMMMd", widget.voucher?.expiry),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
