import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'archive_product_modal_widget.dart' show ArchiveProductModalWidget;
import 'package:flutter/material.dart';

class ArchiveProductModalModel
    extends FlutterFlowModel<ArchiveProductModalWidget> {
  ///  Local state fields for this component.

  int? updateStep = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ProductsRow>? archiveProduct;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
