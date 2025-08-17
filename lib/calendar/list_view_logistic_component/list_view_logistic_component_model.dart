import '/calendar/list_item_logisitic/list_item_logisitic_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_view_logistic_component_widget.dart'
    show ListViewLogisticComponentWidget;
import 'package:flutter/material.dart';

class ListViewLogisticComponentModel
    extends FlutterFlowModel<ListViewLogisticComponentWidget> {
  ///  Local state fields for this component.

  bool isHovered = false;

  ///  State fields for stateful widgets in this component.

  // Models for listItemLogisitic dynamic component.
  late FlutterFlowDynamicModels<ListItemLogisiticModel> listItemLogisiticModels;

  @override
  void initState(BuildContext context) {
    listItemLogisiticModels =
        FlutterFlowDynamicModels(() => ListItemLogisiticModel());
  }

  @override
  void dispose() {
    listItemLogisiticModels.dispose();
  }
}
