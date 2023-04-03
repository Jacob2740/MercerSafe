import 'package:flutter/material.dart';
import 'colors_mercer_official.dart';
import 'home_screen.dart';
import 'safe_journey_button.dart';
import 'general_safety_info_screen.dart';
import 'campus_map.dart';
import 'emergency_call_button.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        theme: ThemeData(
            primarySwatch: mercerOrange, scaffoldBackgroundColor: mercerBlack),
        initialRoute: 'home',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case 'home':
              return MaterialPageRoute(
                  builder: (context) => const MyHomePage());
            case 'genSafetyInfo':
              return MaterialPageRoute(
                  builder: (context) => const GenSafetyInfo());
            case 'safeJourney':
              return MaterialPageRoute(
                  builder: (context) => SafeJourneyButton(),
                  settings: settings);
            case 'campusMap':
              return MaterialPageRoute(builder: (context) => const CampusMap());
            case 'emergencyButton':
              return MaterialPageRoute(builder: (context) => const EmergencyButton());
          }
        });
  } 
}
