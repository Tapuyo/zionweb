import '/components/pdf_items_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'pdf_quotation_model.dart';
export 'pdf_quotation_model.dart';

/// Quotation Summary Document
class PdfQuotationWidget extends StatefulWidget {
  const PdfQuotationWidget({super.key});

  @override
  State<PdfQuotationWidget> createState() => _PdfQuotationWidgetState();
}

class _PdfQuotationWidgetState extends State<PdfQuotationWidget> {
  late PdfQuotationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfQuotationModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.contain,
          alignment: AlignmentDirectional(0.0, 0.0),
          image: Image.asset(
            'assets/images/logo-zion-20.png',
          ).image,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/logo-zion.png',
                  width: 65.0,
                  height: 65.0,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ZION SOOTHING HAVEN INC',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineSmallIsCustom,
                              ),
                    ),
                    Text(
                      'Unit 15 Arca Strip Commercial Inc. Arthur Highway Cor. Action Drive, Dalandanan, Valenzuela City',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
                          ),
                    ),
                    Text(
                      'Tel No.: 09-123-456-7890',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
                          ),
                    ),
                  ].divide(SizedBox(height: 2.28)),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Text(
                      'QUOTATION',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineMediumIsCustom,
                              ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Text(
                      'Valid from Feb 27, 2025 - Mar 06, 2025',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
            wrapWithModel(
              model: _model.pdfItemsModel,
              updateCallback: () => safeSetState(() {}),
              child: PdfItemsWidget(),
            ),
            StyledDivider(
              thickness: 2.0,
              indent: 32.0,
              endIndent: 32.0,
              color: FlutterFlowTheme.of(context).alternate,
              lineStyle: DividerLineStyle.dashed,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Information',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                      Image.asset(
                        'assets/images/BDO_Unibank_(logo).svg.png',
                        width: 80.0,
                        height: 40.0,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        'Account No.: 011-208-000-868',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodySmallIsCustom,
                            ),
                      ),
                      Image.asset(
                        'assets/images/Unionbank_2018_logo.svg.png',
                        width: 132.2,
                        height: 40.0,
                        fit: BoxFit.cover,
                        alignment: Alignment(-1.0, -1.0),
                      ),
                      Text(
                        'Account No.: 000-360-014-720',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodySmallIsCustom,
                            ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo-zion.png',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Zion Soothing Haven Inc.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                      Text(
                        'Unit 15 Arca Strip Commercial Inc. Arthur Highway Cor. Action Drive, Dalandanan, Valenzuela City',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodySmallIsCustom,
                            ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ].divide(SizedBox(width: 40.0)),
              ),
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
