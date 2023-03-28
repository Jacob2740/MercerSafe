import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// function to trigger build when the app is run
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
       theme: ThemeData (
         primarySwatch: Colors.deepOrange,
         scaffoldBackgroundColor: Colors.blueGrey,
       ),
      debugShowCheckedModeBanner: false,
      home : HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
  

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const HomeRoute(),
    const CampusMap(),
    const EmergencyButton(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          "Jacob's Part",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),

              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.work_rounded,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.work_outline_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),

              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.work_rounded,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.work_outline_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
            ],
        ),
    );
  }
}


class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temporary Homepage'),
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
                      },
                    ),
                  ), // ElevatedButton
            Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                    child: const Text('Emergency Button'),
                      onPressed: () {
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
