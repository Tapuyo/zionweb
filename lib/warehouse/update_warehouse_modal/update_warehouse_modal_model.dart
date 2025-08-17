import '/flutter_flow/flutter_flow_util.dart';
import 'update_warehouse_modal_widget.dart' show UpdateWarehouseModalWidget;
import 'package:flutter/material.dart';

class UpdateWarehouseModalModel
    extends FlutterFlowModel<UpdateWarehouseModalWidget> {
  ///  Local state fields for this component.

  int? updateStep = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for WarehouseName widget.
  FocusNode? warehouseNameFocusNode;
  TextEditingController? warehouseNameTextController;
  String? Function(BuildContext, String?)? warehouseNameTextControllerValidator;
  // State field(s) for WarehouseAddress widget.
  FocusNode? warehouseAddressFocusNode;
  TextEditingController? warehouseAddressTextController;
  String? Function(BuildContext, String?)?
      warehouseAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    warehouseNameFocusNode?.dispose();
    warehouseNameTextController?.dispose();

    warehouseAddressFocusNode?.dispose();
    warehouseAddressTextController?.dispose();
  }
}
