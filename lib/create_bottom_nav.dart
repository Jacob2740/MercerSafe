//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'colors_mercer_official.dart';

//CLASSES///////////////////////////////////////////////////////////////////////
//BottomNav is Stateful. It calls on _BottomNavState
class BottomNav extends StatefulWidget {
  final int initialIndex; //determines which icon the bottom navigator will start on

  //constructor
  const BottomNav(this.initialIndex, {super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
} //end of BottomNav

//_BottomNavState returns a BottomNavigatorBar that makes the UI for the bottom menu
// ignore: camel_case_types
class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0; //start the app with the 'Home' icon highlighted

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.initialIndex;

    //makes the UI for the bottom menu
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[

        //create the 'Home' icon
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: 'Home',
          backgroundColor: mercerBlack,
        ),

        //create the 'Campus Map' icon
        BottomNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            label: 'Map',
            backgroundColor: mercerBlack),

        //create the 'General Safety Info' icon
        BottomNavigationBarItem(
            icon: const Icon(Icons.info_outline),
            label: 'Info',
            backgroundColor: mercerBlack),

        //create the 'Registry' icon
        BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book_outlined),
            label: 'Registry',
            backgroundColor: mercerBlack),

        //create the 'Call MERPO' icon
        BottomNavigationBarItem(
            icon: const Icon(Icons.ad_units_outlined),
            label: 'Call',
            backgroundColor: mercerBlack),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: mercerOrange,
      onTap: _onItemTapped,
    );
  }

  //FUNCTIONS///////////////////////////////////////////////////////////////////

  //when an icon is tapped, highlight the tapped icon and change _selectedIndex to the highlighted icon's index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    //depending on the current value for _selectedIndex, navigate to the highlighted icon's corresponding page
    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, 'home');
        break;
      case 1:
        Navigator.pushNamed(context, 'campusMap');
        break;
      case 2:
        Navigator.pushNamed(context, 'genSafetyInfo');
        break;
      case 3:
        Navigator.pushNamed(context, 'registry');
        break;
      case 4:
        Navigator.pushNamed(context, 'callButton');
        break;
    }
  }
} //end of _BottomNavState

//END OF create_bottom_nav.dart/////////////////////////////////////////////////
