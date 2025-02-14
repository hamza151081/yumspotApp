import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/auth_comment_component/auth_comment_component_widget.dart';
import '/pages/home/user_component/user_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'comment_model.dart';
export 'comment_model.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
    required this.videoID,
  });

  final String? videoID;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late CommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentModel());

    _model.commentTextFieldTextController ??= TextEditingController();
    _model.commentTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VideosRow>>(
      future: VideosTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.videoID,
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
        List<VideosRow> containerVideosRowList = snapshot.data!;

        final containerVideosRow = containerVideosRowList.isNotEmpty
            ? containerVideosRowList.first
            : null;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Container(
                      width: 56.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFCCD0D5),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Commentaires',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                indent: 15.0,
                endIndent: 15.0,
                color: Color(0xFFCCD0D5),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<List<VideoCommentsRow>>(
                    future: VideoCommentsTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'video_id',
                        widget.videoID,
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
                      List<VideoCommentsRow> listViewVideoCommentsRowList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewVideoCommentsRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewVideoCommentsRow =
                              listViewVideoCommentsRowList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (listViewVideoCommentsRow.userId !=
                                  currentUserUid)
                                UserComponentWidget(
                                  key: Key(
                                      'Keytam_${listViewIndex}_of_${listViewVideoCommentsRowList.length}'),
                                  videoComment: listViewVideoCommentsRow,
                                ),
                              if (listViewVideoCommentsRow.userId ==
                                  currentUserUid)
                                AuthCommentComponentWidget(
                                  key: Key(
                                      'Key6vc_${listViewIndex}_of_${listViewVideoCommentsRowList.length}'),
                                  videos: listViewVideoCommentsRow,
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: 88.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.commentTextFieldTextController,
                            focusNode: _model.commentTextFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Saisissez votre commentaire',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFCCD0D5),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: null,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .commentTextFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Transform.rotate(
                          angle: 0.0 * (math.pi / 180),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor:
                                  FlutterFlowTheme.of(context).submitButton,
                              icon: Icon(
                                Icons.send_sharp,
                                color: Colors.white,
                                size: 16.0,
                              ),
                              onPressed: () async {
                                if (loggedIn) {
                                  await actions.printStuff(
                                    'videoid : ${widget.videoID}',
                                  );
                                  await VideoCommentsTable().insert({
                                    'comment': _model
                                        .commentTextFieldTextController.text,
                                    'user_id': currentUserUid,
                                    'video_id': widget.videoID,
                                    'user_full_name': currentUserDisplayName,
                                    'user_profile_picture': currentUserPhoto,
                                  });
                                  await VideosTable().update(
                                    data: {
                                      'total_comment': (valueOrDefault<int>(
                                                containerVideosRow
                                                    ?.totalComment,
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
                                  safeSetState(() {
                                    _model.commentTextFieldTextController
                                        ?.clear();
                                  });
                                  _model.updating = !_model.updating;
                                  safeSetState(() {});
                                } else {
                                  context.pushNamed('LoginPage');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 10.0)).addToStart(SizedBox(height: 0.0)),
          ),
        );
      },
    );
  }
}
