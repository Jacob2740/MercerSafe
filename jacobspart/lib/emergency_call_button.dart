import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';


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

    int initialIndex = 4;
   
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mercerBlack,
        appBar: AppBar(
          backgroundColor: mercerOrange,
          title: const Text('Emergency Call Button'),
        ), 

        body: Center(
            child: Column(
              children: [

                Container(
                  height: 250.0,
                ),
                const Text(
                  'Need Help?',
                  style: TextStyle( fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),

                Container(
                  height: 20.0,
                ),
                const Text(
                  'Call MERPO',
                  style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                
                Container(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: makingCall,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(120,120)),
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder(),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(mercerOrange),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  child: const Text('Call'),
                ),
              ],
            ),
        ),
        bottomNavigationBar: bottomNav(initialIndex),
      ),
    );
  }          
}