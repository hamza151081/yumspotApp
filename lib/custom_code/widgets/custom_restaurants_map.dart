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

import 'dart:ui' as ui;

import 'package:google_maps_flutter/google_maps_flutter.dart'
    as gmaps; // Import Google Maps package
import 'package:flutter_svg/flutter_svg.dart';

class CustomRestaurantsMap extends StatefulWidget {
  const CustomRestaurantsMap({
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
  State<CustomRestaurantsMap> createState() => _CustomRestaurantsMapState();
}

class _CustomRestaurantsMapState extends State<CustomRestaurantsMap> {
  late gmaps.GoogleMapController _mapController;
  late gmaps.BitmapDescriptor _sucreMarker;
  late gmaps.BitmapDescriptor _saleMarker;
  late gmaps.BitmapDescriptor _favorisMarker;
  late gmaps.BitmapDescriptor _saleFavorisMarker;
  late gmaps.BitmapDescriptor _currentLocationMarker;
  final String _mapStyle = '''[
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#FFFFFF"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#FFFFFF"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]''';

  final String _darkMapStyle = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#18233D"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#FFFFFF"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#454E63"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#454E63"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#454E63"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]''';

  bool isLoading = true; // State variable to track loading

  @override
  void initState() {
    super.initState();
    print("we version3");
    _loadMarkers(); // Call to load markers
  }

  @override
  void didUpdateWidget(CustomRestaurantsMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the currentLocation has changed
    if (widget.currentLocation != oldWidget.currentLocation) {
      // Move the camera to the new location
      if (_mapController != null) {
        _mapController.animateCamera(
          gmaps.CameraUpdate.newLatLng(
            gmaps.LatLng(
              widget.currentLocation!.latitude,
              widget.currentLocation!.longitude,
            ),
          ),
        );
      }
    }
  }

  Future<gmaps.BitmapDescriptor> getSvgMarker(
      String assetPath, double width, double height) async {
    final svgString =
        await DefaultAssetBundle.of(context).loadString(assetPath);
    final SvgStringLoader svgStringLoader = SvgStringLoader(svgString);
    final PictureInfo pictureInfo = await vg.loadPicture(svgStringLoader, null);
    final ui.Picture picture = pictureInfo.picture;

    ui.PictureRecorder recorder = ui.PictureRecorder();
    ui.Canvas canvas =
        Canvas(recorder, Rect.fromPoints(Offset.zero, Offset(width, height)));
    canvas.scale(
        width / pictureInfo.size.width, height / pictureInfo.size.height);
    canvas.drawPicture(picture);
    print('SVG size: ${pictureInfo.size}');
    final ui.Image img =
        await recorder.endRecording().toImage(width.toInt(), height.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return gmaps.BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  // Load the custom marker images
  Future<void> _loadMarkers() async {
    try {
      _sucreMarker = await getSvgMarker('assets/images/sucre_1.svg', 100,
          100); /*  gmaps.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(24, 24)), // Adjust size if necessary
        'assets/images/sucre.png',
      );*/
      _saleMarker = await getSvgMarker('assets/images/sale_1.svg', 100, 100);

      _favorisMarker =
          await getSvgMarker('assets/images/favoris_sucre_1.svg', 100, 100);
      _saleFavorisMarker =
          await getSvgMarker('assets/images/favoris_sale_1.svg', 100, 100);

      print("initialization done successfully before _currentLocationMarker");
      if (widget.isDarkmode) {
        _currentLocationMarker = await getSvgMarker(
            'assets/images/current_location_white.svg', 100, 143);
      } else {
        _currentLocationMarker = await getSvgMarker(
            'assets/images/current_location_dark.svg', 100, 143);
      }
      print("initialization done successfully");
    } catch (e) {
      print("Error loading markers: $e");
    } finally {
      setState(() {
        isLoading = false; // Update loading state once markers are loaded
      });
    }
  }

  // Function to create markers based on restaurant type
  Set<gmaps.Marker> _createMarkers() {
    Set<gmaps.Marker> markers = {};
    // Add current location marker
    if (_currentLocationMarker == null ||
        _sucreMarker == null ||
        _saleMarker == null) {
      return markers; // Return an empty set of markers if the icons are not loaded
    }
    if (widget.currentLocation != null) {
      markers.add(
        gmaps.Marker(
          markerId: gmaps.MarkerId(
              'current_location'), // Unique ID for the current location
          position: gmaps.LatLng(
            widget.currentLocation!.latitude,
            widget.currentLocation!.longitude,
          ),
          icon: _currentLocationMarker, // Custom marker for current location
        ),
      );
    }

    if (widget.restaurants != null) {
      for (int index = 0; index < widget.restaurants!.length; index++) {
        var restaurant =
            widget.restaurants![index]; // Get the current restaurant

        final markerId = gmaps.MarkerId(restaurant.id.toString()); // Unique ID
        final marker = gmaps.Marker(
          markerId: markerId,
          position: gmaps.LatLng(
            restaurant.lat ?? 0,
            restaurant.long ?? 0,
          ),
          icon: (widget.restaurantFavorisIds != null &&
                  widget.restaurantFavorisIds!.contains(restaurant.id) &&
                  restaurant.type == 'Sucré')
              ? _favorisMarker
              : (widget.restaurantFavorisIds != null &&
                      widget.restaurantFavorisIds!.contains(restaurant.id) &&
                      restaurant.type == 'Salé')
                  ? _saleFavorisMarker
                  : (restaurant.type == 'Salé')
                      ? _saleMarker
                      : _sucreMarker,
          onTap: () {
            // Update the FFAppState clickedRestaurantIndex

            FFAppState().update(() {
              FFAppState().clickedRestaurantIndex = index;
              FFAppState().horizontalListVisibleOnMap = true;
            });

            // Optionally, you can print or handle more actions here
            print(
                "Restaurant ${restaurant.id} tapped. Index updated to $index");
          },
        );
        markers.add(marker);
      }
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child:
                CircularProgressIndicator()) // Show loading indicator while loading
        : Container(
            width: widget.width,
            height: widget.height,
            child: gmaps.GoogleMap(
              onMapCreated: (gmaps.GoogleMapController controller) {
                _mapController = controller;
                print("Map created successfully");
                print(widget.isDarkmode);

                _mapController.setMapStyle(
                    Theme.of(context).brightness == Brightness.dark
                        ? _darkMapStyle
                        : _mapStyle); // Apply the custom map style
              },
              initialCameraPosition: gmaps.CameraPosition(
                target: gmaps.LatLng(
                  widget.currentLocation?.latitude ?? 48.85837010,
                  widget.currentLocation?.longitude ?? 2.29448130,
                ), // Default position
                zoom: 14,
              ),
              markers: _createMarkers(),
              myLocationEnabled: false, // Enable my location
              myLocationButtonEnabled: false, // Enable my location button
              onTap: (gmaps.LatLng position) {
                // Update the FFAppState clickedRestaurantIndex

                FFAppState().update(() {
                  FFAppState().horizontalListVisibleOnMap = false;
                  FFAppState().minimizeSlid = true;
                });
              },
            ),
          );
  }
}
