import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:untitled/Screens/UserProfile.dart';
import 'SettingsScreen.dart';
import 'package:untitled/Screens/Calculators.dart';


class MainPage  extends StatefulWidget {


  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  final List<Widget> _children=[
    Calcs(),
    Profile(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,

      body:_children[_selectedIndex],


      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber ,
        unselectedLabelStyle: TextStyle(fontSize: 10),
        selectedLabelStyle: TextStyle(fontSize: 14) ,
        iconSize: 30,
        unselectedItemColor: Colors.white38,
        backgroundColor: Colors.indigo,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded,),
              label: 'Home',

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label: 'Profile',

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings,),
            label: 'Settings',
          ),

        ],
      ),
    );
  }
}

