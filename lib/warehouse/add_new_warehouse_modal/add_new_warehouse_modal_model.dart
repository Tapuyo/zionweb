import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_warehouse_modal_widget.dart' show AddNewWarehouseModalWidget;
import 'package:flutter/material.dart';

class AddNewWarehouseModalModel
    extends FlutterFlowModel<AddNewWarehouseModalWidget> {
  ///  Local state fields for this component.

  int? step = 1;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for WarehouseName widget.
  FocusNode? warehouseNameFocusNode;
  TextEditingController? warehouseNameTextController;
  String? Function(BuildContext, String?)? warehouseNameTextControllerValidator;
  String? _warehouseNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Warehouse name is required.';
    }

    return null;
  }

  // State field(s) for WarehouseAddress widget.
  FocusNode? warehouseAddressFocusNode;
  TextEditingController? warehouseAddressTextController;
  String? Function(BuildContext, String?)?
      warehouseAddressTextControllerValidator;
  String? _warehouseAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Warehouse address is required.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  WarehouseRow? createdWarehouse;

  @override
  void initState(BuildContext context) {
    warehouseNameTextControllerValidator =
        _warehouseNameTextControllerValidator;
    warehouseAddressTextControllerValidator =
        _warehouseAddressTextControllerValidator;
  }

  @override
  void dispose() {
    warehouseNameFocusNode?.dispose();
    warehouseNameTextController?.dispose();

    warehouseAddressFocusNode?.dispose();
    warehouseAddressTextController?.dispose();
  }
}
