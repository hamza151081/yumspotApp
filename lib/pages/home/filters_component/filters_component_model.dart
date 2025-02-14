import '/flutter_flow/flutter_flow_util.dart';
import 'filters_component_widget.dart' show FiltersComponentWidget;
import 'package:flutter/material.dart';

class FiltersComponentModel extends FlutterFlowModel<FiltersComponentWidget> {
  ///  Local state fields for this component.

  int slectedSaleSucre = 0;

  int? selectedRestautantTypeIndex;

  String? typevalue = '';

  double rating = 0.0;

  String? typeeOfRestaurant = '';

  String? restaurantOpen;

  List<String> restaurantsSpecialties = [];
  void addToRestaurantsSpecialties(String item) =>
      restaurantsSpecialties.add(item);
  void removeFromRestaurantsSpecialties(String item) =>
      restaurantsSpecialties.remove(item);
  void removeAtIndexFromRestaurantsSpecialties(int index) =>
      restaurantsSpecialties.removeAt(index);
  void insertAtIndexInRestaurantsSpecialties(int index, String item) =>
      restaurantsSpecialties.insert(index, item);
  void updateRestaurantsSpecialtiesAtIndex(
          int index, Function(String) updateFn) =>
      restaurantsSpecialties[index] = updateFn(restaurantsSpecialties[index]);

  bool seeMoreSpecialities = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Switchfavoris widget.
  bool? switchfavorisValue;
  // State field(s) for SwitchHalal widget.
  bool? switchHalalValue;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
