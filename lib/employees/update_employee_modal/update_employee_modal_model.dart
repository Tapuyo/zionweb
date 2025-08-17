import '/backend/supabase/supabase.dart';
import '/components/roles_widget.dart';
import '/employees/employee_basic_detail/employee_basic_detail_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_employee_modal_widget.dart' show UpdateEmployeeModalWidget;
import 'package:flutter/material.dart';

class UpdateEmployeeModalModel
    extends FlutterFlowModel<UpdateEmployeeModalWidget> {
  ///  Local state fields for this component.

  String? employeeImage;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for roles component.
  late RolesModel rolesModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading_uploadDataPwm = false;
  FFUploadedFile uploadedLocalFile_uploadDataPwm =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataPwm = '';

  // State field(s) for FirstName widget.
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

  // State field(s) for LastName widget.
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

  // State field(s) for Email widget.
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

  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  // State field(s) for DropDownRole widget.
  int? dropDownRoleValue;
  FormFieldController<int>? dropDownRoleValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? employeeInfoValidated;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? updatedEmployeeDetail;
  // Model for EmployeeBasicDetail component.
  late EmployeeBasicDetailModel employeeBasicDetailModel;

  @override
  void initState(BuildContext context) {
    rolesModel = createModel(context, () => RolesModel());
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    employeeBasicDetailModel =
        createModel(context, () => EmployeeBasicDetailModel());
  }

  @override
  void dispose() {
    rolesModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    employeeBasicDetailModel.dispose();
  }
}
