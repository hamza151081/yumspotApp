import '/flutter_flow/flutter_flow_util.dart';
import '/restau_details/back_button_component/back_button_component_widget.dart';
import 'upload_resturant_step_image_details_page_widget.dart'
    show UploadResturantStepImageDetailsPageWidget;
import 'package:flutter/material.dart';

class UploadResturantStepImageDetailsPageModel
    extends FlutterFlowModel<UploadResturantStepImageDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
