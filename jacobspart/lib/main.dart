import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// function to trigger build when the app is run
void main() {
  runApp( 
    MaterialApp( 
      theme: ThemeData (
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
      '/': (context) => const HomeRoute(),
      '/second': (context) => const CampusMap(),
      '/third': (context) => const EmergencyButton(),
      },
    )
  ); 
}



class HomeRoute extends StatelessWidget {
const HomeRoute({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text('Jacobs Part'),
		//backgroundColor: Color.fromARGB(255, 215, 116, 11),
	), // AppBar
	body: Center(
		child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: <Widget>[
			Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
              child: const Text('Campus Map'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              ),
            ), // ElevatedButton
			Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
              child: const Text('Emergency Button'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              ),
            ), // ElevatedButton
		], 
		), 
	), 
	); 
}
}



class CampusMap extends StatelessWidget {
const CampusMap({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Campus Map"),
      //backgroundColor: Color.fromARGB(255, 215, 116, 11),
    ), // AppBar
    body: Center(
      child: Column (
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Below find a detailed map of campus as well as the campus emergency stations:',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back!'),
            ),
          ),
          Image.asset(
            'assets/campus_map.png',
            width: 200,
            height: 200,
          ),
        ],
      )
    ), 
    ); 
  }
}



makingCall() async {
  var url = Uri.parse("tel:6785164182");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}



class EmergencyButton extends StatelessWidget {
const EmergencyButton({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Emergency Call Button'),
          //backgroundColor: Color.fromARGB(255, 215, 116, 11),
        ), // AppBar
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                ),//Container
                const Text(
                  'Need Help?',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),//TextStyle
                ),//Text
                Container(
                  height: 20.0,
                ),
                const Text(
                  'Call MERPO',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 20.0,
                ),
               ElevatedButton(
                  onPressed: makingCall,
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.black),
                    ),
                  ),
                  child: const Text('Call'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }          
}
