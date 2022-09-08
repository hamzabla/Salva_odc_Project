import 'dart:convert';

import 'package:client/pages/all_sections.dart';
import 'package:client/api_services.dart';
import 'package:client/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../config.dart';
import '../main_screen.dart';
import '../shared_services.dart';

class Menu extends StatelessWidget {
var current;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffF2F3F3),
        child: FutureBuilder(
          future: APIServices.getUserProfile(),
          builder: (context,snapshot){
    if(snapshot.data != null){
       current = snapshot.data;
      return ListView(
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
                'HOME',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    // Create the SelectionScreen in the next step.
                    MaterialPageRoute(builder: (context) => MainScreen()));
              }
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
            title: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/order_product");
              },
              child: Text(
                'ORDER PRODUCT',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.bookmark_outline_outlined),
            title: Text(
              'SAVED',
              style: TextStyle(fontSize: 20),
            ),
          ),
          if(current['data']['role']=="lifguard")
          ListTile(
            leading: Icon(Icons.map),
            title: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/map");
              },
              child: Text(
                'SEE THE MAP',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: InkWell(
              onTap: (){
                SharedService.logout(context);
              },
              child: Text(
                'LOGOUT',
                style: TextStyle(fontSize: 20),

              ),
            ),
          ),
        ],
      );
    }
    else {
      return Container();
    }
          }
        ),
      ),
    );
  }
}