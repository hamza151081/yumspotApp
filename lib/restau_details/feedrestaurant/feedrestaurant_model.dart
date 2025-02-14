import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/video_numbers_components/video_numbers_components_widget.dart';
import 'feedrestaurant_widget.dart' show FeedrestaurantWidget;
import 'package:flutter/material.dart';

class FeedrestaurantModel extends FlutterFlowModel<FeedrestaurantWidget> {
  ///  Local state fields for this page.

  List<String> videoList = [
    'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/yum-spot-k9iejp/assets/ah5kpds412di/Download_(1).mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/yum-spot-k9iejp/assets/ah5kpds412di/Download_(1).mp4'
  ];
  void addToVideoList(String item) => videoList.add(item);
  void removeFromVideoList(String item) => videoList.remove(item);
  void removeAtIndexFromVideoList(int index) => videoList.removeAt(index);
  void insertAtIndexInVideoList(int index, String item) =>
      videoList.insert(index, item);
  void updateVideoListAtIndex(int index, Function(String) updateFn) =>
      videoList[index] = updateFn(videoList[index]);

  List<String> stringVideoList = [
    'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/yum-spot-k9iejp/assets/ah5kpds412di/Download_(1).mp4'
  ];
  void addToStringVideoList(String item) => stringVideoList.add(item);
  void removeFromStringVideoList(String item) => stringVideoList.remove(item);
  void removeAtIndexFromStringVideoList(int index) =>
      stringVideoList.removeAt(index);
  void insertAtIndexInStringVideoList(int index, String item) =>
      stringVideoList.insert(index, item);
  void updateStringVideoListAtIndex(int index, Function(String) updateFn) =>
      stringVideoList[index] = updateFn(stringVideoList[index]);

  int? indexToUPDATE;

  bool updating = true;

  int initialIndex = 0;

  double intitalX = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in feedrestaurant widget.
  List<RestaurantVideosRow>? restaurantVideos;
  // Stores action output result for [Backend Call - Query Rows] action in feedrestaurant widget.
  List<VideosRow>? initialVideo;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Query Rows] action in PageView widget.
  List<VideosRow>? videoToUpdate;
  // Models for videoNumbersComponents dynamic component.
  late FlutterFlowDynamicModels<VideoNumbersComponentsModel>
      videoNumbersComponentsModels;

  @override
  void initState(BuildContext context) {
    videoNumbersComponentsModels =
        FlutterFlowDynamicModels(() => VideoNumbersComponentsModel());
  }

  @override
  void dispose() {
    videoNumbersComponentsModels.dispose();
  }
}
