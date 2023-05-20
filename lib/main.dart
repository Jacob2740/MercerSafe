//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'colors_mercer_official.dart';
import 'home_screen.dart';
import 'safe_journey_button.dart';
import 'general_safety_info_screen.dart';
import 'campus_map.dart';
import 'emergency_call_button.dart';
import 'package:flutter/services.dart';
import 'report_incident.dart';
import 'registry.dart';

//FUNCTIONS/////////////////////////////////////////////////////////////////////
//runs the app
void main() => runApp(const MyApp());

//CLASSES///////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  //constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //stops the app from rotating
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(

      //set the theme for the entire app.
        theme: ThemeData(
            primarySwatch: mercerOrange, scaffoldBackgroundColor: mercerBlack),
        initialRoute: 'home', //set the app to start on the home page
        onGenerateRoute: (settings) {
          switch (settings.name) { //set the possible routes
            case 'home':
              return MaterialPageRoute(
                  builder: (context) => const MyHomePage());

            case 'genSafetyInfo':
              return MaterialPageRoute(
                  builder: (context) => const GenSafetyInfo());

            case 'safeJourney':
              return MaterialPageRoute(
                  builder: (context) => const SafeJourneyButton());

            case 'campusMap':
              return MaterialPageRoute(
                  builder: (context) => const CampusMap());

            case 'callButton':
              return MaterialPageRoute(
                  builder: (context) => const CallButton());

            case 'registry':
              return MaterialPageRoute(
                  builder: (context) =>  const RegistryView() );

            case 'reportIncident':
              return MaterialPageRoute(
                  builder: (context) => const ReportIncidentFeature(),
                  settings: settings);
          }
          return null;
        }
      );
  } 
}

//END OF main.dart//////////////////////////////////////////////////////////////
