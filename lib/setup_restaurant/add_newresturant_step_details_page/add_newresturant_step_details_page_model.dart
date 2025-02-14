import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/restau_details/back_button_component/back_button_component_widget.dart';
import 'add_newresturant_step_details_page_widget.dart'
    show AddNewresturantStepDetailsPageWidget;
import 'package:flutter/material.dart';

class AddNewresturantStepDetailsPageModel
    extends FlutterFlowModel<AddNewresturantStepDetailsPageWidget> {
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
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

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
  }
}
