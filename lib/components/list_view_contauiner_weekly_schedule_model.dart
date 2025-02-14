import '/components/weekly_schedule_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_view_contauiner_weekly_schedule_widget.dart'
    show ListViewContauinerWeeklyScheduleWidget;
import 'package:flutter/material.dart';

class ListViewContauinerWeeklyScheduleModel
    extends FlutterFlowModel<ListViewContauinerWeeklyScheduleWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for WeeklySchedule dynamic component.
  late FlutterFlowDynamicModels<WeeklyScheduleModel> weeklyScheduleModels;

  @override
  void initState(BuildContext context) {
    weeklyScheduleModels =
        FlutterFlowDynamicModels(() => WeeklyScheduleModel());
  }

  @override
  void dispose() {
    weeklyScheduleModels.dispose();
  }
}
