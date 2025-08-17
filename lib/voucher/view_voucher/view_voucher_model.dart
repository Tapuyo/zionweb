import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_voucher_widget.dart' show ViewVoucherWidget;
import 'package:flutter/material.dart';

class ViewVoucherModel extends FlutterFlowModel<ViewVoucherWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel1;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel2;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel3;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel4;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel5;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel6;

  @override
  void initState(BuildContext context) {
    modalDetailsTitleComponentModel =
        createModel(context, () => ModalDetailsTitleComponentModel());
    modalDetailsComponentModel1 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel2 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel3 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel4 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel5 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel6 =
        createModel(context, () => ModalDetailsComponentModel());
  }

  @override
  void dispose() {
    modalDetailsTitleComponentModel.dispose();
    modalDetailsComponentModel1.dispose();
    modalDetailsComponentModel2.dispose();
    modalDetailsComponentModel3.dispose();
    modalDetailsComponentModel4.dispose();
    modalDetailsComponentModel5.dispose();
    modalDetailsComponentModel6.dispose();
  }
}
