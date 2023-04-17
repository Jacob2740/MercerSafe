import 'package:flutter/material.dart';
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';
import 'emergency_call_button.dart';

class SafeJourneyButton extends StatefulWidget {
  const SafeJourneyButton({super.key});

  final String title="Safe Journey Button";

  @override
  State<SafeJourneyButton> createState() => _SafeJourneyButtonState();
}

class _SafeJourneyButtonState extends State<SafeJourneyButton> {

  int _counter = 30;
  String buttonMessage = 'Tap the button to start!';
  Color buttonColor = mercerOrange;
  bool _buttonUnpressed = false;
  bool merpoCalled = false;
  Row myButtons= Row();

  void _decreaseCounter() async {

    Route routeArgs = ModalRoute.of(context)!;

    while (_buttonUnpressed && !merpoCalled && routeArgs.isCurrent) {

      setState(() {
        buttonMessage = 'Hold down until you reach your destination.';
        buttonColor=mercerOrange;
        if (_counter>0) {
          _counter--;
        }
        if (_counter==0) {
          callMerpo(context);
        }
      });

      // wait a second
      await Future.delayed(const Duration(milliseconds: 1000));
    }

    while (!_buttonUnpressed) {

      setState(() {
        buttonMessage="You are holding the button.";
        buttonColor=darkOrange;
      });

      // wait a second
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  Row  makeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
      Padding(padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                      onPressed: () => callMerpo(context),
                      style: ElevatedButton.styleFrom(backgroundColor: mercerGreen),
                      child: const Text('CALL MERPO'),
              )),
      Padding(padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () =>  Navigator.pushNamed(context, 'home'),
              style: ElevatedButton.styleFrom(backgroundColor: mercerRed),
              child: const Text('Return to Home Page'),
            )),
      ],
    );
  }

  void callMerpo (BuildContext context) {
    makingCall();
    merpoCalled=true;
  }

  @override
  Widget build(BuildContext context) {

    double contSize=300;
    myButtons=makeButtons();
    int initialIndex=0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Seconds: $_counter',  style: TextStyle(fontSize: 40.0, color: mercerWhite),  textAlign: TextAlign.center )),
              Listener(
                onPointerDown: (details) {
                  _buttonUnpressed = false;
                  _counter=30; //reset timer when user presses down
                },
                onPointerUp: (details) {
                  _buttonUnpressed = true;
                  _decreaseCounter();
                },

                child: Container(
                  width:contSize,
                  height:contSize,
                  decoration: BoxDecoration(color:buttonColor, shape: BoxShape.circle),
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('buttonMessage', style: TextStyle(fontSize: 20.0, color: mercerWhite),  textAlign: TextAlign.center ) ),
                ),
              ),

              const Padding(padding: EdgeInsets.all(15)),

              _buttonUnpressed ?Visibility(visible: true, child: myButtons ) : Visibility(visible: false, child: myButtons), //ternary

            ]
        )
      ),
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }
}