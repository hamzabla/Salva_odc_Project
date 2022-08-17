
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class NavBarWidget extends StatefulWidget {


  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: navigationKey,
      backgroundColor: Color(0xffF2F3F3),
      color: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      onTap: (index) {
        print(index);
      },
      items: [
        Icon(Icons.home_outlined),
        Icon(Icons.star_border),
        Icon(Icons.bookmark_outline_outlined),
        Icon(Icons.person_outline),
      ],
    );
  }
}