import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for PrenomTextField widget.
  FocusNode? prenomTextFieldFocusNode;
  TextEditingController? prenomTextFieldTextController;
  String? Function(BuildContext, String?)?
      prenomTextFieldTextControllerValidator;
  String? _prenomTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Requis';
    }

    return null;
  }

  // State field(s) for NomTextField widget.
  FocusNode? nomTextFieldFocusNode;
  TextEditingController? nomTextFieldTextController;
  String? Function(BuildContext, String?)? nomTextFieldTextControllerValidator;
  String? _nomTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Requis';
    }

    return null;
  }

  // State field(s) for emailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    prenomTextFieldTextControllerValidator =
        _prenomTextFieldTextControllerValidator;
    nomTextFieldTextControllerValidator = _nomTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    prenomTextFieldFocusNode?.dispose();
    prenomTextFieldTextController?.dispose();

    nomTextFieldFocusNode?.dispose();
    nomTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();
  }
}
