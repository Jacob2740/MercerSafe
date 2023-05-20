//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'create_bottom_nav.dart';
import 'emergency_call_button.dart';

//CLASSES///////////////////////////////////////////////////////////////////////
//MyHomePage, is Stateful. It calls on _MyHomePageState
class MyHomePage extends StatefulWidget {
  //constructor
  const MyHomePage({super.key});

  final String title='Home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//_MyHomePageState returns a scaffold that makes the UI for the homepage
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    //padVal is the value for how much padding is around each button on the home page
    const double padVal=20;

    //initialIndex determines which icon the bottom navigator will start on (See create_bottom_nav.dart)
    int initialIndex=0;

    //scaffold that makes the UI for the homepage
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), //refers to the title in MyHomePage
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[

              //Report Incident Button
              Padding(
                  padding: const EdgeInsets.all(padVal), //creates padding around the button
                  child: SizedBox( //sets the size of the button
                      height:100,
                      width:300,
                      child: ElevatedButton( //creates the button
                              child: const Text('Report an Incident', style:TextStyle(fontSize: 20)),
                              //when the button is pressed, go to the report incident page
                              onPressed:()=> Navigator.pushNamed(context, 'reportIncident'),
                  ))
                  ),

              //Safe Journey Button
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: SizedBox(
                    height:100,
                    width:300,
                    child: ElevatedButton(
                            child: const Text('Safe Journey Button',style:TextStyle(fontSize: 20)),
                            //when the button is pressed, go to the safe journey button page
                            onPressed:()=>  Navigator.pushNamed(context, 'safeJourney'),
                ))),

              //Campus Map Button
              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: SizedBox(
                      height:100,
                      width:300,
                      child: ElevatedButton(
                              child: const Text('Campus Safety Map',style:TextStyle(fontSize: 20)),
                              //when the button is pressed, go to the campus map page
                              onPressed:()=>  Navigator.pushNamed(context, 'campusMap'),
                ))),

              //Call MERPO Button
              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: SizedBox(
                      height:100, //height of button
                      width:300,
                      child:ElevatedButton(
                            child: const Text('Call MERPO',style:TextStyle(fontSize: 20)),
                            //when the button is pressed, open the user's phone app with MERPO's number pre-loaded
                            onPressed:()=> makingCall(),
                  ))),
            ]),
      ),

      //creates the bottom navigator menu (see create_bottom_nav.dart)
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }
}
//END OF home_screen.dart///////////////////////////////////////////////////////