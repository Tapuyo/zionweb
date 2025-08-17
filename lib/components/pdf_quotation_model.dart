import '/components/pdf_items_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pdf_quotation_widget.dart' show PdfQuotationWidget;
import 'package:flutter/material.dart';

class PdfQuotationModel extends FlutterFlowModel<PdfQuotationWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for pdfItems component.
  late PdfItemsModel pdfItemsModel;

  @override
  void initState(BuildContext context) {
    pdfItemsModel = createModel(context, () => PdfItemsModel());
  }

  @override
  void dispose() {
    pdfItemsModel.dispose();
  }
}
