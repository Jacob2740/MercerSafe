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
        appBar: AppBar(
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
                  //style: TextStyle( fontSize: 30.0, color: mercerOrange, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 20.0,
                ),
                const Text(
                  'Call MERPO',
                  //style: TextStyle( fontSize: 20.0, color: mercerOrange, fontWeight: FontWeight.bold),
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
        bottomNavigationBar: bottomNav(initialIndex),
      ),
    );
  }          
}