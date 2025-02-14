import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'comenent_specialite_model.dart';
export 'comenent_specialite_model.dart';

class ComenentSpecialiteWidget extends StatefulWidget {
  const ComenentSpecialiteWidget({super.key});

  @override
  State<ComenentSpecialiteWidget> createState() =>
      _ComenentSpecialiteWidgetState();
}

class _ComenentSpecialiteWidgetState extends State<ComenentSpecialiteWidget> {
  late ComenentSpecialiteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComenentSpecialiteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.7,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'Selectionnez des spécialité',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 17.0, 16.0),
              child: FutureBuilder<List<RestaurantSpecialitiesRow>>(
                future: RestaurantSpecialitiesTable().queryRows(
                  queryFn: (q) => q,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<RestaurantSpecialitiesRow>
                      wrapRestaurantSpecialitiesRowList = snapshot.data!;

                  return Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: List.generate(
                        wrapRestaurantSpecialitiesRowList.length, (wrapIndex) {
                      final wrapRestaurantSpecialitiesRow =
                          wrapRestaurantSpecialitiesRowList[wrapIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.selectedSpecialites
                              .contains(wrapRestaurantSpecialitiesRow.name)) {
                            _model.removeFromSelectedSpecialites(
                                wrapRestaurantSpecialitiesRow.name!);
                            safeSetState(() {});
                          } else {
                            _model.addToSelectedSpecialites(
                                wrapRestaurantSpecialitiesRow.name!);
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 112.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              _model.selectedSpecialites.contains(
                                      wrapRestaurantSpecialitiesRow.name)
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context)
                                      .praimaryWithOpcity8,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              wrapRestaurantSpecialitiesRow.name!,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: valueOrDefault<Color>(
                                      _model.selectedSpecialites.contains(
                                              wrapRestaurantSpecialitiesRow
                                                  .name)
                                          ? FlutterFlowTheme.of(context)
                                              .alternate
                                          : FlutterFlowTheme.of(context)
                                              .praimaryWithOpcity30,
                                      FlutterFlowTheme.of(context).alternate,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
