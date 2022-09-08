import 'package:client/pages/all_sections.dart';
import 'package:client/pages/home.dart';
import 'package:client/pages/popular_sections.dart';
import 'package:client/pages/profile.dart';
import 'package:client/pages/saved_sections.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex = 0;

  final screen = [
    Home(),
    AllSections(),
    SavedSections(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        items: [
          Icon(Icons.home_outlined),
          Icon(Icons.star_border),
          Icon(Icons.bookmark_outline_outlined),
          Icon(Icons.person_outline),
        ],
        onTap: (index){
            setState(() {
              selectedIndex = index;
            });
        },
        animationCurve: Curves.easeInOut,
        backgroundColor: Color(0xffF2F3F3),
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),
      ),

      body: screen[selectedIndex],
    );
  }
}
