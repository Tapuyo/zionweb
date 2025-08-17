import '/backend/supabase/supabase.dart';
import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dispatch_modal_widget.dart' show DispatchModalWidget;
import 'package:flutter/material.dart';

class DispatchModalModel extends FlutterFlowModel<DispatchModalWidget> {
  ///  Local state fields for this component.

  String? productName;

  String? productCode;

  int? productPrice;

  String? productImage;

  bool isThirdParty = false;

  WarehouseRow? selectedWarehouse;

  TruckRow? selectedTruck;

  UsersLogisticsViewRow? selectedLogistics;

  ThirdPartyCourierRow? selectedThirdParty;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in DispatchModal widget.
  List<OrdersRow>? orderQuery;
  // Stores action output result for [Backend Call - Query Rows] action in DispatchModal widget.
  List<TruckRow>? trucksQuery;
  // Stores action output result for [Backend Call - Query Rows] action in DispatchModal widget.
  List<ThirdPartyCourierRow>? thirdpartyQuery;
  // Stores action output result for [Backend Call - Query Rows] action in DispatchModal widget.
  List<WarehouseRow>? warehouseQuery;
  // Stores action output result for [Backend Call - Query Rows] action in DispatchModal widget.
  List<UsersLogisticsViewRow>? logisticsQuery;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DeliveryDate widget.
  FocusNode? deliveryDateFocusNode;
  TextEditingController? deliveryDateTextController;
  String? Function(BuildContext, String?)? deliveryDateTextControllerValidator;
  String? _deliveryDateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Select a date is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for Warehouse widget.
  FocusNode? warehouseFocusNode;
  TextEditingController? warehouseTextController;
  String? Function(BuildContext, String?)? warehouseTextControllerValidator;
  String? _warehouseTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Select Warehouse is required';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for Truck widget.
  FocusNode? truckFocusNode;
  TextEditingController? truckTextController;
  String? Function(BuildContext, String?)? truckTextControllerValidator;
  String? _truckTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Select Truck is required';
    }

    return null;
  }

  // State field(s) for Logistics widget.
  FocusNode? logisticsFocusNode;
  TextEditingController? logisticsTextController;
  String? Function(BuildContext, String?)? logisticsTextControllerValidator;
  String? _logisticsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Select Logistics is required';
    }

    return null;
  }

  // State field(s) for ThirdParty widget.
  FocusNode? thirdPartyFocusNode;
  TextEditingController? thirdPartyTextController;
  String? Function(BuildContext, String?)? thirdPartyTextControllerValidator;
  String? _thirdPartyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Select Third Party Delivery is required';
    }

    return null;
  }

  // State field(s) for remarks widget.
  FocusNode? remarksFocusNode;
  TextEditingController? remarksTextController;
  String? Function(BuildContext, String?)? remarksTextControllerValidator;
  String? _remarksTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Add some remarks is required';
    }

    return null;
  }

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
  // State field(s) for captureRemarka widget.
  FocusNode? captureRemarkaFocusNode;
  TextEditingController? captureRemarkaTextController;
  String? Function(BuildContext, String?)?
      captureRemarkaTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<OrdersRow>? orderUpdate;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  OrderHistoryRow? orderProductUpdate;

  @override
  void initState(BuildContext context) {
    deliveryDateTextControllerValidator = _deliveryDateTextControllerValidator;
    warehouseTextControllerValidator = _warehouseTextControllerValidator;
    truckTextControllerValidator = _truckTextControllerValidator;
    logisticsTextControllerValidator = _logisticsTextControllerValidator;
    thirdPartyTextControllerValidator = _thirdPartyTextControllerValidator;
    remarksTextControllerValidator = _remarksTextControllerValidator;
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
  }

  @override
  void dispose() {
    deliveryDateFocusNode?.dispose();
    deliveryDateTextController?.dispose();

    warehouseFocusNode?.dispose();
    warehouseTextController?.dispose();

    truckFocusNode?.dispose();
    truckTextController?.dispose();

    logisticsFocusNode?.dispose();
    logisticsTextController?.dispose();

    thirdPartyFocusNode?.dispose();
    thirdPartyTextController?.dispose();

    remarksFocusNode?.dispose();
    remarksTextController?.dispose();

    modalDetailsTitleComponentModel.dispose();
    modalDetailsComponentModel1.dispose();
    modalDetailsComponentModel2.dispose();
    modalDetailsComponentModel3.dispose();
    modalDetailsComponentModel4.dispose();
    modalDetailsComponentModel5.dispose();
    captureRemarkaFocusNode?.dispose();
    captureRemarkaTextController?.dispose();
  }
}
