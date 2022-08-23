import 'package:client/pages/all_sections.dart';
import 'package:client/pages/popular_sections.dart';
import 'package:client/pages/profile.dart';
import 'package:client/pages/saved_sections.dart';
import 'package:client/pages/section_details.dart';
import 'package:client/pages/sucessfull_order.dart';
import 'package:flutter/material.dart';
import 'package:client/pages/home.dart';
import 'package:client/pages/loading.dart';
import 'package:client/pages/map.dart';

import 'main_screen.dart';


void main() => runApp(MaterialApp(
    initialRoute: '/map',
    routes: {
      '/': (context) => Loading(),
      '/main_screen': (context) => MainScreen(),
      '/home': (context) => Home(),
      '/all_sections': (context) => AllSections(),
      '/saved': (context) => SavedSections(),
      '/popular': (context) => PopularSections(),
      '/section_details': (context) => SectionDetails(),
      '/sucessfull_order': (context) => OrderSucceful(),
      '/profile': (context) => Profile(),
      '/map': (context) => Map(),
    }
));