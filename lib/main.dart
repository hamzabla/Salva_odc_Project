



import 'package:flutter/material.dart';
import 'package:salva/SignUp.dart';
import 'package:salva/addsection.dart';
import 'package:salva/life%20guard.dart';


import 'Sign In.dart';
import 'delivry-adress.dart';
import 'order product.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/orderproduct',
    routes: {
      '/Sign In': (context) =>  SignIn(),
      '/sign Up':(context)=>SignUp(),
      '/addsection':(context)=>addsection(),
      '/lifeguard':(context)=>lifeguard(),
      '/deliveryadress':(context)=>deliveryasress(),
          '/orderproduct':(context)=>orderproduct()

    }
));
