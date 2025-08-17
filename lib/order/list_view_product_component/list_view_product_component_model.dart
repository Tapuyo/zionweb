import '/flutter_flow/flutter_flow_util.dart';
import '/order/list_item_product/list_item_product_widget.dart';
import 'list_view_product_component_widget.dart'
    show ListViewProductComponentWidget;
import 'package:flutter/material.dart';

class ListViewProductComponentModel
    extends FlutterFlowModel<ListViewProductComponentWidget> {
  ///  Local state fields for this component.

  bool isHovered = false;

  ///  State fields for stateful widgets in this component.

  // Models for listItemProduct dynamic component.
  late FlutterFlowDynamicModels<ListItemProductModel> listItemProductModels;

  @override
  void initState(BuildContext context) {
    listItemProductModels =
        FlutterFlowDynamicModels(() => ListItemProductModel());
  }

  @override
  void dispose() {
    listItemProductModels.dispose();
  }
}
