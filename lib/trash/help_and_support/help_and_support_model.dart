import '/flutter_flow/flutter_flow_util.dart';
import '/restau_details/back_button_component/back_button_component_widget.dart';
import '/trash/frequently_asked_question_component/frequently_asked_question_component_widget.dart';
import 'help_and_support_widget.dart' show HelpAndSupportWidget;
import 'package:flutter/material.dart';

class HelpAndSupportModel extends FlutterFlowModel<HelpAndSupportWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for backButtonComponent component.
  late BackButtonComponentModel backButtonComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for FrequentlyAskedQuestionComponent component.
  late FrequentlyAskedQuestionComponentModel
      frequentlyAskedQuestionComponentModel;

  @override
  void initState(BuildContext context) {
    backButtonComponentModel =
        createModel(context, () => BackButtonComponentModel());
    frequentlyAskedQuestionComponentModel =
        createModel(context, () => FrequentlyAskedQuestionComponentModel());
  }

  @override
  void dispose() {
    backButtonComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    frequentlyAskedQuestionComponentModel.dispose();
  }
}
