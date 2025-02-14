import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/map/restaurant_item_on_map/restaurant_item_on_map_widget.dart';
import '/pages/home/filters_component/filters_component_widget.dart';
import '/pages/home/search_coponente/search_coponente_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'restaurants_map_model.dart';
export 'restaurants_map_model.dart';

class RestaurantsMapWidget extends StatefulWidget {
  const RestaurantsMapWidget({super.key});

  @override
  State<RestaurantsMapWidget> createState() => _RestaurantsMapWidgetState();
}

class _RestaurantsMapWidgetState extends State<RestaurantsMapWidget> {
  late RestaurantsMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurantsMapModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'restaurantsMap'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().pauseVideo = true;
      safeSetState(() {});
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return FutureBuilder<ApiCallResponse>(
      future: SupabaseGroup.nearbyRestaurantsCall.call(
        latfn: FFAppState().searchPlaceResult.geometry.location.lat != 0.0
            ? FFAppState().searchPlaceResult.geometry.location.lat
            : functions.gatLat(currentUserLocationValue),
        longfn: FFAppState().searchPlaceResult.geometry.location.lng != 0.0
            ? FFAppState().searchPlaceResult.geometry.location.lng
            : functions.getLong(currentUserLocationValue),
        radius: FFAppState().distanceFilterKm * 1000,
        filterType: FFAppState().filterRestaurantType,
        filterCategoryList: FFAppState().filterRestaurantSpecialities,
        filterRating: FFAppState().filterRating,
        filterOpen: FFAppState().filterRrestaurantOpen,
        userIdPram: currentUserUid,
        onlyFavoris: FFAppState().filterOnlyFavoris,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final restaurantsMapNearbyRestaurantsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  FutureBuilder<List<FavorisRow>>(
                    future: FavorisTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'user_id',
                        currentUserUid,
                      ),
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
                      List<FavorisRow> containerFavorisRowList = snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.CustomRestaurantsMap(
                            width: double.infinity,
                            height: double.infinity,
                            restaurants: functions
                                .convertJsonToRowRestaurants(getJsonField(
                              restaurantsMapNearbyRestaurantsResponse.jsonBody,
                              r'''$''',
                              true,
                            )),
                            currentLocation: functions.convertToLatlng(
                                FFAppState()
                                            .searchPlaceResult
                                            .geometry
                                            .location
                                            .lat !=
                                        0.0
                                    ? FFAppState()
                                        .searchPlaceResult
                                        .geometry
                                        .location
                                        .lat
                                    : functions
                                        .gatLat(currentUserLocationValue)!,
                                FFAppState()
                                            .searchPlaceResult
                                            .geometry
                                            .location
                                            .lng !=
                                        0.0
                                    ? FFAppState()
                                        .searchPlaceResult
                                        .geometry
                                        .location
                                        .lng
                                    : functions
                                        .getLong(currentUserLocationValue)!),
                            isDarkmode:
                                Theme.of(context).brightness == Brightness.dark,
                            restaurantFavorisIds: containerFavorisRowList
                                .map((e) => e.restaurantId)
                                .withoutNulls
                                .toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  if (!FFAppState().horizontalListVisibleOnMap)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: custom_widgets.CustomSlidingUpPanel(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          title: 'Hello Testing',
                          body: 'Something greate is happening ',
                          image: 'image',
                          restaurants: functions
                              .convertJsonToRowRestaurants(getJsonField(
                            restaurantsMapNearbyRestaurantsResponse.jsonBody,
                            r'''$''',
                            true,
                          )),
                        ),
                      ),
                    ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 50.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 65.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: double.infinity,
                                                child: SearchCoponenteWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                      ),
                                      child: Container(
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? FlutterFlowTheme.of(context)
                                                  .textFiledBackGroundColor
                                              : Color(0x95FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (FFAppState()
                                                              .searchPlaceResult
                                                              .formattedAddress !=
                                                          '') {
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                                .searchPlaceResult =
                                                            ResultApiSearchPlaceStruct();
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    );
                                                  } else {
                                                    return Icon(
                                                      Icons.search_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    );
                                                  }
                                                },
                                              ),
                                              Flexible(
                                                child: Text(
                                                  FFAppState()
                                                                  .searchPlaceResult
                                                                  .formattedAddress !=
                                                              ''
                                                      ? FFAppState()
                                                          .searchPlaceResult
                                                          .formattedAddress
                                                      : 'Ville ou  code postal',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.9,
                                                child: FiltersComponentWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                      ),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.8,
                                                      child:
                                                          FiltersComponentWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Icon(
                                            Icons.filter_alt,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (FFAppState().horizontalListVisibleOnMap)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: wrapWithModel(
                          model: _model.restaurantItemOnMapModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: RestaurantItemOnMapWidget(
                            restaurant: functions
                                .convertJsonToRowRestaurants(getJsonField(
                                  restaurantsMapNearbyRestaurantsResponse
                                      .jsonBody,
                                  r'''$''',
                                  true,
                                ))
                                .elementAtOrNull(
                                    FFAppState().clickedRestaurantIndex),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
