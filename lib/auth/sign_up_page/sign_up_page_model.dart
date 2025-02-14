import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode1;
  TextEditingController? nameTextFieldTextController1;
  String? Function(BuildContext, String?)?
      nameTextFieldTextController1Validator;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode2;
  TextEditingController? nameTextFieldTextController2;
  String? Function(BuildContext, String?)?
      nameTextFieldTextController2Validator;
  // State field(s) for EmailTextField widget.
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
  // State field(s) for ConfirmPswrdTextField widget.
  FocusNode? confirmPswrdTextFieldFocusNode;
  TextEditingController? confirmPswrdTextFieldTextController;
  late bool confirmPswrdTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPswrdTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    pswrdTextFieldVisibility = false;
    confirmPswrdTextFieldVisibility = false;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode1?.dispose();
    nameTextFieldTextController1?.dispose();

    nameTextFieldFocusNode2?.dispose();
    nameTextFieldTextController2?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    pswrdTextFieldFocusNode?.dispose();
    pswrdTextFieldTextController?.dispose();

    confirmPswrdTextFieldFocusNode?.dispose();
    confirmPswrdTextFieldTextController?.dispose();
  }
}
