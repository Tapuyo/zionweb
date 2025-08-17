import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/side_nav/side_nav_widget.dart';
import 'ims_page_widget.dart' show ImsPageWidget;
import 'package:flutter/material.dart';

class ImsPageModel extends FlutterFlowModel<ImsPageWidget> {
  ///  Local state fields for this page.

  List<ProductsRow> productList = [];
  void addToProductList(ProductsRow item) => productList.add(item);
  void removeFromProductList(ProductsRow item) => productList.remove(item);
  void removeAtIndexFromProductList(int index) => productList.removeAt(index);
  void insertAtIndexInProductList(int index, ProductsRow item) =>
      productList.insert(index, item);
  void updateProductListAtIndex(int index, Function(ProductsRow) updateFn) =>
      productList[index] = updateFn(productList[index]);

  bool? isArchived;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ImsPage widget.
  List<ProductsRow>? productsInitList;
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Query Rows] action in Tab widget.
  List<ProductsRow>? productActiveList;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<ProductsRow>();
  // Stores action output result for [Backend Call - Query Rows] action in Tab widget.
  List<ProductsRow>? productArchiveList;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ProductsRow>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in TextField widget.
  List<ProductsRow>? searchProduct;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    tabBarController?.dispose();
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
