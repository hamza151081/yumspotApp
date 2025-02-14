// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

// Define a custom widget named CustomVidPlayerYumSpot
class CustomVidPlayerYumSpot extends StatefulWidget {
  CustomVidPlayerYumSpot(
      {Key? key,
      this.width,
      this.height,
      required this.videoPath,
      required this.coverImage,
      this.playPauseVideoAction = false,
      this.looping = false,
      this.controlAudio = false,
      this.loadingCircleColor,
      this.showCoverImage = false})
      : super(key: key);

  final double? width;
  final double? height;
  final String videoPath;
  final String coverImage;
  bool playPauseVideoAction;
  final bool looping;
  bool controlAudio;
  final Color? loadingCircleColor;
  final bool showCoverImage;

  @override
  _CustomVidPlayerYumSpotState createState() => _CustomVidPlayerYumSpotState();
}

// Define the state for the CustomVidPlayerYumSpot widget
class _CustomVidPlayerYumSpotState extends State<CustomVidPlayerYumSpot> {
  late VideoPlayerController _videoPlayerController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize the VideoPlayerController with the provided videoPath
    _videoPlayerController = VideoPlayerController.network(widget.videoPath)
      ..setLooping(widget.looping)
      ..initialize().then((_) {
        setState(() {});
        _updateAudioVolume(); // Initialize audio volume
      });
  }

  @override
  void didUpdateWidget(CustomVidPlayerYumSpot oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update video playback based on the playPauseVideoAction property
    if (widget.playPauseVideoAction != oldWidget.playPauseVideoAction) {
      if (widget.playPauseVideoAction) {
        _videoPlayerController.play();
      } else {
        _videoPlayerController.pause();
      }
    }

    // Update audio volume based on the controlAudio property
    if (widget.controlAudio != oldWidget.controlAudio) {
      _updateAudioVolume();
    }
  }

  void _updateAudioVolume() {
    double volume = widget.controlAudio ? 1.0 : 0.0;
    _videoPlayerController.setVolume(volume);
  }

  @override
  void dispose() {
    // Dispose of the video controller
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _toggleVideoPlayback() {
    // Toggle video playback and update the state
    if (_isVideoPlaying) {
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.play();
    }
    setState(() {
      _isVideoPlaying = !_isVideoPlaying;
      widget.playPauseVideoAction = _isVideoPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (FFAppState().pauseVideo) {
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.play();
    }
    return VisibilityDetector(
      key: Key(widget.videoPath),
      onVisibilityChanged: (visibilityInfo) {
        // Play or pause the video based on visibility
        if (visibilityInfo.visibleFraction >= 1) {
          _videoPlayerController.play();
        } else {
          _videoPlayerController.pause();
        }
      },
      child: Container(
        width: _videoPlayerController.value.size.width,
        height: _videoPlayerController.value.size.height,
        //color: Colors.red,
        child: _videoPlayerController.value.isInitialized
            ? Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoPlayerController.value.size?.width ?? 0,
                          height:
                              _videoPlayerController.value.size?.height ?? 0,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Stack(
                  children: [
                    // Cover image filling the background
                    if (widget.showCoverImage)
                      Positioned.fill(
                        child: Image.network(
                          widget.coverImage,
                          fit: BoxFit.cover,
                        ),
                      ),

                    // Circular progress indicator in the center of the stack
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          widget.loadingCircleColor ??
                              Theme.of(context)
                                  .primaryColor, // Use loadingCircleColor or fallback to a default color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
