import '/flutter_flow/flutter_flow_util.dart';
import '/restau_details/back_button_component/back_button_component_widget.dart';
import 'connect_with_tiktok_setp_details_page_widget.dart'
    show ConnectWithTiktokSetpDetailsPageWidget;
import 'package:flutter/material.dart';

class ConnectWithTiktokSetpDetailsPageModel
    extends FlutterFlowModel<ConnectWithTiktokSetpDetailsPageWidget> {
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
