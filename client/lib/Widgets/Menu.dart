import 'package:flutter/material.dart';

class Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffF2F3F3),
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                  child: Text(
                    'S A L V A',
                    style: TextStyle(fontSize: 35),
                  )), // Text // Center
            ), // DrawerHeader
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text(
                'ALL',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                print('hey');
              },
            ),
            ListTile(
              leading: Icon(Icons.star_border_outlined),
              title: Text(
                'POPULAR',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline_outlined),
              title: Text(
                'ADD SECTION',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart_sharp),
              title: Text(
                'ORDER PRODUCT',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_outline_outlined),
              title: Text(
                'SAVED',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'LOGOUT',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}