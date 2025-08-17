import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'restore_warehouse_modal_widget.dart' show RestoreWarehouseModalWidget;
import 'package:flutter/material.dart';

class RestoreWarehouseModalModel
    extends FlutterFlowModel<RestoreWarehouseModalWidget> {
  ///  Local state fields for this component.

  int? updateStep = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<WarehouseRow>? restoredWarehouse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
