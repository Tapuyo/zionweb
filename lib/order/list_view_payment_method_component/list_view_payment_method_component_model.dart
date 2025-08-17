import '/flutter_flow/flutter_flow_util.dart';
import '/order/list_item_payment_method/list_item_payment_method_widget.dart';
import 'list_view_payment_method_component_widget.dart'
    show ListViewPaymentMethodComponentWidget;
import 'package:flutter/material.dart';

class ListViewPaymentMethodComponentModel
    extends FlutterFlowModel<ListViewPaymentMethodComponentWidget> {
  ///  Local state fields for this component.

  bool isHovered = false;

  ///  State fields for stateful widgets in this component.

  // Models for listItemPaymentMethod dynamic component.
  late FlutterFlowDynamicModels<ListItemPaymentMethodModel>
      listItemPaymentMethodModels;

  @override
  void initState(BuildContext context) {
    listItemPaymentMethodModels =
        FlutterFlowDynamicModels(() => ListItemPaymentMethodModel());
  }

  @override
  void dispose() {
    listItemPaymentMethodModels.dispose();
  }
}
