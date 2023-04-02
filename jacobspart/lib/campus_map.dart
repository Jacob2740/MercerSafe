// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';



class CampusMap extends StatefulWidget {
  const CampusMap({super.key});

  @override
  State<CampusMap> createState() => _CampusMapState();
}



class _CampusMapState extends State<CampusMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(32.861780470548595, -83.55661530376726);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Campus Safety Map'),
        elevation: 2,
      ),

      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget> [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Below find a detailed map of campus as well as the campus emergency stations:',
                textAlign: TextAlign.center,
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
          

          ],
        ),
      ),
    );
  }
}
