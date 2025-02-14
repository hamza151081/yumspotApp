import '/flutter_flow/flutter_flow_util.dart';
import 'comment_widget.dart' show CommentWidget;
import 'package:flutter/material.dart';

class CommentModel extends FlutterFlowModel<CommentWidget> {
  ///  Local state fields for this component.

  bool updating = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for commentTextField widget.
  FocusNode? commentTextFieldFocusNode;
  TextEditingController? commentTextFieldTextController;
  String? Function(BuildContext, String?)?
      commentTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentTextFieldFocusNode?.dispose();
    commentTextFieldTextController?.dispose();
  }
}
