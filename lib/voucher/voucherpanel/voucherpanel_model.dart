import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'voucherpanel_widget.dart' show VoucherpanelWidget;
import 'package:flutter/material.dart';

class VoucherpanelModel extends FlutterFlowModel<VoucherpanelWidget> {
  ///  Local state fields for this component.

  List<VouchersRow> voucherList = [];
  void addToVoucherList(VouchersRow item) => voucherList.add(item);
  void removeFromVoucherList(VouchersRow item) => voucherList.remove(item);
  void removeAtIndexFromVoucherList(int index) => voucherList.removeAt(index);
  void insertAtIndexInVoucherList(int index, VouchersRow item) =>
      voucherList.insert(index, item);
  void updateVoucherListAtIndex(int index, Function(VouchersRow) updateFn) =>
      voucherList[index] = updateFn(voucherList[index]);

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Voucherpanel widget.
  List<VouchersRow>? vouchersResult;
  // State field(s) for DateRanger widget.
  FormFieldController<List<String>>? dateRangerValueController;
  String? get dateRangerValue => dateRangerValueController?.value?.firstOrNull;
  set dateRangerValue(String? val) =>
      dateRangerValueController?.value = val != null ? [val] : [];
  // State field(s) for Statuses widget.
  FormFieldController<List<String>>? statusesValueController;
  String? get statusesValue => statusesValueController?.value?.firstOrNull;
  set statusesValue(String? val) =>
      statusesValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<VouchersRow>();
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<VouchersRow>? resv;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<VouchersRow>? resdelete;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<VouchersRow>? resact;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
  }

  /// Action blocks.
  Future filterVoucher(
    BuildContext context, {
    required String? filter,
  }) async {
    List<VouchersRow>? voucherResult;
    List<VouchersRow>? voucherResult1;
    List<VouchersRow>? voucherResult2;
    List<VouchersRow>? voucherResult3;
    List<VouchersRow>? voucherResult4;

    if (filter == 'All') {
      voucherResult = await VouchersTable().queryRows(
        queryFn: (q) => q,
      );
      voucherList = voucherResult.toList().cast<VouchersRow>();
    } else if (filter == 'Active') {
      voucherResult1 = await VouchersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'active',
          true,
        ),
      );
      voucherList = voucherResult1.toList().cast<VouchersRow>();
    } else if (filter == 'Archive') {
      voucherResult2 = await VouchersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'active',
          false,
        ),
      );
      voucherList = voucherResult2.toList().cast<VouchersRow>();
    } else if (filter == 'Expired') {
      voucherResult3 = await VouchersTable().queryRows(
        queryFn: (q) => q.ltOrNull(
          'expiry',
          supaSerialize<DateTime>(getCurrentTimestamp),
        ),
      );
      voucherList = voucherResult3.toList().cast<VouchersRow>();
    } else {
      voucherResult4 = await VouchersTable().queryRows(
        queryFn: (q) => q,
      );
      voucherList = voucherResult4.toList().cast<VouchersRow>();
    }
  }
}
