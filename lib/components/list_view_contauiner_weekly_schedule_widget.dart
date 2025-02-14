import '/components/weekly_schedule_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'list_view_contauiner_weekly_schedule_model.dart';
export 'list_view_contauiner_weekly_schedule_model.dart';

class ListViewContauinerWeeklyScheduleWidget extends StatefulWidget {
  const ListViewContauinerWeeklyScheduleWidget({
    super.key,
    required this.daysofTheWeek,
  });

  final List<String>? daysofTheWeek;

  @override
  State<ListViewContauinerWeeklyScheduleWidget> createState() =>
      _ListViewContauinerWeeklyScheduleWidgetState();
}

class _ListViewContauinerWeeklyScheduleWidgetState
    extends State<ListViewContauinerWeeklyScheduleWidget> {
  late ListViewContauinerWeeklyScheduleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ListViewContauinerWeeklyScheduleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final listofdays = widget.daysofTheWeek!.toList();

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listofdays.length,
          itemBuilder: (context, listofdaysIndex) {
            final listofdaysItem = listofdays[listofdaysIndex];
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: wrapWithModel(
                model: _model.weeklyScheduleModels.getModel(
                  listofdaysIndex.toString(),
                  listofdaysIndex,
                ),
                updateCallback: () => safeSetState(() {}),
                child: WeeklyScheduleWidget(
                  key: Key(
                    'Key043_${listofdaysIndex.toString()}',
                  ),
                  day: functions.splitOpeningHours(listofdaysItem).firstOrNull,
                  isSelected: functions.compareWaakDayOfGoogleAndCurrentDay(
                      listofdaysItem, getCurrentTimestamp),
                  openingHours:
                      functions.splitOpeningHours(listofdaysItem).lastOrNull!,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
