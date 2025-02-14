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

import 'index.dart'; // Imports other custom widgets

//import '../../components/video_home_page_widget.dart';
//import '../../components/video_home_page_widget.dart';
import 'package:yum_spot/map/list_of_restaurants_on_map/list_of_restaurants_on_map_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'index.dart'; // Imports other custom widgets

class CustomSlidingUpPanel extends StatefulWidget {
  const CustomSlidingUpPanel({
    Key? key,
    this.width,
    this.height,
    required this.title,
    required this.body,
    required this.image,
    required this.restaurants,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String title;
  final String body;
  final String image;
  final List<RestaurantsRow> restaurants;

  @override
  _CustomSlidingUpPanelState createState() => _CustomSlidingUpPanelState();
}

class _CustomSlidingUpPanelState extends State<CustomSlidingUpPanel> {
  late PanelController _panelController;

  @override
  void initState() {
    super.initState();
    _panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    // Add null check for controller state before closing the panel
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (FFAppState().minimizeSlid && _panelController.isAttached) {
        _panelController.close();
      }
    });

    return SlidingUpPanel(
      controller: _panelController,
      minHeight: MediaQuery.of(context).size.height * .1,
      maxHeight: MediaQuery.of(context).size.height * .70,
      borderRadius: radius,
      color: FlutterFlowTheme.of(context).restaurantDetails20,
      panel: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Drag handle icon
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: 70,
              height: 3,
              color: Colors.grey,
            ),
            // Expanded area for scrollable content
            Expanded(
              child: ListOfRestaurantsOnMapWidget(
                listOfRestaurants: widget.restaurants,
              ),
            ),
          ],
        ),
      ),
      onPanelSlide: (position) {
        if (position > 0) {
          // When the panel is sliding up, set minimizeSlid to false
          FFAppState().update(() {
            FFAppState().minimizeSlid = false;
          });
        }
      },
    );
  }
}
