import '/components/login_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Login component.
  late LoginModel loginModel;

  @override
  void initState(BuildContext context) {
    loginModel = createModel(context, () => LoginModel());
  }

  @override
  void dispose() {
    loginModel.dispose();
  }
}
