import '/calendar/list_item_third_party/list_item_third_party_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_view_third_party_component_widget.dart'
    show ListViewThirdPartyComponentWidget;
import 'package:flutter/material.dart';

class ListViewThirdPartyComponentModel
    extends FlutterFlowModel<ListViewThirdPartyComponentWidget> {
  ///  Local state fields for this component.

  bool isHovered = false;

  ///  State fields for stateful widgets in this component.

  // Models for listItemThirdParty dynamic component.
  late FlutterFlowDynamicModels<ListItemThirdPartyModel>
      listItemThirdPartyModels;

  @override
  void initState(BuildContext context) {
    listItemThirdPartyModels =
        FlutterFlowDynamicModels(() => ListItemThirdPartyModel());
  }

  @override
  void dispose() {
    listItemThirdPartyModels.dispose();
  }
}
