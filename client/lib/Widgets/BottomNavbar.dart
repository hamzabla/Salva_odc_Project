
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../pages/all_sections.dart';
import '../pages/home.dart';
import '../pages/popular_sections.dart';
import '../pages/saved_sections.dart';


class NavBarWidget extends StatefulWidget {


  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {

  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int selectedIndex = 0;

  final screen = [
    Home(),
    PopularSections(),
    SavedSections(),
    AllSections(),
  ];

  @override
  Widget build(BuildContext context) {
    return  CurvedNavigationBar(
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
    );
  }
}