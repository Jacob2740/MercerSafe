import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'colors_mercer_official.dart';
import 'Registry.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:camera/camera.dart';
//import 'open_camera.dart';

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
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ReportIncidentFeature());
}

const String appTitle = 'Report an Incident';
//List<String> reportInfo = ["none", "none", "none", "none", "none", "none"];


class ReportIncidentFeature extends StatefulWidget {
  const ReportIncidentFeature({Key? key}) : super(key: key);
  @override
  initState createState() {
    // The createState method is used to create
    // instances of mutable widgets

    return initState();
  }

} // End of MyApp

class initState extends State<ReportIncidentFeature>{
  double padVal=20;
  int initialIndex=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(title: const Text(appTitle)),
            body: const ReportIncident(),
            bottomNavigationBar: bottomNav(initialIndex));
  }
}
class ReportIncident extends StatefulWidget {
  const ReportIncident({Key? key}) : super(key: key);

  @override
  DisplayReportOptions createState() {
    // The createState method is used to create
    // instances of mutable widgets

    return DisplayReportOptions();
  }
}
// End of DisplayCounterRow

/*class DisplayColumn extends StatelessWidget{
  const DisplayColumn ({Key? key}): super(key: key);
  Widget build(BuildContext context){
    return DisplayReportOptions();
  }
}
*/
// ignore: camel_case_types
class textRow1 extends StatelessWidget {
  const textRow1({Key? key}) : super(key: key);

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
        const Text("Location: "),
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Describe your incident here',
                  hintStyle: TextStyle(color: Color.fromARGB(152, 255, 255, 255))
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


  Future<CameraDescription> getCamera() async{
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    return firstCamera;
  }
  @override
  Widget build(BuildContext context){
    {
      //final CameraDescription myCam;
      WidgetsFlutterBinding.ensureInitialized();
      return FutureBuilder<CameraDescription>(
          future: getCamera(),
          builder: (context, snapshot) {
            //final CameraDescription firstCamera=await getCamera();
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return Column(
              children: <Widget>[
                const textRow1(),
                report,
                options,
                /*ElevatedButton(
                    onPressed: () => {TakePictureScreen(camera: snapshot.data!)},
                    child: Text("Take Picture")), */
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

//        CONTINUE ON NEXT PAGE
  void sendReport() async {
    String emailAddress = "mercersafeexample@gmail.com";
    CollectionReference incidentLog = FirebaseFirestore.instance.collection('incidentLog');
    Map<String, String> incidentReport = {
        'description': report.getValue(),
        'incidentType': incidentType,
        'location': location
    };
    DocumentReference docVal = await incidentLog.add(incidentReport);

    final Email send_email = Email(
      body: "Location: $location\nIncident Type: $incidentType\nDescription: ${report.getValue()}",
      subject: 'MercerSafe ]Incident Report',
      recipients: [emailAddress],
      isHTML: false
    );

    await FlutterEmailSender.send(send_email);
    AlertDialog    alrtDialog = AlertDialog(
        content: Text('Report Sent!', style: TextStyle(color: mercerBlack),));
    // Display dialog
    showDialog( context: context, builder: (context) {return alrtDialog;}); // builder);
    //setState(() {});
  }

  void viewRegistry() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const RegistryView()));
    });
  }

  /* void makeCam() {
    setState(() {
      makeCamera;
    });
  } */
} // end of MyDisplayCounterState

///////////////////////////////////////////////////////////////////////////

/*Future<void> makeCamera() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
    ),
  );
}

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();

}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    print("TakePictureScreenState is running");
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
} */


//Prototype "thank you" page
/*class reportSubmitted extends StatelessWidget {
  reportSubmitted({super.key});
  late BuildContext c;
  @override
  Widget build(BuildContext context) {
    c = context;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Report Submitted")),
      body: Column(children: [
        Text("Thank you for submitting the report."),
        ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Back"))
      ])
    );
  }
  
} */