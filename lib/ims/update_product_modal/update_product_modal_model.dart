import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_product_modal_widget.dart' show UpdateProductModalWidget;
import 'package:flutter/material.dart';

class UpdateProductModalModel
    extends FlutterFlowModel<UpdateProductModalWidget> {
  ///  Local state fields for this component.

  int? updateStep = 0;

  String? productName;

  String? productCode;

  int? productPrice;

  ProductsRow? productDetails;

  String? productImage;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadData8n8 = false;
  FFUploadedFile uploadedLocalFile_uploadData8n8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData8n8 = '';

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  // State field(s) for productCode widget.
  FocusNode? productCodeFocusNode;
  TextEditingController? productCodeTextController;
  String? Function(BuildContext, String?)? productCodeTextControllerValidator;
  // State field(s) for productPrice widget.
  FocusNode? productPriceFocusNode;
  TextEditingController? productPriceTextController;
  String? Function(BuildContext, String?)? productPriceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    productCodeFocusNode?.dispose();
    productCodeTextController?.dispose();

    productPriceFocusNode?.dispose();
    productPriceTextController?.dispose();
  }
}
