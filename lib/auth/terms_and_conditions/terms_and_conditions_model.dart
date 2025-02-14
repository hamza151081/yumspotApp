import '/flutter_flow/flutter_flow_util.dart';
import '/restau_details/back_button_component/back_button_component_widget.dart';
import 'terms_and_conditions_widget.dart' show TermsAndConditionsWidget;
import 'package:flutter/material.dart';

class TermsAndConditionsModel
    extends FlutterFlowModel<TermsAndConditionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for backButtonComponent component.
  late BackButtonComponentModel backButtonComponentModel;

  @override
  void initState(BuildContext context) {
    backButtonComponentModel =
        createModel(context, () => BackButtonComponentModel());
  }

  @override
  void dispose() {
    backButtonComponentModel.dispose();
  }
}
