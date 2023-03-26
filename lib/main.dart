// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jacobs Part',
      initialRoute: '/',
      routes: {
        '/': (context) => MapPage(),
        '/second': (context) => CallForHelpPage(),
      },
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Map'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 224, 139, 21),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              
              child: Text(
                'Below find a detailed map of campus as well as the campus emergency stations:',
                textAlign: TextAlign.center,
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Go to the Emergency Call Page,')
            ),

            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/Mercer_Campus.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CallForHelpPage extends StatelessWidget {
  
  final String merpoNumber = 'tel:+6785164182';

  const CallForHelpPage({super.key});

  void makeCall() async {
    if (await canLaunchUrl(merpoNumber)) {
      await launchUrl(merpoNumber);
    } else {
      throw 'Could not launch $merpoNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Call Jacob'),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: makeCall,
          child: Text('Call $merpoNumber'),
        )));
  }
}
