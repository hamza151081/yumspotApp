import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'assets_page_for_custom_widget_widget.dart'
    show AssetsPageForCustomWidgetWidget;
import 'package:flutter/material.dart';

class AssetsPageForCustomWidgetModel
    extends FlutterFlowModel<AssetsPageForCustomWidgetWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
