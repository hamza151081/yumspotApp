import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - createAppsFlyerLink] action in LoginPage widget.
  String? shortLink;
  // State field(s) for emailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for PswrdTextField widget.
  FocusNode? pswrdTextFieldFocusNode;
  TextEditingController? pswrdTextFieldTextController;
  late bool pswrdTextFieldVisibility;
  String? Function(BuildContext, String?)?
      pswrdTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    pswrdTextFieldVisibility = false;
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    pswrdTextFieldFocusNode?.dispose();
    pswrdTextFieldTextController?.dispose();
  }
}
