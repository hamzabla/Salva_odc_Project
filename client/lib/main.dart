import 'package:client/pages/all_sections.dart';
import 'package:client/pages/popular_sections.dart';
import 'package:client/pages/saved_sections.dart';
import 'package:flutter/material.dart';
import 'package:client/pages/home.dart';
import 'package:client/pages/loading.dart';


void main() => runApp(MaterialApp(
    initialRoute: '/popular',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/all_sections': (context) => AllSections(),
      '/saved': (context) => SavedSections(),
      '/popular': (context) => PopularSections(),
    }
));