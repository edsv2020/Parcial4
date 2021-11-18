import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> marker = [];

  @override
  void initState(){
  marcadores();
  super.initState();
}void marcadores (){
  Marker etiquetauno=Marker(
  markerId: MarkerId('Arce'),
  position:LatLng( 13.699977156731206, -89.19813424564155 ),
  infoWindow: InfoWindow(title: 'MovilSV Calle Arce'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueRed
),
);

  Marker etiquetados=Marker(
  markerId: MarkerId('Salvador del Mundo'),
  position:LatLng( 13.70155590798445, -89.22445536098556 ),
  infoWindow: InfoWindow(title: 'MovilSV Salvador del Mundo'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueRed),

  
);
Marker etiquetatres=Marker(
  markerId: MarkerId('Soyabronx'),
  position:LatLng( 13.709780456577743, -89.13737268751773 ),
  infoWindow: InfoWindow(title: 'MovilSV Soyapango'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueRed
),
);
    setState(() {
    marker.add(etiquetauno);
    marker.add(etiquetados);
    marker.add(etiquetatres);
 

});

  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.69, -89.19),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      markers: marker.map((e) => e).toSet(),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
