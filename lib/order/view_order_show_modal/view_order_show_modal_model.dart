import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/calendar/modal_main_details700_component/modal_main_details700_component_widget.dart';
import '/components/status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'view_order_show_modal_widget.dart' show ViewOrderShowModalWidget;
import 'package:flutter/material.dart';

class ViewOrderShowModalModel
    extends FlutterFlowModel<ViewOrderShowModalWidget> {
  ///  Local state fields for this component.

  String? productName;

  String? productCode;

  int? productPrice;

  String? productImage;

  OrdersRow? order;

  CustomerRow? customer;

  double? subtotal;

  double total = 0.0;

  bool isCancel = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in ViewOrderShowModal widget.
  List<OrdersRow>? orderQuery;
  // Stores action output result for [Backend Call - Query Rows] action in ViewOrderShowModal widget.
  List<CustomerRow>? customerQuery;
  // Stores action output result for [Backend Call - API (getOrderSubtotal)] action in ViewOrderShowModal widget.
  ApiCallResponse? apiResultkkj;
  // Model for status component.
  late StatusModel statusModel;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel1;
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
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel7;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel8;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel9;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel2;
  // Model for modalMainDetails700Component component.
  late ModalMainDetails700ComponentModel modalMainDetails700ComponentModel1;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel3;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel10;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel11;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel12;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel13;
  // Model for modalMainDetails700Component component.
  late ModalMainDetails700ComponentModel modalMainDetails700ComponentModel2;
  // State field(s) for DropDownRemarks widget.
  String? dropDownRemarksValue;
  FormFieldController<String>? dropDownRemarksValueController;

  @override
  void initState(BuildContext context) {
    statusModel = createModel(context, () => StatusModel());
    modalDetailsTitleComponentModel1 =
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
    modalDetailsComponentModel7 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel8 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel9 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsTitleComponentModel2 =
        createModel(context, () => ModalDetailsTitleComponentModel());
    modalMainDetails700ComponentModel1 =
        createModel(context, () => ModalMainDetails700ComponentModel());
    modalDetailsTitleComponentModel3 =
        createModel(context, () => ModalDetailsTitleComponentModel());
    modalDetailsComponentModel10 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel11 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel12 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel13 =
        createModel(context, () => ModalDetailsComponentModel());
    modalMainDetails700ComponentModel2 =
        createModel(context, () => ModalMainDetails700ComponentModel());
  }

  @override
  void dispose() {
    statusModel.dispose();
    modalDetailsTitleComponentModel1.dispose();
    modalDetailsComponentModel1.dispose();
    modalDetailsComponentModel2.dispose();
    modalDetailsComponentModel3.dispose();
    modalDetailsComponentModel4.dispose();
    modalDetailsComponentModel5.dispose();
    modalDetailsComponentModel6.dispose();
    modalDetailsComponentModel7.dispose();
    modalDetailsComponentModel8.dispose();
    modalDetailsComponentModel9.dispose();
    modalDetailsTitleComponentModel2.dispose();
    modalMainDetails700ComponentModel1.dispose();
    modalDetailsTitleComponentModel3.dispose();
    modalDetailsComponentModel10.dispose();
    modalDetailsComponentModel11.dispose();
    modalDetailsComponentModel12.dispose();
    modalDetailsComponentModel13.dispose();
    modalMainDetails700ComponentModel2.dispose();
  }
}
