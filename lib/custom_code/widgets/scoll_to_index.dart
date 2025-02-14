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

import 'package:scroll_to_index/scroll_to_index.dart';
import '/flutter_flow/flutter_flow_util.dart'; // For FFAppState
import '/backend/backend.dart'; // For RestaurantsRow
//import 'package:yum_spot/map/restaurant_item_on_map/restaurant_item_on_map_widget.dart';

class ScollToIndex extends StatefulWidget {
  const ScollToIndex({
    super.key,
    this.width,
    this.height,
    this.restaurants,
  });

  final double? width;
  final double? height;
  final List<RestaurantsRow>? restaurants;

  @override
  State<ScollToIndex> createState() => _ScollToIndexState();
}

class _ScollToIndexState extends State<ScollToIndex> {
  late AutoScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = AutoScrollController(
      // Use viewportBoundaryGetter for advanced viewport boundary (SafeArea handling)
      viewportBoundaryGetter: () => Rect.fromLTRB(
        0,
        0,
        0,
        MediaQuery.of(context).padding.bottom,
      ),
      axis: Axis.horizontal, // Horizontal scrolling
      suggestedRowHeight:
          200, // Assuming each restaurant item is around 200 height
    );

    // Add a listener for changes in FFAppState().clickedRestaurantIndex
    FFAppState().addListener(_onClickedRestaurantIndexChange);
  }

  @override
  void dispose() {
    // Remove the listener to avoid memory leaks
    FFAppState().removeListener(_onClickedRestaurantIndexChange);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurants = widget.restaurants ?? [];

    return Container(
      width: widget.width,
      height: widget.height,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(), // Smooth scrolling physics
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return AutoScrollTag(
            key: ValueKey(index),
            controller: _scrollController,
            index: index,
            child:
                Container(), //RestaurantItemOnMapWidget(restaurant: restaurants[index]),
            highlightColor: Colors.blue.withOpacity(0.1),
          );
        },
      ),
    );
  }

  void _onClickedRestaurantIndexChange() {
    // Get the new index from FFAppState
    final clickedIndex = FFAppState().clickedRestaurantIndex;

    // Check if index is valid and scroll
    if (clickedIndex != null &&
        clickedIndex >= 0 &&
        clickedIndex < (widget.restaurants?.length ?? 0)) {
      _scrollToIndex(clickedIndex);
    }
  }

  Future<void> _scrollToIndex(int index) async {
    await _scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition
          .begin, // Adjust the position to start at the beginning
      duration: const Duration(
          milliseconds: 500), // Slow scroll for better experience
    );
    _scrollController.highlight(index);
  }
}
