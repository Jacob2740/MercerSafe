// ignore: file_names
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';

List<Widget> regisList = [];
const int initialIndex=3;

void loadReg() async {
  regisList = await returnItemsList();
}


Future<List<Widget>> returnItemsList() async{
  try {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (error) {
    print("Error occurred with Firebase.");
  }
  
  print("Running Function");
  CollectionReference reg = FirebaseFirestore.instance.collection('incidentLog');
  final storageRef = FirebaseStorage.instance.ref();
  final imgs = storageRef.child("img");
  final johndoe = await imgs.child("johndoe.jpeg").getDownloadURL();
    List<Column> containers= [];
    QuerySnapshot registrySnapshot = await reg.get();
    //QuerySnapshot registrySnapshot = await reg.collection("incidentLog");
    //final allData = registrySnapshot.docs.map((doc) => doc.data()).toList();
    for (QueryDocumentSnapshot doc in registrySnapshot.docs) {
        // Access the data in each document
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // Use the data as needed
        // ignore: avoid_print
        //print(data);

        if(data["description"] != null){
          containers.add(Column(
          children: [
            ///Container(height: 160, width: 90, child: Image.network(johndoe, fit: BoxFit.fill)),
            Text("\n"),
            Text("Description: ${data['description']}", style:TextStyle(color: mercerWhite)),
            Text("Incident Type: ${data['incidentType']}", style:TextStyle(color: mercerWhite)),
            Text("Location: ${data['location']}", style:TextStyle(color: mercerWhite)),
            Text("\n"),
            Text("------------------------------------------------------------------------------------------------", style:TextStyle(color: mercerWhite)),
          ],
          ));
        }
    }
    return containers;
  }

class RegistryView extends StatefulWidget {
  const RegistryView({super.key});
   
  @override
  Registry createState() {
    return Registry();
  }

  }

class Registry extends State<RegistryView>{
  late BuildContext c;
  bool loading = true;
  @override
  void initState() {
      super.initState();
      loadReg();
      
    }
  
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    build(context);
  }
   
  
  @override
  Widget build(BuildContext context) {
   
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
        setState(() {
          loading = false;
        });
      });
    c = context;
    if (loading) return const CircularProgressIndicator();

    return Scaffold(
          appBar: AppBar(title: const Text("Registry")),
          body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: const <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 2,10),
                  )
            ]),
            Expanded(child: Container(child: ListView(
              children: regisList,
              //returnItemsList() as List<Widget>,
            ))),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: ElevatedButton(
                        onPressed: back, child: const Text("Back to Report"))),

              ],
            )
          ],
        ),
        bottomNavigationBar: const bottomNav(initialIndex));

        
  }
  void back() {
    Navigator.pop(c);
  }
  
  
}