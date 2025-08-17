import '/calendar/list_item_warehouse/list_item_warehouse_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_view_warehouse_component_widget.dart'
    show ListViewWarehouseComponentWidget;
import 'package:flutter/material.dart';

class ListViewWarehouseComponentModel
    extends FlutterFlowModel<ListViewWarehouseComponentWidget> {
  ///  Local state fields for this component.

  bool isHovered = false;

  ///  State fields for stateful widgets in this component.

  // Models for listItemWarehouse dynamic component.
  late FlutterFlowDynamicModels<ListItemWarehouseModel> listItemWarehouseModels;

  @override
  void initState(BuildContext context) {
    listItemWarehouseModels =
        FlutterFlowDynamicModels(() => ListItemWarehouseModel());
  }

  @override
  void dispose() {
    listItemWarehouseModels.dispose();
  }
}
