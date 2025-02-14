import '/backend/supabase/supabase.dart';
import '/components/list_view_contauiner_weekly_schedule_widget.dart';
import '/components/weekly_schedule_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'restaurant_details_widget.dart' show RestaurantDetailsWidget;
import 'package:flutter/material.dart';

class RestaurantDetailsModel extends FlutterFlowModel<RestaurantDetailsWidget> {
  ///  Local state fields for this page.

  bool showWeekdays = false;

  bool trieRecent = true;

  bool showVideos = true;

  ///  State fields for stateful widgets in this page.

  // Model for listViewContauinerWeeklySchedule component.
  late ListViewContauinerWeeklyScheduleModel
      listViewContauinerWeeklyScheduleModel;
  // Model for WeeklySchedule component.
  late WeeklyScheduleModel weeklyScheduleModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for getRatingBar widget.
  double? getRatingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<RestaurantsRow>? liveDataRestau;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {
    listViewContauinerWeeklyScheduleModel =
        createModel(context, () => ListViewContauinerWeeklyScheduleModel());
    weeklyScheduleModel = createModel(context, () => WeeklyScheduleModel());
  }

  @override
  void dispose() {
    listViewContauinerWeeklyScheduleModel.dispose();
    weeklyScheduleModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
