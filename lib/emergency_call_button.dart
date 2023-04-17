import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';

makingCall() async {
  String policeNumber="tel:4783012911";
  var url = Uri.parse(policeNumber);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class CallButton extends StatefulWidget {
  const CallButton({super.key});

  @override
  State<CallButton> createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> {
  @override
  Widget build(BuildContext context) {
    int initialIndex = 4;

    return Scaffold(
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
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              height: 20.0,
            ),
            const Text(
              'Call MERPO',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: makingCall,
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(120, 120)),
                shape: MaterialStateProperty.all<CircleBorder>(
                  const CircleBorder(),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(mercerOrange),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5.0)),
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
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }
}
