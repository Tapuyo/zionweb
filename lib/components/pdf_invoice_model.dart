import '/components/pdf_items_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pdf_invoice_widget.dart' show PdfInvoiceWidget;
import 'package:flutter/material.dart';

class PdfInvoiceModel extends FlutterFlowModel<PdfInvoiceWidget> {
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
