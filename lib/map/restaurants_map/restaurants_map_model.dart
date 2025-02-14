import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/map/restaurant_item_on_map/restaurant_item_on_map_widget.dart';
import 'restaurants_map_widget.dart' show RestaurantsMapWidget;
import 'package:flutter/material.dart';

class RestaurantsMapModel extends FlutterFlowModel<RestaurantsMapWidget> {
  ///  Local state fields for this page.

  List<RestaurantsRow> restaurants = [];
  void addToRestaurants(RestaurantsRow item) => restaurants.add(item);
  void removeFromRestaurants(RestaurantsRow item) => restaurants.remove(item);
  void removeAtIndexFromRestaurants(int index) => restaurants.removeAt(index);
  void insertAtIndexInRestaurants(int index, RestaurantsRow item) =>
      restaurants.insert(index, item);
  void updateRestaurantsAtIndex(int index, Function(RestaurantsRow) updateFn) =>
      restaurants[index] = updateFn(restaurants[index]);

  ///  State fields for stateful widgets in this page.

  // Model for RestaurantItemOnMap component.
  late RestaurantItemOnMapModel restaurantItemOnMapModel;

  @override
  void initState(BuildContext context) {
    restaurantItemOnMapModel =
        createModel(context, () => RestaurantItemOnMapModel());
  }

  @override
  void dispose() {
    restaurantItemOnMapModel.dispose();
  }
}
