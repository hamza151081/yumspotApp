import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/video_numbers_components/video_numbers_components_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'feedrestaurant_model.dart';
export 'feedrestaurant_model.dart';

class FeedrestaurantWidget extends StatefulWidget {
  const FeedrestaurantWidget({
    super.key,
    required this.ri,
    required this.vi,
  });

  final String? ri;
  final String? vi;

  @override
  State<FeedrestaurantWidget> createState() => _FeedrestaurantWidgetState();
}

class _FeedrestaurantWidgetState extends State<FeedrestaurantWidget> {
  late FeedrestaurantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedrestaurantModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'feedrestaurant'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().pauseVideo = false;
      safeSetState(() {});
      _model.restaurantVideos = await RestaurantVideosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'restaurant_id',
          widget.ri,
        ),
      );
      _model.initialIndex = functions.indexOfVideoOnrestauFeed(
          _model.restaurantVideos!.toList(), widget.vi!);
      safeSetState(() {});
      _model.initialVideo = await VideosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.vi,
        ),
      );
      await VideosTable().update(
        data: {
          'total_views': functions.calculateVieaw(valueOrDefault<int>(
                _model.initialVideo?.firstOrNull?.totalViews,
                0,
              )) +
              1,
        },
        matchingRows: (rows) => rows.eqOrNull(
          'id',
          _model.initialVideo?.firstOrNull?.id,
        ),
      );
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FutureBuilder<List<RestaurantsRow>>(
          future: RestaurantsTable().querySingleRow(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.ri,
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
            List<RestaurantsRow> stackRestaurantsRowList = snapshot.data!;

            final stackRestaurantsRow = stackRestaurantsRowList.isNotEmpty
                ? stackRestaurantsRowList.first
                : null;

            return Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final videos =
                              _model.restaurantVideos?.toList() ?? [];

                          return Container(
                            width: double.infinity,
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: max(
                                          0,
                                          min(
                                              valueOrDefault<int>(
                                                _model.initialIndex,
                                                0,
                                              ),
                                              videos.length - 1))),
                              onPageChanged: (_) async {
                                _model.indexToUPDATE =
                                    _model.pageViewCurrentIndex + 1;
                                safeSetState(() {});
                                FFAppState().pauseVideo = false;
                                safeSetState(() {});
                                _model.videoToUpdate =
                                    await VideosTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'id',
                                    widget.vi,
                                  ),
                                );
                                if (_model.videoToUpdate != null &&
                                    (_model.videoToUpdate)!.isNotEmpty) {
                                  await VideosTable().update(
                                    data: {
                                      'total_views': functions.calculateVieaw(
                                              valueOrDefault<int>(
                                            _model.videoToUpdate?.firstOrNull
                                                ?.totalViews,
                                            0,
                                          )) +
                                          1,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      _model.videoToUpdate?.firstOrNull?.id,
                                    ),
                                  );
                                  _model.updating = !_model.updating;
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              scrollDirection: Axis.vertical,
                              itemCount: videos.length,
                              itemBuilder: (context, videosIndex) {
                                final videosItem = videos[videosIndex];
                                return FutureBuilder<List<VideosRow>>(
                                  future: VideosTable().querySingleRow(
                                    queryFn: (q) => q.eqOrNull(
                                      'id',
                                      videosItem.videoId,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<VideosRow> stackVideosRowList =
                                        snapshot.data!;

                                    final stackVideosRow =
                                        stackVideosRowList.isNotEmpty
                                            ? stackVideosRowList.first
                                            : null;

                                    return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: custom_widgets
                                                    .CustomVidPlayerYumSpot(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  videoPath: functions
                                                      .generateCdnnUrl(functions
                                                          .videoUrlToString(
                                                              stackVideosRow!
                                                                  .videoUrl!)),
                                                  playPauseVideoAction: true,
                                                  looping: true,
                                                  controlAudio: true,
                                                  loadingCircleColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  coverImage: functions
                                                      .generateCDNImage(functions
                                                          .replaceExtention(
                                                              stackVideosRow
                                                                  .videoUrl!)),
                                                  showCoverImage: widget.vi ==
                                                      stackVideosRow.id,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: GestureDetector(
                                              onTap: () async {
                                                FFAppState().pauseVideo =
                                                    !(FFAppState().pauseVideo ??
                                                        true);
                                                safeSetState(() {});
                                              },
                                              onHorizontalDragEnd:
                                                  (details) async {
                                                if (_model.intitalX >
                                                    details.localPosition.dx) {
                                                  context.pushNamed(
                                                    'restaurantDetails',
                                                    queryParameters: {
                                                      'ri': serializeParam(
                                                        widget.ri,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  context.safePop();
                                                }
                                              },
                                              onHorizontalDragStart:
                                                  (details) async {
                                                _model.intitalX =
                                                    details.localPosition.dx;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.7,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/Rectangle_31386.png',
                                                    ).image,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().pauseVideo =
                                                    !(FFAppState().pauseVideo ??
                                                        true);
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.3,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/Rectangle_31387.png',
                                                    ).image,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 32.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'restaurantDetails',
                                                          queryParameters: {
                                                            'ri':
                                                                serializeParam(
                                                              widget.ri,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Text(
                                                        stackRestaurantsRow!
                                                            .name!,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                60.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x19FFFFFF),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if (stackRestaurantsRow
                                                                      .type ==
                                                                  'Salé') {
                                                                return Icon(
                                                                  FFIcons
                                                                      .kplateUtensils2,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 16.0,
                                                                );
                                                              } else {
                                                                return Icon(
                                                                  FFIcons.kcake,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 24.0,
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Specialté',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'HomePage',
                                                                          queryParameters:
                                                                              {
                                                                            'searchTerm':
                                                                                serializeParam(
                                                                              stackRestaurantsRow.specialities.firstOrNull,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        stackRestaurantsRow
                                                                            .specialities
                                                                            .firstOrNull!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x19FFFFFF),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              FFIcons
                                                                  .kroomService1,
                                                              color:
                                                                  Colors.white,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Distance',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                '${functions.calculateDistance(stackRestaurantsRow.lat, stackRestaurantsRow.long, FFAppState().searchPlaceResult.geometry.location.lat != 0.0 ? FFAppState().searchPlaceResult.geometry.location.lat : functions.gatLat(currentUserLocationValue), FFAppState().searchPlaceResult.geometry.location.lng != 0.0 ? FFAppState().searchPlaceResult.geometry.location.lng : functions.getLong(currentUserLocationValue))}km',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 80.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 400.0,
                                                decoration: BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .videoNumbersComponentsModels
                                                      .getModel(
                                                    videosIndex.toString(),
                                                    videosIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      VideoNumbersComponentsWidget(
                                                    key: Key(
                                                      'Key2t3_${videosIndex.toString()}',
                                                    ),
                                                    videoID: videosItem.id,
                                                    restaurantId: widget.ri!,
                                                    restaurantLogo:
                                                        stackRestaurantsRow
                                                            .logoUrl!,
                                                    isGlobalFeed: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 10.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.safePop();
                                                    },
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .profileCntainerStyle,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.chevron_left,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Container(
                                                      width: 79.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x69FFFFFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(17.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .remove_red_eye_outlined,
                                                            color: Colors.white,
                                                            size: 16.0,
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  stackVideosRow
                                                                      .totalViews
                                                                      ?.toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
