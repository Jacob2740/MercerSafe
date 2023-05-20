//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';

//CLASSES///////////////////////////////////////////////////////////////////////
//GenSafetyInfo is Stateful. It calls on _GenSafetyInfoState
class GenSafetyInfo extends StatefulWidget {

  //constructor
  const GenSafetyInfo({super.key});

  final String title="General Safety Information";

  @override
  State<GenSafetyInfo> createState() => _GenSafetyInfoState();
}

//_GenSafetyInfoState returns a scaffold that makes the UI for the general safety info page
class _GenSafetyInfoState extends State<GenSafetyInfo> {

  //links to Mercer's websites
  final Uri urlFire = Uri.parse('https://disclosure.mercer.edu/security/fire');
  final Uri urlShooter = Uri.parse('https://police.mercer.edu/active-shooter-preparedness/');
  final Uri urlTornado = Uri.parse('https://ehso.mercer.edu/emergency/weather.cfm');
  final Uri urlTrafficJam = Uri.parse('https://www.traffickjamgeorgia.com/');
  final Uri urlSafeCampus = Uri.parse('https://police.mercer.edu/safety/');

  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button on the home page
    const double padVal=0.8;
    //initialIndex determines which icon the bottom navigator will start on (See create_bottom_nav.dart)
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
                  child: Text('MERPO:  478-301-2911',
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

      //creates the bottom navigator menu (see create_bottom_nav.dart)
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }
}