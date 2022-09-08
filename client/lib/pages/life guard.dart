import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../config.dart';
import 'package:http/http.dart' as http;

class lifeguard extends StatefulWidget {
  @override
  State<lifeguard> createState() => _lifeguardState();
}

class _lifeguardState extends State<lifeguard> {
  Map data = {};
  var formKey = GlobalKey<FormState>();
  TextEditingController date_start = TextEditingController();
  TextEditingController date_end = TextEditingController();

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  String username = '';
  String email = '';
  String phone = '';
  String password = '';
  String role = '';
  String fullname = '';

  var location = TextEditingController();

  addLifeguard() async {
    var url = Uri.http(Config.apiURL, "${Config.lifeguardAPI}");

    Map<String, String> headers = {'Content-Type': 'application/json'};
    print(location);
    print(date_start);
    print(date_end);
    final msg = jsonEncode({
      "workZone": location.text,
      "startTime": date_start.text,
      "EndTime": date_end.text
    });
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(
      url,
      body: msg,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  signupUser() async {

    var url = Uri.http(Config.apiURL, "${Config.authAPI}register");

    Map<String, String> headers = {'Content-Type': 'application/json'};
    print(username);
    print(email);
    print(phone);
    print(password);
    print(role);
    print(fullname);
    final msg = jsonEncode({
      "userName": username,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
      "fullName": fullname,
    });
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(
      url,
      body: msg,
      headers: headers,
    );
    print(response.body);
    await addLifeguard();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    print("heeere");
    data = ModalRoute.of(context)!.settings.arguments as Map;
    username = data['username'];
    email = data['email'];
    phone = data['phone'];
    password = data['password'];
    role = data['role'];
    fullname = data['fullName'];

    print("buil lifeguard");
    print(username);

    return Scaffold(
        backgroundColor: Color(0xfff2f3f3),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Center(
              child: SafeArea(
                  child: Column(children: [
                SizedBox(height: 50),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/salva-f47c9.appspot.com/o/logo_sans_bg.png?alt=media&token=e099926b-bddd-415e-ad7c-9b8e2fbd78a2",
                  height: 80,
                  width: 72,
                ),
                SizedBox(height: 1),
                Text(
                  "Salva",
                  style: (GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xff073983),
                  )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 130, top: 8, left: 1),
                  child: Text(
                    "CHECK POINT ",
                    style: (GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff073983),
                    )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "you should add a fullname";
                          }
                          return null;
                        },
                        controller: location,
                        autofocus: false,
                        style: (GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffcdbfbf),
                        )),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.47),
                          suffixIcon: Icon(Icons.location_on_outlined),
                          hintText: "Location",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffcdbfbf),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "you should add a fullname";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: date_start,
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2200));

                          if (pickeddate != null) {
                            setState(() {
                              date_start.text =
                                  DateFormat('yyyy-MM-dd').format(pickeddate);
                            });
                          }
                        },
                        style: (GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffcdbfbf),
                        )),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.47),
                          suffixIcon: Icon(Icons.date_range),
                          hintText: "Start time",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffcdbfbf),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: date_end,
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2200));

                          if (pickeddate != null) {
                            setState(() {
                              date_end.text =
                                  DateFormat('yyyy-MM-dd').format(pickeddate);
                            });
                          }
                        },
                        style: (GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffcdbfbf),
                        )),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.47),
                          suffixIcon: Icon(Icons.date_range),
                          hintText: "End time",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffcdbfbf),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 44, vertical: 12),
                          minimumSize: Size(188, 16),
                          primary: Color(0xff072983),
                          side: BorderSide(width: 1, color: Color(0xff072983)),
                        ),
                        child: Text('Submit',
                            style: (GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Color(0xff072983),
                            ))),
                        onPressed: () {
                        signupUser();
                          Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
                        },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                )
              ])),
            ),
          ),
        ));
  }
}
