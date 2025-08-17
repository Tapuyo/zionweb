import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_product_modal_widget.dart' show AddNewProductModalWidget;
import 'package:flutter/material.dart';

class AddNewProductModalModel
    extends FlutterFlowModel<AddNewProductModalWidget> {
  ///  Local state fields for this component.

  int? updateStep = 0;

  String? productName;

  String? productCode;

  int? productPrice;

  String? productImage;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadData8n81 = false;
  FFUploadedFile uploadedLocalFile_uploadData8n81 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData8n81 = '';

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  String? _productNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Product name is required.';
    }

    return null;
  }

  // State field(s) for productCode widget.
  FocusNode? productCodeFocusNode;
  TextEditingController? productCodeTextController;
  String? Function(BuildContext, String?)? productCodeTextControllerValidator;
  String? _productCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Product code is required';
    }

    return null;
  }

  // State field(s) for productPrice widget.
  FocusNode? productPriceFocusNode;
  TextEditingController? productPriceTextController;
  String? Function(BuildContext, String?)? productPriceTextControllerValidator;
  String? _productPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Price is required.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ProductsRow? addProduct;

  @override
  void initState(BuildContext context) {
    productNameTextControllerValidator = _productNameTextControllerValidator;
    productCodeTextControllerValidator = _productCodeTextControllerValidator;
    productPriceTextControllerValidator = _productPriceTextControllerValidator;
  }

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
