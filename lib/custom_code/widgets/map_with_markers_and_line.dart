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

class MapWithMarkersAndLine extends StatefulWidget {
  const MapWithMarkersAndLine({
    super.key,
    this.width,
    this.height,
    this.currentLocation,
    required this.restaurant,
    this.isDarkMode = false,
  });

  final double? width;
  final double? height;
  final LatLng? currentLocation;
  final RestaurantsRow restaurant;
  final bool isDarkMode;

  @override
  State<MapWithMarkersAndLine> createState() => _MapWithMarkersAndLineState();
}

class _MapWithMarkersAndLineState extends State<MapWithMarkersAndLine> {
  late gmaps.GoogleMapController _mapController;
  late gmaps.BitmapDescriptor _currentLocationMarker;
  late gmaps.BitmapDescriptor _sucreMarker;
  late gmaps.BitmapDescriptor _saleMarker;
  Set<gmaps.Marker> _markers = {};
  Set<gmaps.Polyline> _polylines = {};

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
        "color": "#757575"
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

  @override
  void initState() {
    super.initState();
    _loadMarkers();
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

  // update bounds
  void _updateMapBounds() {
    if (widget.currentLocation != null &&
        widget.restaurant.lat != null &&
        widget.restaurant.long != null) {
      final bounds = gmaps.LatLngBounds(
        southwest: gmaps.LatLng(
          widget.currentLocation!.latitude < widget.restaurant.lat!
              ? widget.currentLocation!.latitude
              : widget.restaurant.lat!,
          widget.currentLocation!.longitude < widget.restaurant.long!
              ? widget.currentLocation!.longitude
              : widget.restaurant.long!,
        ),
        northeast: gmaps.LatLng(
          widget.currentLocation!.latitude > widget.restaurant.lat!
              ? widget.currentLocation!.latitude
              : widget.restaurant.lat!,
          widget.currentLocation!.longitude > widget.restaurant.long!
              ? widget.currentLocation!.longitude
              : widget.restaurant.long!,
        ),
      );

      // Animate camera to fit the bounds
      _mapController.animateCamera(
          gmaps.CameraUpdate.newLatLngBounds(bounds, 50)); // 50 is padding
    }
  }

  // Load the custom marker images
  Future<void> _loadMarkers() async {
    _sucreMarker = await getSvgMarker('assets/images/sucre_1.svg', 100,
        100); /*  gmaps.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(24, 24)), // Adjust size if necessary
        'assets/images/sucre.png',
      );*/
    _saleMarker = await getSvgMarker('assets/images/sale_1.svg', 100, 100);

    if (widget.isDarkMode) {
      _currentLocationMarker = await getSvgMarker(
          'assets/images/current_location_white.svg', 100, 143);
    } else {
      _currentLocationMarker = await getSvgMarker(
          'assets/images/current_location_dark.svg', 100, 143);
    }

    _addMarkersAndPolyline(); // Call this once markers are loaded
  }

  // Add markers for the current location and the restaurant
  void _addMarkersAndPolyline() {
    if (widget.currentLocation != null) {
      // Marker for the current location
      _markers.add(
        gmaps.Marker(
          markerId: gmaps.MarkerId('current_location'),
          position: gmaps.LatLng(
            widget.currentLocation!.latitude,
            widget.currentLocation!.longitude,
          ),
          icon: _currentLocationMarker,
          infoWindow: gmaps.InfoWindow(title: 'You are here'),
        ),
      );
    }

    // Marker for the restaurant
    _markers.add(
      gmaps.Marker(
        markerId: gmaps.MarkerId('restaurant_location'),
        position: gmaps.LatLng(
          widget.restaurant.lat ?? 0,
          widget.restaurant.long ?? 0,
        ),
        icon: widget.restaurant.type == 'Salé' ? _saleMarker : _sucreMarker,
      ),
    );

    // Draw a line (Polyline) between the two locations
    _polylines.add(
      gmaps.Polyline(
        polylineId: gmaps.PolylineId('line_between_locations'),
        points: [
          gmaps.LatLng(
            widget.currentLocation?.latitude ?? 0,
            widget.currentLocation?.longitude ?? 0,
          ),
          gmaps.LatLng(
            widget.restaurant.lat ?? 0,
            widget.restaurant.long ?? 0,
          ),
        ],
        color: widget.isDarkMode
            ? Colors.white
            : Colors.black, // Customize the line color
        width: 5, // Customize the line width
      ),
    );

    setState(() {}); // Update the state to render the markers and polyline
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? 300, // Default height
      child: gmaps.GoogleMap(
        onMapCreated: (gmaps.GoogleMapController controller) {
          _mapController = controller;
          _mapController
              .setMapStyle(widget.isDarkMode ? _darkMapStyle : _mapStyle);
          _updateMapBounds(); // Automatically update the bounds once the map is created
        },
        initialCameraPosition: gmaps.CameraPosition(
          target: gmaps.LatLng(
            widget.currentLocation?.latitude ?? widget.restaurant.lat ?? 0,
            widget.currentLocation?.longitude ?? widget.restaurant.long ?? 0,
          ),
          zoom: 14, // Zoom level
        ),
        markers: _markers,
        polylines: _polylines,
        myLocationEnabled:
            false, // You can enable this if you want the map to show device location
        myLocationButtonEnabled:
            false, // Disable native "My Location" button as we're using custom markers
      ),
    );
  }
}
