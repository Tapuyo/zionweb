import '/components/side_nav_menus_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_nav_widget.dart' show SideNavWidget;
import 'package:flutter/material.dart';

class SideNavModel extends FlutterFlowModel<SideNavWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for sideNavMenus component.
  late SideNavMenusModel sideNavMenusModel1;
  // Model for sideNavMenus component.
  late SideNavMenusModel sideNavMenusModel2;
  // Model for sideNavMenus component.
  late SideNavMenusModel sideNavMenusModel3;
  // Model for sideNavMenus component.
  late SideNavMenusModel sideNavMenusModel4;
  // Model for sideNavMenus component.
  late SideNavMenusModel sideNavMenusModel5;
  // Model for sideNavMenus component.
  late SideNavMenusModel sideNavMenusModel6;

  @override
  void initState(BuildContext context) {
    sideNavMenusModel1 = createModel(context, () => SideNavMenusModel());
    sideNavMenusModel2 = createModel(context, () => SideNavMenusModel());
    sideNavMenusModel3 = createModel(context, () => SideNavMenusModel());
    sideNavMenusModel4 = createModel(context, () => SideNavMenusModel());
    sideNavMenusModel5 = createModel(context, () => SideNavMenusModel());
    sideNavMenusModel6 = createModel(context, () => SideNavMenusModel());
  }

  @override
  void dispose() {
    sideNavMenusModel1.dispose();
    sideNavMenusModel2.dispose();
    sideNavMenusModel3.dispose();
    sideNavMenusModel4.dispose();
    sideNavMenusModel5.dispose();
    sideNavMenusModel6.dispose();
  }
}
