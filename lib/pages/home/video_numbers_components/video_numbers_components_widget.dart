import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/comment/comment_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'video_numbers_components_model.dart';
export 'video_numbers_components_model.dart';

class VideoNumbersComponentsWidget extends StatefulWidget {
  const VideoNumbersComponentsWidget({
    super.key,
    required this.videoID,
    required this.restaurantId,
    required this.restaurantLogo,
    required this.isGlobalFeed,
  });

  final String? videoID;
  final String? restaurantId;
  final String? restaurantLogo;
  final bool? isGlobalFeed;

  @override
  State<VideoNumbersComponentsWidget> createState() =>
      _VideoNumbersComponentsWidgetState();
}

class _VideoNumbersComponentsWidgetState
    extends State<VideoNumbersComponentsWidget> {
  late VideoNumbersComponentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoNumbersComponentsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: Container(
        decoration: BoxDecoration(),
        child: FutureBuilder<List<VideosRow>>(
          future: FFAppState().video(
            uniqueQueryKey: valueOrDefault<String>(
              widget.videoID,
              '- -',
            ),
            requestFn: () => VideosTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.videoID,
              ),
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
            List<VideosRow> columnVideosRowList = snapshot.data!;

            final columnVideosRow = columnVideosRowList.isNotEmpty
                ? columnVideosRowList.first
                : null;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 92.0,
                  height: 110.0,
                  decoration: BoxDecoration(),
                  child: Container(
                    height: 100.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: ClipOval(
                            child: Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (widget.isGlobalFeed!) {
                                    context.pushNamed(
                                      'restaurantDetails',
                                      queryParameters: {
                                        'ri': serializeParam(
                                          widget.restaurantId,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.safePop();
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      widget.restaurantLogo,
                                      'https://firebasestorage.googleapis.com/v0/b/yum-spot-hjl93d.appspot.com/o/icon-maps%2Fblank-profile-picture-973460_1280%20(2).webp?alt=media&token=24870b73-dc34-41cd-b923-5d3dcf2fabc4',
                                    ),
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: FutureBuilder<List<FavorisRow>>(
                            future: FFAppState().favoritRestaurantUsersId(
                              uniqueQueryKey: valueOrDefault<String>(
                                widget.restaurantId,
                                '- -',
                              ),
                              requestFn: () => FavorisTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'user_id',
                                      currentUserUid,
                                    )
                                    .eqOrNull(
                                      'restaurant_id',
                                      widget.restaurantId,
                                    ),
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
                              List<FavorisRow> containerFavorisRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible:
                                      !(containerFavorisRowList.isNotEmpty),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 1.0, 10.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 50.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0x740F172A),
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        if (loggedIn) {
                                          await FavorisTable().insert({
                                            'user_id': currentUserUid,
                                            'restaurant_id':
                                                widget.restaurantId,
                                          });
                                          FFAppState()
                                              .clearFavorisUseridCache();
                                          FFAppState()
                                              .clearFavoritRestaurantUsersIdCacheKey(
                                                  valueOrDefault<String>(
                                            widget.restaurantId,
                                            '- -',
                                          ));
                                          _model.updating =
                                              !(_model.updating ?? true);
                                          safeSetState(() {});
                                        } else {
                                          context.pushNamed('LoginPage');
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: FutureBuilder<List<VideoLikesRow>>(
                    future: FFAppState().videoLikeUseridVideoid(
                      uniqueQueryKey: valueOrDefault<String>(
                        widget.videoID,
                        ' - -',
                      ),
                      requestFn: () => VideoLikesTable().querySingleRow(
                        queryFn: (q) => q
                            .eqOrNull(
                              'video_id',
                              widget.videoID,
                            )
                            .eqOrNull(
                              'user_id',
                              currentUserUid,
                            ),
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
                      List<VideoLikesRow> columnVideoLikesRowList =
                          snapshot.data!;

                      final columnVideoLikesRow =
                          columnVideoLikesRowList.isNotEmpty
                              ? columnVideoLikesRowList.first
                              : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (columnVideoLikesRow?.userId != null &&
                              columnVideoLikesRow?.userId != '')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (loggedIn) {
                                  await VideoLikesTable().delete(
                                    matchingRows: (rows) => rows
                                        .eqOrNull(
                                          'user_id',
                                          currentUserUid,
                                        )
                                        .eqOrNull(
                                          'video_id',
                                          widget.videoID,
                                        ),
                                  );
                                  FFAppState()
                                      .clearVideoLikeUseridVideoidCacheKey(
                                          valueOrDefault<String>(
                                    widget.videoID,
                                    ' - -',
                                  ));
                                  await VideosTable().update(
                                    data: {
                                      'total_likes': valueOrDefault<int>(
                                        (int var1) {
                                          return (var1 - 1) < 0 ? 0 : var1 - 1;
                                        }(valueOrDefault<int>(
                                          columnVideosRow?.totalLikes,
                                          0,
                                        )),
                                        0,
                                      ),
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      widget.videoID,
                                    ),
                                  );
                                  _model.updating = !(_model.updating ?? true);
                                  safeSetState(() {});
                                } else {
                                  context.pushNamed('LoginPage');
                                }
                              },
                              child: Icon(
                                Icons.favorite_sharp,
                                color: FlutterFlowTheme.of(context).error,
                                size: 32.0,
                              ),
                            ),
                          if (columnVideoLikesRow?.userId == null ||
                              columnVideoLikesRow?.userId == '')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (loggedIn) {
                                  await VideoLikesTable().insert({
                                    'user_id': currentUserUid,
                                    'video_id': widget.videoID,
                                  });
                                  await VideosTable().update(
                                    data: {
                                      'total_likes': (valueOrDefault<int>(
                                                columnVideosRow?.totalLikes,
                                                0,
                                              ) ??
                                              0) +
                                          1,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      widget.videoID,
                                    ),
                                  );
                                  FFAppState()
                                      .clearVideoLikeUseridVideoidCacheKey(
                                          valueOrDefault<String>(
                                    widget.videoID,
                                    ' - -',
                                  ));
                                  _model.updating = !(_model.updating ?? true);
                                  safeSetState(() {});
                                } else {
                                  context.pushNamed('LoginPage');
                                }
                              },
                              child: Icon(
                                Icons.favorite_border_sharp,
                                color: Colors.white,
                                size: 32.0,
                              ),
                            ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                columnVideosRow?.totalLikes,
                                formatType: FormatType.compact,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
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
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                child: CommentWidget(
                                  videoID: widget.videoID!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Icon(
                        FFIcons.kgroup1000004174,
                        color: Colors.white,
                        size: 32.0,
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        formatNumber(
                          columnVideosRow?.totalComment,
                          formatType: FormatType.compact,
                        ),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.restaurant =
                              await RestaurantsTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              widget.restaurantId,
                            ),
                          );
                          await actions.createOrUpdateFollowLink(
                            '/fd?ri=${widget.restaurantId}&vi=${widget.videoID}',
                            getCurrentTimestamp,
                            'YumSpot : le TikTok des restaurants',
                            columnVideosRow!.coverImageUrl!,
                            _model.restaurant!.firstOrNull!.name!,
                          );
                          await Share.share(
                            'https;//app.yumspot.fr/fd?ri=${widget.restaurantId}&vi=${widget.videoID}',
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );

                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        columnVideosRow?.totalShares?.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 16.0)),
            );
          },
        ),
      ),
    );
  }
}
