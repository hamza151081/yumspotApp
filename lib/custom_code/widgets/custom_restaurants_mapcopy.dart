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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

class CustomRestaurantsMapcopy extends StatefulWidget {
  const CustomRestaurantsMapcopy({
    super.key,
    this.width,
    this.height,
    this.restaurants,
    this.currentLocation,
    this.restaurantFavorisIds,
    this.isDarkmode = false,
  });

  final double? width;
  final double? height;
  final List<RestaurantsRow>? restaurants;
  final LatLng? currentLocation;
  final bool isDarkmode;
  final List<String>? restaurantFavorisIds;

  @override
  State<CustomRestaurantsMapcopy> createState() =>
      _CustomRestaurantsMapcopyState();
}

class _CustomRestaurantsMapcopyState extends State<CustomRestaurantsMapcopy> {
  gmaps.GoogleMapController? _mapController;
  gmaps.BitmapDescriptor? _restaurantMarker;
  gmaps.BitmapDescriptor? _currentLocationMarker;

  bool isLoading = true;

  final String _mapStyle = '''[
    {
      "featureType": "poi",
      "stylers": [{"visibility": "off"}]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [{"color": "#FFFFFF"}]
    }
  ]''';

  final String _darkMapStyle = '''[
    {
      "elementType": "geometry",
      "stylers": [{"color": "#18233D"}]
    },
    {
      "elementType": "labels.icon",
      "stylers": [{"visibility": "off"}]
    }
  ]''';

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
  }

  Future<void> _initializeMarkers() async {
    try {
      _restaurantMarker = await gmaps.BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/images/default_marker.png',
      );

      _currentLocationMarker = await gmaps.BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/images/current_location_marker.png',
      );
    } catch (e) {
      print("Error loading markers: $e");
      _restaurantMarker = gmaps.BitmapDescriptor.defaultMarker;
      _currentLocationMarker = gmaps.BitmapDescriptor.defaultMarkerWithHue(
          gmaps.BitmapDescriptor.hueBlue);
    }

    setState(() {
      isLoading = false;
    });
  }

  Set<gmaps.Marker> _createMarkers() {
    Set<gmaps.Marker> markers = {};

    if (widget.currentLocation != null) {
      markers.add(
        gmaps.Marker(
          markerId: const gmaps.MarkerId('current_location'),
          position: gmaps.LatLng(
            widget.currentLocation!.latitude,
            widget.currentLocation!.longitude,
          ),
          icon: _currentLocationMarker ?? gmaps.BitmapDescriptor.defaultMarker,
        ),
      );
    }

    if (widget.restaurants != null) {
      for (var restaurant in widget.restaurants!) {
        markers.add(
          gmaps.Marker(
            markerId: gmaps.MarkerId(restaurant.id.toString()),
            position: gmaps.LatLng(
              restaurant.lat ?? 0.0,
              restaurant.long ?? 0.0,
            ),
            icon: _restaurantMarker ?? gmaps.BitmapDescriptor.defaultMarker,
            onTap: () {
              print("Tapped on restaurant: ${restaurant.id}");
            },
          ),
        );
      }
    }

    return markers;
  }

  void _searchNearbyRestaurants() {
    if (widget.currentLocation != null) {
      _mapController?.animateCamera(
        gmaps.CameraUpdate.newLatLng(
          gmaps.LatLng(
            widget.currentLocation!.latitude,
            widget.currentLocation!.longitude,
          ),
        ),
      );
    } else {
      print("No current location available!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: widget.width ?? double.infinity,
                height: widget.height ?? double.infinity,
                child: gmaps.GoogleMap(
                  onMapCreated: (gmaps.GoogleMapController controller) {
                    _mapController = controller;
                    _mapController?.setMapStyle(
                      widget.isDarkmode ? _darkMapStyle : _mapStyle,
                    );
                  },
                  initialCameraPosition: gmaps.CameraPosition(
                    target: gmaps.LatLng(
                      widget.currentLocation?.latitude ?? 48.85837010,
                      widget.currentLocation?.longitude ?? 2.29448130,
                    ),
                    zoom: 14,
                  ),
                  markers: _createMarkers(),
                ),
              ),
        // Search button positioned at center-right in all orientations
        SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double screenHeight = constraints.maxHeight;
              double screenWidth = constraints.maxWidth;

              return Positioned(
                top: screenHeight / 2 - 28, // Center vertically
                right: 20, // Align to right
                child: FloatingActionButton(
                  onPressed: _searchNearbyRestaurants,
                  child: const Icon(Icons.search, color: Colors.white),
                  backgroundColor: Colors.blueAccent,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
