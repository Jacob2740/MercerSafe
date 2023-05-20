// ignore: file_names
//IMPORTS///////////////////////////////////////////////////////////////////////
import 'colors_mercer_official.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

//GLOBAL VARIABLES//////////////////////////////////////////////////////////////
List<Widget> regisList = [];
const int initialIndex=3;

//FUNCTIONS/////////////////////////////////////////////////////////////////////
void loadReg() async {
  regisList = await returnItemsList();
}

Future<List<Widget>> returnItemsList() async{
  try {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (error) {
    throw Exception("There was an error loading Firebase.");
  }

  CollectionReference reg = FirebaseFirestore.instance.collection('incidentLog');
    List<Column> containers= [];
    QuerySnapshot registrySnapshot = await reg.get();

    for (QueryDocumentSnapshot doc in registrySnapshot.docs) {
        // Access the data in each document
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        if(data["description"] != null){
          containers.add(Column(
          children: [
            const Text("\n"),
            Text("Description: ${data['description']}", style:TextStyle(color: mercerWhite)),
            Text("Incident Type: ${data['incidentType']}", style:TextStyle(color: mercerWhite)),
            Text("Location: ${data['location']}", style:TextStyle(color: mercerWhite)),
            const Text("\n"),
            Text("------------------------------------------------------------------------------------------------", style:TextStyle(color: mercerWhite)),
          ],
          ));
        }
    }
    return containers;
  }

//CLASSES///////////////////////////////////////////////////////////////////////
class RegistryView extends StatefulWidget {
  const RegistryView({super.key});
   
  @override
  Registry createState() {
    return Registry();
  }

  } //end of RegistryView

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
            Expanded(child: ListView(
              children: regisList,
              //returnItemsList() as List<Widget>,
            )),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, 'reportIncident'),
                        child: const Text("Back to Report"))),

              ],
            )
          ],
        ),
        bottomNavigationBar: const BottomNav(initialIndex));

        
  }

} //end of Registry

//END OF registry.dart//////////////////////////////////////////////////////////