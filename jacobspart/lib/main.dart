import 'package:flutter/material.dart';

// function to trigger build when the app is run
void main() {
runApp(MaterialApp(
	initialRoute: '/',
	routes: {
	'/': (context) => const HomeRoute(),
	'/second': (context) => const CampusMap(),
	'/third': (context) => const EmergencyButton(),
	},
)); //MaterialApp
}



class HomeRoute extends StatelessWidget {
const HomeRoute({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text('Jacobs Part'),
		backgroundColor: Color.fromARGB(255, 215, 116, 11),
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
		], // <Widget>[]
		), // Column
	), // Center
	); // Scaffold
}
}



class CampusMap extends StatelessWidget {
const CampusMap({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text("Click Me Page"),
		backgroundColor: Color.fromARGB(255, 215, 116, 11),
	), // AppBar
	body: Center(
		child: ElevatedButton(
		onPressed: () {
			Navigator.pop(context);
		},
		child: const Text('Back!'),
		), // ElevatedButton
	), // Center
	); // Scaffold
}
}



class EmergencyButton extends StatelessWidget {
const EmergencyButton({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text("Tap Me Page"),
		backgroundColor: Color.fromARGB(255, 215, 116, 11),
	), // AppBar
	); // Scaffold
}
}
