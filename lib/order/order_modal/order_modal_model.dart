import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/calendar/modal_details_component/modal_details_component_widget.dart';
import '/calendar/modal_details_title_component/modal_details_title_component_widget.dart';
import '/calendar/modal_main_details700_component/modal_main_details700_component_widget.dart';
import '/components/order_breakdown_component_widget.dart';
import '/components/status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/order/wizard/wizard_widget.dart';
import 'order_modal_widget.dart' show OrderModalWidget;
import 'package:flutter/material.dart';

class OrderModalModel extends FlutterFlowModel<OrderModalWidget> {
  ///  Local state fields for this component.

  String? productName;

  String? productCode;

  int? productPrice;

  String? productImage;

  bool isThirdParty = false;

  int pageIndex = 0;

  bool paymentXdeal = false;

  bool paymentYes = false;

  bool paymentNo = false;

  bool paymentPartial = false;

  bool paymentFull = false;

  /// list of all the ordered products
  List<OrderProductsStruct> orderProduct = [];
  void addToOrderProduct(OrderProductsStruct item) => orderProduct.add(item);
  void removeFromOrderProduct(OrderProductsStruct item) =>
      orderProduct.remove(item);
  void removeAtIndexFromOrderProduct(int index) => orderProduct.removeAt(index);
  void insertAtIndexInOrderProduct(int index, OrderProductsStruct item) =>
      orderProduct.insert(index, item);
  void updateOrderProductAtIndex(
          int index, Function(OrderProductsStruct) updateFn) =>
      orderProduct[index] = updateFn(orderProduct[index]);

  int? subtotal = 0;

  int? currentId;

  bool isExisting = false;

  List<OrderProductsStruct> updatedOrderProduct = [];
  void addToUpdatedOrderProduct(OrderProductsStruct item) =>
      updatedOrderProduct.add(item);
  void removeFromUpdatedOrderProduct(OrderProductsStruct item) =>
      updatedOrderProduct.remove(item);
  void removeAtIndexFromUpdatedOrderProduct(int index) =>
      updatedOrderProduct.removeAt(index);
  void insertAtIndexInUpdatedOrderProduct(
          int index, OrderProductsStruct item) =>
      updatedOrderProduct.insert(index, item);
  void updateUpdatedOrderProductAtIndex(
          int index, Function(OrderProductsStruct) updateFn) =>
      updatedOrderProduct[index] = updateFn(updatedOrderProduct[index]);

  int computePrice = 0;

  int? shippingFee = 0;

  DateTime? birthdate;

  int? paymentId;

  String orderCode = 'ZIONDEFAULT';

  int latestId = 1;

  int? userId;

  double? offAmount = 0.0;

  bool isShippingFree = false;

  int? voucherId = 0;

  int? voucherCounts = 0;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in OrderModal widget.
  List<LatestOrderCodeViewRow>? getLatestId;
  // Stores action output result for [Backend Call - Query Rows] action in OrderModal widget.
  List<OrdersRow>? resRowUpdateOrder;
  // Stores action output result for [Backend Call - Query Rows] action in OrderModal widget.
  List<CustomerRow>? customerUpdateRes;
  // Stores action output result for [Backend Call - Query Rows] action in OrderModal widget.
  List<OrderProductsRow>? orderProdResult;
  // Stores action output result for [Backend Call - Query Rows] action in OrderModal widget.
  List<ProductsRow>? prodDetails;
  // Model for status component.
  late StatusModel statusModel;
  // Model for Wizard component.
  late WizardModel wizardModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    if (val.length > 24) {
      return 'Maximum 24 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    if (val.length > 16) {
      return 'Maximum 16 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for contact widget.
  FocusNode? contactFocusNode;
  TextEditingController? contactTextController;
  String? Function(BuildContext, String?)? contactTextControllerValidator;
  String? _contactTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid email format. Please enter a valid email.';
    }
    return null;
  }

  // State field(s) for company widget.
  FocusNode? companyFocusNode;
  TextEditingController? companyTextController;
  String? Function(BuildContext, String?)? companyTextControllerValidator;
  // State field(s) for birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateTextController;
  String? Function(BuildContext, String?)? birthdateTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for userAddress widget.
  FocusNode? userAddressFocusNode;
  TextEditingController? userAddressTextController;
  String? Function(BuildContext, String?)? userAddressTextControllerValidator;
  String? _userAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required.';
    }

    return null;
  }

  // State field(s) for landmark widget.
  FocusNode? landmarkFocusNode;
  TextEditingController? landmarkTextController;
  String? Function(BuildContext, String?)? landmarkTextControllerValidator;
  // State field(s) for zipCode widget.
  FocusNode? zipCodeFocusNode;
  TextEditingController? zipCodeTextController;
  String? Function(BuildContext, String?)? zipCodeTextControllerValidator;
  // State field(s) for products widget.
  FocusNode? productsFocusNode;
  TextEditingController? productsTextController;
  String? Function(BuildContext, String?)? productsTextControllerValidator;
  // State field(s) for voucherCode widget.
  FocusNode? voucherCodeFocusNode;
  TextEditingController? voucherCodeTextController;
  String? Function(BuildContext, String?)? voucherCodeTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<VouchersRow>? voucherResult;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for deliveryAddress widget.
  FocusNode? deliveryAddressFocusNode;
  TextEditingController? deliveryAddressTextController;
  String? Function(BuildContext, String?)?
      deliveryAddressTextControllerValidator;
  String? _deliveryAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter delivery address is required';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for contactNumber widget.
  FocusNode? contactNumberFocusNode;
  TextEditingController? contactNumberTextController;
  String? Function(BuildContext, String?)? contactNumberTextControllerValidator;
  String? _contactNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter contact number is required';
    }

    return null;
  }

  // State field(s) for paymentMethod widget.
  FocusNode? paymentMethodFocusNode;
  TextEditingController? paymentMethodTextController;
  String? Function(BuildContext, String?)? paymentMethodTextControllerValidator;
  // State field(s) for paymentTerms widget.
  FocusNode? paymentTermsFocusNode;
  TextEditingController? paymentTermsTextController;
  String? Function(BuildContext, String?)? paymentTermsTextControllerValidator;
  // State field(s) for referenceNumber widget.
  FocusNode? referenceNumberFocusNode;
  TextEditingController? referenceNumberTextController;
  String? Function(BuildContext, String?)?
      referenceNumberTextControllerValidator;
  // State field(s) for shippingFee widget.
  FocusNode? shippingFeeFocusNode;
  TextEditingController? shippingFeeTextController;
  String? Function(BuildContext, String?)? shippingFeeTextControllerValidator;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel1;
  // Models for orderBreakdownComponent dynamic component.
  late FlutterFlowDynamicModels<OrderBreakdownComponentModel>
      orderBreakdownComponentModels;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel1;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel2;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel2;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel3;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel4;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel5;
  // Model for modalMainDetails700Component component.
  late ModalMainDetails700ComponentModel modalMainDetails700ComponentModel1;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? orderFormOutput;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel3;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel6;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel7;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel8;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel9;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel10;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel11;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel12;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel13;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel14;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel15;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel16;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel17;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel4;
  // Model for modalMainDetails700Component component.
  late ModalMainDetails700ComponentModel modalMainDetails700ComponentModel2;
  // Model for modalDetailsTitleComponent component.
  late ModalDetailsTitleComponentModel modalDetailsTitleComponentModel5;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel18;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel19;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel20;
  // Model for modalDetailsComponent component.
  late ModalDetailsComponentModel modalDetailsComponentModel21;
  // Model for modalMainDetails700Component component.
  late ModalMainDetails700ComponentModel modalMainDetails700ComponentModel3;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CustomerRow? clientInsertDraftOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  OrdersRow? orderInsertDraftsOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CustomerRow? clientInsertOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  OrdersRow? orderInsertOutput;

  @override
  void initState(BuildContext context) {
    statusModel = createModel(context, () => StatusModel());
    wizardModel = createModel(context, () => WizardModel());
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    contactTextControllerValidator = _contactTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    userAddressTextControllerValidator = _userAddressTextControllerValidator;
    deliveryAddressTextControllerValidator =
        _deliveryAddressTextControllerValidator;
    contactNumberTextControllerValidator =
        _contactNumberTextControllerValidator;
    modalDetailsTitleComponentModel1 =
        createModel(context, () => ModalDetailsTitleComponentModel());
    orderBreakdownComponentModels =
        FlutterFlowDynamicModels(() => OrderBreakdownComponentModel());
    modalDetailsComponentModel1 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsTitleComponentModel2 =
        createModel(context, () => ModalDetailsTitleComponentModel());
    modalDetailsComponentModel2 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel3 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel4 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel5 =
        createModel(context, () => ModalDetailsComponentModel());
    modalMainDetails700ComponentModel1 =
        createModel(context, () => ModalMainDetails700ComponentModel());
    modalDetailsTitleComponentModel3 =
        createModel(context, () => ModalDetailsTitleComponentModel());
    modalDetailsComponentModel6 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel7 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel8 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel9 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel10 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel11 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel12 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel13 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel14 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel15 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel16 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel17 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsTitleComponentModel4 =
        createModel(context, () => ModalDetailsTitleComponentModel());
    modalMainDetails700ComponentModel2 =
        createModel(context, () => ModalMainDetails700ComponentModel());
    modalDetailsTitleComponentModel5 =
        createModel(context, () => ModalDetailsTitleComponentModel());
    modalDetailsComponentModel18 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel19 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel20 =
        createModel(context, () => ModalDetailsComponentModel());
    modalDetailsComponentModel21 =
        createModel(context, () => ModalDetailsComponentModel());
    modalMainDetails700ComponentModel3 =
        createModel(context, () => ModalMainDetails700ComponentModel());
  }

  @override
  void dispose() {
    statusModel.dispose();
    wizardModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    contactFocusNode?.dispose();
    contactTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    companyFocusNode?.dispose();
    companyTextController?.dispose();

    birthdateFocusNode?.dispose();
    birthdateTextController?.dispose();

    userAddressFocusNode?.dispose();
    userAddressTextController?.dispose();

    landmarkFocusNode?.dispose();
    landmarkTextController?.dispose();

    zipCodeFocusNode?.dispose();
    zipCodeTextController?.dispose();

    productsFocusNode?.dispose();
    productsTextController?.dispose();

    voucherCodeFocusNode?.dispose();
    voucherCodeTextController?.dispose();

    deliveryAddressFocusNode?.dispose();
    deliveryAddressTextController?.dispose();

    contactNumberFocusNode?.dispose();
    contactNumberTextController?.dispose();

    paymentMethodFocusNode?.dispose();
    paymentMethodTextController?.dispose();

    paymentTermsFocusNode?.dispose();
    paymentTermsTextController?.dispose();

    referenceNumberFocusNode?.dispose();
    referenceNumberTextController?.dispose();

    shippingFeeFocusNode?.dispose();
    shippingFeeTextController?.dispose();

    modalDetailsTitleComponentModel1.dispose();
    orderBreakdownComponentModels.dispose();
    modalDetailsComponentModel1.dispose();
    modalDetailsTitleComponentModel2.dispose();
    modalDetailsComponentModel2.dispose();
    modalDetailsComponentModel3.dispose();
    modalDetailsComponentModel4.dispose();
    modalDetailsComponentModel5.dispose();
    modalMainDetails700ComponentModel1.dispose();
    modalDetailsTitleComponentModel3.dispose();
    modalDetailsComponentModel6.dispose();
    modalDetailsComponentModel7.dispose();
    modalDetailsComponentModel8.dispose();
    modalDetailsComponentModel9.dispose();
    modalDetailsComponentModel10.dispose();
    modalDetailsComponentModel11.dispose();
    modalDetailsComponentModel12.dispose();
    modalDetailsComponentModel13.dispose();
    modalDetailsComponentModel14.dispose();
    modalDetailsComponentModel15.dispose();
    modalDetailsComponentModel16.dispose();
    modalDetailsComponentModel17.dispose();
    modalDetailsTitleComponentModel4.dispose();
    modalMainDetails700ComponentModel2.dispose();
    modalDetailsTitleComponentModel5.dispose();
    modalDetailsComponentModel18.dispose();
    modalDetailsComponentModel19.dispose();
    modalDetailsComponentModel20.dispose();
    modalDetailsComponentModel21.dispose();
    modalMainDetails700ComponentModel3.dispose();
  }
}
