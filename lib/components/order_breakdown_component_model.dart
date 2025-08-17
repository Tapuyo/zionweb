import '/flutter_flow/flutter_flow_util.dart';
import 'order_breakdown_component_widget.dart'
    show OrderBreakdownComponentWidget;
import 'package:flutter/material.dart';

class OrderBreakdownComponentModel
    extends FlutterFlowModel<OrderBreakdownComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for voucherCode widget.
  FocusNode? voucherCodeFocusNode;
  TextEditingController? voucherCodeTextController;
  String? Function(BuildContext, String?)? voucherCodeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    voucherCodeFocusNode?.dispose();
    voucherCodeTextController?.dispose();
  }
}
