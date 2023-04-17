// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'create_bottom_nav.dart';

class CampusMap extends StatefulWidget {
  const CampusMap({super.key});

  @override
  State<CampusMap> createState() => _CampusMapState();
}

class _CampusMapState extends State<CampusMap> {
  int initialIndex = 1;
  final String _mapInfoText =
      "The Blue Emergency Stations are marked by the blue markers on the map. ";
  late GoogleMapController mapController; //contrller for Google map
  var markers = <Marker>{};
  static const LatLng showLocation =
      LatLng(32.82984008220686, -83.65257442971355);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Safety Map"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true,
            //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: showLocation, //initial position
              zoom: 17.0, //initial zoom level
            ),
            markers: getmarkers(),
            //markers to show on map
            mapType: MapType.normal,
            //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                _mapInfoText,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId("Marker 1"),
        position: LatLng(32.82984595040604, -83.6520853375285),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: '1503 Adams Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId("Marker 2"),
        position: LatLng(32.83004321110057, -83.65261243975954),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: '1794 Winship Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 3"),
        position: LatLng(32.82925359076843, -83.65339173434724),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: '1821 Winship Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 4"),
        position: LatLng(32.82904145158433, -83.65424828236657),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: '1962 Winship Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 5"),
        position: LatLng(32.831523507231616, -83.65093437847436),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'Delta Sigma Theta Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 6"),
        position: LatLng(32.831575971404824, -83.65177923923646),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'Greek Village Winship Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 7"),
        position: LatLng(32.83233345038014, -83.65114129750334),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'Lofts 1: Rear Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 8"),
        position: LatLng(32.828325624244656, -83.65200174214068),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'UC Lower Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 9"),
        position: LatLng(32.82865694055968, -83.65218413234626),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'UC Middle Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 10"),
        position: LatLng(32.828801186732385, -83.65278494714116),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'UC Upper Parking Lot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 11"),
        position: LatLng(32.82734934530236, -83.65412982859912),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'Sand Volleyball Courts',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 12"),
        position: LatLng(32.83644572101392, -83.64756259227318),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'Intermural Field Parking',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("Marker 13"),
        position: LatLng(32.837030274137256, -83.64761721395841),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Emergency Blue Light Station',
          snippet: 'Intermural Field Bathrooms',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));
    });
    return markers;
  }
}
