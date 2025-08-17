import '/calendar/list_item_truck/list_item_truck_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_view_truck_component_widget.dart'
    show ListViewTruckComponentWidget;
import 'package:flutter/material.dart';

class ListViewTruckComponentModel
    extends FlutterFlowModel<ListViewTruckComponentWidget> {
  ///  Local state fields for this component.

  bool isHovered = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for listItemTruck dynamic component.
  late FlutterFlowDynamicModels<ListItemTruckModel> listItemTruckModels1;
  // Models for listItemTruck dynamic component.
  late FlutterFlowDynamicModels<ListItemTruckModel> listItemTruckModels2;

  @override
  void initState(BuildContext context) {
    listItemTruckModels1 = FlutterFlowDynamicModels(() => ListItemTruckModel());
    listItemTruckModels2 = FlutterFlowDynamicModels(() => ListItemTruckModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    listItemTruckModels1.dispose();
    listItemTruckModels2.dispose();
  }
}
