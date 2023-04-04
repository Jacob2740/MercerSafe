// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class CampusMap extends StatefulWidget {
  const CampusMap({super.key});

  @override
  State<CampusMap> createState() => _CampusMapState();
}

class _CampusMapState extends State<CampusMap> {
    // created controller for displaying Google Maps
    Completer<GoogleMapController> _controller = Completer();
    int initialIndex = 1;
    
    // given camera position 
    static final CameraPosition _kGoogle = const CameraPosition(
        target: LatLng(32.82866102996525, -83.64968813314134),
      zoom: 17,
    );
    
    Uint8List? marketimages;
    List<String> images = ['map_marker_small.png','map_marker_small.png', 'map_marker_small.png', 'map_marker_small.png', 'map_marker_small.png','map_marker_small.png','map_marker_small.png', 'map_marker_small.png', 'map_marker_small.png', 'map_marker_small.png','map_marker_small.png', 'map_marker_small.png', 'map_marker_small.png'];
  

    // created empty list of markers
    final List<Marker> _markers = <Marker>[];
      
    // created list of coordinates of various locations
    final List<LatLng> _latLen = <LatLng>[
    
      LatLng(32.82984595040604, -83.6520853375285),
      LatLng(32.83004321110057, -83.65261243975954),
      LatLng(32.82925359076843, -83.65339173434724),
      LatLng(32.82904145158433, -83.65424828236657),
      LatLng(32.831523507231616, -83.65093437847436),
      LatLng(32.831575971404824, -83.65177923923646),
      LatLng(32.83233345038014, -83.65114129750334),
      LatLng(32.828325624244656, -83.65200174214068),
      LatLng(32.82865694055968, -83.65218413234626),
      LatLng(32.828801186732385, -83.65278494714116),
      LatLng(32.82734934530236, -83.65412982859912),
      LatLng(32.83644572101392, -83.64756259227318),
      LatLng(32.837030274137256, -83.64761721395841),

    ];


    // declared method to get Images
    Future<Uint8List> getImage(String path, int width) async{
      ByteData data = await rootBundle.load(path);
      ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
      ui.FrameInfo fi = await codec.getNextFrame();
      return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
    
    }
      
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      // initialize loadData method
      loadData();
    }

    loadData() async{
      for(int i=0 ;i<images.length; i++){
        final Uint8List markIcons = await getImage(images[i], 100);
        // makers added according to index
        _markers.add(
          Marker(
            // given marker id
            markerId: MarkerId(i.toString()),
            // given marker icon
            icon: BitmapDescriptor.fromBytes(markIcons),
            // given position
            position: _latLen[i],
            infoWindow: InfoWindow(
              // given title for marker
              title: "Emergency Blue Light Station",
            ),
          )
        );
        setState(() {
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Campus Safety Map'),
          elevation: 2,
        ),
        body: Container(
          child: SafeArea(
            child: GoogleMap(
              // given camera position
              initialCameraPosition: _kGoogle,
              // set markers on google map
              markers: Set<Marker>.of(_markers),
              // on below line we have given map type 
              mapType: MapType.normal,
              // on below line we have enabled location
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              // on below line we have enabled compass 
              compassEnabled: true,
              // below line displays google map in our app
              onMapCreated: (GoogleMapController controller){
                  _controller.complete(controller);
              },
            ),
          ),
        ),
        bottomNavigationBar: bottomNav(initialIndex),
      );
    }
}
