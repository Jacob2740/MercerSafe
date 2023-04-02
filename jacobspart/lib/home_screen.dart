import 'package:flutter/material.dart';
import 'create_bottom_nav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title='Home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    const double padVal=20;
    int initialIndex=0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: SizedBox(
                      height:100, //height of button
                      width:300,
                      child: ElevatedButton(
                              child: const Text('Report an Incident', style:TextStyle(fontSize: 20)),
                              onPressed:()=> print('***********OPEN REGISTRY********************'), //on pressed, switch to gen safety info screen
                  ))
                  ),
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: SizedBox(
                    height:100, //height of button
                    width:300,
                    child: ElevatedButton(
                            child: const Text('Safe Journey Button',style:TextStyle(fontSize: 20)),
                            onPressed:()=>  Navigator.pushNamed(context, 'safeJourney'), //on pressed, switch to gen safety info screen
                ))),
              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: SizedBox(
                      height:100, //height of button
                      width:300,
                      child: ElevatedButton(
                              child: const Text('Campus Safety Map',style:TextStyle(fontSize: 20)),
                              onPressed:()=>  Navigator.pushNamed(context, 'campusMap '), //on pressed, switch to gen safety info screen
                ))),
              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: SizedBox(
                      height:100, //height of button
                      width:300,
                      child:ElevatedButton(
                            child: const Text('Call MERPO',style:TextStyle(fontSize: 20)),
                            onPressed:()=> Navigator.pushNamed(context, 'emergencyButton'), //on pressed, switch to call MERPO screen
                  ))),
            ]),
      ),
      bottomNavigationBar: bottomNav(initialIndex),
    );
  }

}