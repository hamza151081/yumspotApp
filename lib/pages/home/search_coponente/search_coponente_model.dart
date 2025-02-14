import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_coponente_widget.dart' show SearchCoponenteWidget;
import 'package:flutter/material.dart';

class SearchCoponenteModel extends FlutterFlowModel<SearchCoponenteWidget> {
  ///  Local state fields for this component.

  List<ResultApiSearchPlaceStruct> result = [];
  void addToResult(ResultApiSearchPlaceStruct item) => result.add(item);
  void removeFromResult(ResultApiSearchPlaceStruct item) => result.remove(item);
  void removeAtIndexFromResult(int index) => result.removeAt(index);
  void insertAtIndexInResult(int index, ResultApiSearchPlaceStruct item) =>
      result.insert(index, item);
  void updateResultAtIndex(
          int index, Function(ResultApiSearchPlaceStruct) updateFn) =>
      result[index] = updateFn(result[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Google get latlong for an adresse)] action in TextField widget.
  ApiCallResponse? apiResultfsc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
