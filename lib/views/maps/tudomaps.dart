import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class FlutterMap extends StatefulWidget {
  @override
  State<FlutterMap> createState() => FlutterMapState();
}

class FlutterMapState extends State<FlutterMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(12.9610, 77.6387),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: "Marker Domlur"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    position: LatLng(12.9610, 77.6387),
  );
  static final Marker _kGooglePlexMarker1 = Marker(
    markerId: MarkerId('_kGooglePlex1'),
    infoWindow: InfoWindow(title: "Marker 1"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(12.962938, 77.632852),
  );
  static final Marker _kGooglePlexMarker2 = Marker(
    markerId: MarkerId('_kGooglePlex2'),
    infoWindow: InfoWindow(title: "Marker 2"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(12.968165, 77.631801),
  );
  static final Marker _kGooglePlexMarker3 = Marker(
    markerId: MarkerId('_kGooglePlex3'),
    infoWindow: InfoWindow(title: "Marker 3"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(12.964897, 77.633897),
  );
  static final Marker _kGooglePlexMarker4 = Marker(
    markerId: MarkerId('_kGooglePlex4'),
    infoWindow: InfoWindow(title: "Marker 4"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(12.966897, 77.633897),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {
          _kGooglePlexMarker,
          _kGooglePlexMarker1,
          _kGooglePlexMarker2,
          _kGooglePlexMarker3,
          _kGooglePlexMarker4
        },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text(' Lets go to Domlur!'),
        icon: Icon(Icons.man_sharp),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
