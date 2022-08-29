import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async{
    /*var url =
    Uri.http('192.168.11.102:5000', '/api/v1/users/', {'q': '{http}'});*/

    var url =
    Uri.http('192.168.11.102:5000', '/api/v1/users/');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      Map data = convert.jsonDecode(response.body);
      List list = data['data']['users'];
      list.forEach((element) =>
          print(element['userName'])
      );
      //print(data['data']['users']);
      //var jsonResponse =convert.jsonDecode(response.body) as Map<String, dynamic>;
      //var itemCount = jsonResponse['totalItems'];
      //print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}