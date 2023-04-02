import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';

class GenSafetyInfo extends StatefulWidget {
  const GenSafetyInfo({super.key});

  final String title="General Safety Information";

  @override
  State<GenSafetyInfo> createState() => _GenSafetyInfoState();
}

/* for some reason,  */
class _GenSafetyInfoState extends State<GenSafetyInfo> {
  final Uri urlFire = Uri.parse('https://disclosure.mercer.edu/security/fire');
  final Uri urlShooter = Uri.parse('https://police.mercer.edu/active-shooter-preparedness/');
  final Uri urlTornado = Uri.parse('https://ehso.mercer.edu/emergency/weather.cfm');
  final Uri urlTrafficJam = Uri.parse('https://www.traffickjamgeorgia.com/');
  final Uri urlSafeCampus = Uri.parse('https://police.mercer.edu/safety/');

  @override
  Widget build(BuildContext context) {
    const double padVal=0.8;
    int initialIndex=2;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  <Widget>[
              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: Text('MERPO: 478-301-4357',
                    style: TextStyle(fontSize:30,  color: mercerWhite, fontWeight: FontWeight.bold),)
              ) ,

              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: InkWell(
                      child: Text('Fire Safety',
                        style: TextStyle(fontSize:20, color: mercerOrange, decoration: TextDecoration.underline),
                      ),
                      onTap: () => launchUrl(urlFire))
              ),

              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: InkWell(
                      child: Text('Active Shooter',
                        style: TextStyle(fontSize:20, color: mercerOrange, decoration: TextDecoration.underline),
                      ),
                      onTap: () => launchUrl(urlShooter))
              ),

              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: InkWell(
                      child: Text('Tornado Safety',
                        style: TextStyle(fontSize:20, color: mercerOrange, decoration: TextDecoration.underline),
                      ),
                      onTap: () => launchUrl(urlTornado))
              ),

              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: InkWell(
                      child: Text('Traffic Jam!',
                        style: TextStyle(fontSize:20, color: mercerOrange, decoration: TextDecoration.underline),
                      ),
                      onTap: () => launchUrl(urlTrafficJam))
              ),

              Padding(
                  padding: const EdgeInsets.all(padVal),
                  child: InkWell(
                      child:  Text('How to Stay Safe of Campus',
                        style: TextStyle(fontSize:20, color: mercerOrange, decoration: TextDecoration.underline),
                      ),
                      onTap: () => launchUrl(urlSafeCampus))
              ),
            ]),
      ),
      bottomNavigationBar: bottomNav(initialIndex),
    );
  }
}