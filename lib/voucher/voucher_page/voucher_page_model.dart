import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/side_nav/side_nav_widget.dart';
import '/voucher/voucherpanel/voucherpanel_widget.dart';
import 'voucher_page_widget.dart' show VoucherPageWidget;
import 'package:flutter/material.dart';

class VoucherPageModel extends FlutterFlowModel<VoucherPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // Model for Voucherpanel component.
  late VoucherpanelModel voucherpanelModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    voucherpanelModel = createModel(context, () => VoucherpanelModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    voucherpanelModel.dispose();
  }
}
