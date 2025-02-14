import '/flutter_flow/flutter_flow_util.dart';
import '/restau_details/back_button_component/back_button_component_widget.dart';
import 'add_newr_name_step_details_page_widget.dart'
    show AddNewrNameStepDetailsPageWidget;
import 'package:flutter/material.dart';

class AddNewrNameStepDetailsPageModel
    extends FlutterFlowModel<AddNewrNameStepDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for backButtonComponent component.
  late BackButtonComponentModel backButtonComponentModel;
  // State field(s) for RestaurantNameTextField widget.
  FocusNode? restaurantNameTextFieldFocusNode1;
  TextEditingController? restaurantNameTextFieldTextController1;
  String? Function(BuildContext, String?)?
      restaurantNameTextFieldTextController1Validator;
  // State field(s) for RestaurantNameTextField widget.
  FocusNode? restaurantNameTextFieldFocusNode2;
  TextEditingController? restaurantNameTextFieldTextController2;
  String? Function(BuildContext, String?)?
      restaurantNameTextFieldTextController2Validator;
  // State field(s) for RestaurantNameTextField widget.
  FocusNode? restaurantNameTextFieldFocusNode3;
  TextEditingController? restaurantNameTextFieldTextController3;
  String? Function(BuildContext, String?)?
      restaurantNameTextFieldTextController3Validator;

  @override
  void initState(BuildContext context) {
    backButtonComponentModel =
        createModel(context, () => BackButtonComponentModel());
  }

  @override
  void dispose() {
    backButtonComponentModel.dispose();
    restaurantNameTextFieldFocusNode1?.dispose();
    restaurantNameTextFieldTextController1?.dispose();

    restaurantNameTextFieldFocusNode2?.dispose();
    restaurantNameTextFieldTextController2?.dispose();

    restaurantNameTextFieldFocusNode3?.dispose();
    restaurantNameTextFieldTextController3?.dispose();
  }
}
