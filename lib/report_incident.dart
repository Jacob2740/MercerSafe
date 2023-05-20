//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:cloud_firestore/cloud_firestore.dart';
import 'colors_mercer_official.dart';
import 'registry.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:camera/camera.dart';

//GLOBAL VARIABLES//////////////////////////////////////////////////////////////
List<String> incidentTypes = [
      "Environmental Hazard",
      "Suspicious Person",
      "Contraband",
      "Conflict",
      "Other"
    ];
    List<String> locations = [
      "Cruz Plaza",
      "Tarver Library",
      "Gardens",
      "Lofts",
    ];
String incidentType = incidentTypes.first;
 String location = locations.first;

 //FUNCTIONS////////////////////////////////////////////////////////////////////
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ReportIncidentFeature());
}

const String appTitle = 'Report an Incident';

//CLASSES///////////////////////////////////////////////////////////////////////
class ReportIncidentFeature extends StatefulWidget {
  const ReportIncidentFeature({Key? key}) : super(key: key);
  @override
  InitState createState() {
    // The createState method is used to create
    // instances of mutable widgets

    return InitState();
  }

} // End of MyApp

class InitState extends State<ReportIncidentFeature>{
  //padVal is the value for how much padding is around each button on the home page
  double padVal=20;
  //initialIndex determines which icon the bottom navigator will start on (See create_bottom_nav.dart)
  int initialIndex=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(title: const Text(appTitle)),
            body: const ReportIncident(),
            //creates the bottom navigator menu (see create_bottom_nav.dart)
            bottomNavigationBar: BottomNav(initialIndex));
  }
}

class ReportIncident extends StatefulWidget {
  const ReportIncident({Key? key}) : super(key: key);

  @override
  DisplayReportOptions createState() {
    // The createState method is used to create instances of mutable widgets

    return DisplayReportOptions();
  }
}

// ignore: camel_case_types
class textRow1 extends StatelessWidget {
  const textRow1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
          child: Text(" "))
    ]);
  }
}

class OptionsRow extends StatefulWidget {
  const OptionsRow({Key? key}) : super(key: key);
  @override
  DisplayOptions createState() {
    return DisplayOptions();
  }

}

class DisplayOptions extends State<OptionsRow> {
    
    late List<DropdownMenuItem<String>> incidentMap = incidentTypes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style:TextStyle(color: mercerWhite)),
              );
            }).toList();

    late List<DropdownMenuItem<String>> locationMap = locations.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style:TextStyle(color: mercerWhite)),
              );
            }).toList();
    
    @override
    Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text("Incident Type: ", style:TextStyle(color: mercerWhite)),
        DropdownButton(
            value: incidentType,
            items: incidentMap,
            dropdownColor: mercerBlack,
            onChanged: (String? s) {
              setState(() {
                incidentType = s!;
              });
            }),

         Text("Location: ", style:TextStyle(color: mercerWhite)),
        DropdownButton(
            value: location,
            items: locationMap,
            dropdownColor: mercerBlack,
            onChanged: (String? s) {
                setState((){
                  location = s!;
                });
            })
      ]);
    }

    String getIncidentType() {
      return incidentType;
    }

    String getLocation() {
      return location;
    }
}

// ignore: must_be_immutable
class ReportBox extends StatelessWidget {
  ReportBox({Key? key}) : super(key: key);
  String textValue = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Flexible(
            child: TextField(
                style: TextStyle(color: mercerWhite),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Describe your incident here',
                  hintStyle: TextStyle(color: mercerOrange)
                ),
                onChanged: (String value) {
                  textValue = value;
                },
                maxLines: null))
      ],
    );
  }

  String getValue() {
    return textValue;
  }
}

class DisplayReportOptions extends State<ReportIncident> {
  ReportBox report = ReportBox();
  OptionsRow options = const OptionsRow();

  Future<CameraDescription> getCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    return firstCamera;
  }

  @override
  Widget build(BuildContext context) {
    {
      WidgetsFlutterBinding.ensureInitialized();
      return FutureBuilder<CameraDescription>(
          future: getCamera(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return Column(
              children: <Widget>[
                const textRow1(),
                report,
                options,
                Row(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: ElevatedButton(
                          onPressed: viewRegistry,
                          child: const Text("View Registry"))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: ElevatedButton(
                          onPressed: sendReport,
                          child: const Text("Submit Report")))
                ])
              ]
              ,
            );
          });
    }
  }

  // Row
  // build

  void sendReport() async {
    String emailAddress = "mercersafeexample@gmail.com";
    CollectionReference incidentLog = FirebaseFirestore.instance.collection(
        'incidentLog');
    Map<String, String> incidentReport = {
      'description': report.getValue(),
      'incidentType': incidentType,
      'location': location
    };
    await incidentLog.add(incidentReport);

    final Email sendEmail = Email(
        body: "Location: $location\nIncident Type: $incidentType\nDescription: ${report
            .getValue()}",
        subject: 'MercerSafe Incident Report',
        recipients: [emailAddress],
        isHTML: false
    );

    await FlutterEmailSender.send(sendEmail);
    AlertDialog alrtDialog = AlertDialog(
        content: Text('Report Sent!', style: TextStyle(color: mercerBlack),));
    // ignore: use_build_context_synchronously
    showDialog(context: context, builder: (context) {
      return alrtDialog;
    }); // builder);
  }

  void viewRegistry() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegistryView()));
    });
  }

}

//END OF report_incident.dart///////////////////////////////////////////////////