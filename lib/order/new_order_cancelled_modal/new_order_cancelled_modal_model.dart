import '/components/status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_order_cancelled_modal_widget.dart'
    show NewOrderCancelledModalWidget;
import 'package:flutter/material.dart';

class NewOrderCancelledModalModel
    extends FlutterFlowModel<NewOrderCancelledModalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for status component.
  late StatusModel statusModel;

  @override
  void initState(BuildContext context) {
    statusModel = createModel(context, () => StatusModel());
  }

  @override
  void dispose() {
    statusModel.dispose();
  }

  /// Action blocks.
  Future paymentToggle(BuildContext context) async {}
}
