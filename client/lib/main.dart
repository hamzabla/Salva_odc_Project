import 'package:client/pages/Login.dart';
import 'package:client/pages/SignUp.dart';
import 'package:client/pages/addsection.dart';
import 'package:client/pages/all_sections.dart';
import 'package:client/pages/order_product.dart';
import 'package:client/pages/life%20guard.dart';
import 'package:client/pages/popular_sections.dart';
import 'package:client/pages/profile.dart';
import 'package:client/pages/saved_sections.dart';
import 'package:client/pages/section_details.dart';
import 'package:client/pages/sucessfull_order.dart';
import 'package:client/shared_services.dart';
import 'package:flutter/material.dart';
import 'package:client/pages/home.dart';
import 'package:client/pages/loading.dart';
import 'package:client/pages/map.dart';

import 'main_screen.dart';

String _defaultHome = '/login';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

      bool _result = await SharedService.isLoggedIn();
      if (_result) {
            _defaultHome =  '/main_screen';
      }
 runApp(MaterialApp(
    initialRoute: _defaultHome,
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
      '/signup': (context) => SignUp(),
      '/life_guard': (context) => lifeguard(),
      '/add_section': (context) => addsection(),
      '/order_product':(context) => deliveryAdress(),
      '/login':(context) => SignIn(),

    }
));
}