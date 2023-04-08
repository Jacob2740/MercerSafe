import 'package:flutter/material.dart';
import 'colors_mercer_official.dart';

class bottomNav extends StatefulWidget {
  final int initialIndex;
  const bottomNav(this.initialIndex, {super.key});

  @override
  State<bottomNav> createState() => _bottomNavState();
}

// ignore: camel_case_types
class _bottomNavState extends State<bottomNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.initialIndex;
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: 'Home',
          backgroundColor: mercerBlack,
        ),
        BottomNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            label: 'Map',
            backgroundColor: mercerBlack),
        BottomNavigationBarItem(
            icon: const Icon(Icons.info_outline),
            label: 'Info',
            backgroundColor: mercerBlack),
        BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book_outlined),
            label: 'Registry',
            backgroundColor: mercerBlack),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        print("Go to registry log");
        break;
      case 4:
        Navigator.pushNamed(context, 'callButton');
        break;
    }
  }
}
