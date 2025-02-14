import '/flutter_flow/flutter_flow_util.dart';
import 'comenent_specialite_widget.dart' show ComenentSpecialiteWidget;
import 'package:flutter/material.dart';

class ComenentSpecialiteModel
    extends FlutterFlowModel<ComenentSpecialiteWidget> {
  ///  Local state fields for this component.

  List<String> selectedSpecialites = [];
  void addToSelectedSpecialites(String item) => selectedSpecialites.add(item);
  void removeFromSelectedSpecialites(String item) =>
      selectedSpecialites.remove(item);
  void removeAtIndexFromSelectedSpecialites(int index) =>
      selectedSpecialites.removeAt(index);
  void insertAtIndexInSelectedSpecialites(int index, String item) =>
      selectedSpecialites.insert(index, item);
  void updateSelectedSpecialitesAtIndex(int index, Function(String) updateFn) =>
      selectedSpecialites[index] = updateFn(selectedSpecialites[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
