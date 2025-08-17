import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delete_warehouse_modal_widget.dart' show DeleteWarehouseModalWidget;
import 'package:flutter/material.dart';

class DeleteWarehouseModalModel
    extends FlutterFlowModel<DeleteWarehouseModalWidget> {
  ///  Local state fields for this component.

  int? updateStep = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<WarehouseRow>? archiveWarehouse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
