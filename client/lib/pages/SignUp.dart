import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:client/pages/Login.dart';
import 'package:client/Widgets/RadioButton.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import 'constants.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String password = '';
  bool isPasswordVisible = true;
  int _value = 1;

  var formKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var email = TextEditingController();
  var description = TextEditingController();
  String role = 'simple';
  var phone = TextEditingController();
  var fullname = TextEditingController();

  signupUser() async {
    var url = Uri.http(Config.apiURL, "${Config.authAPI}register");

    Map<String,String> headers = {'Content-Type':'application/json'};
    print(username.text);
    print(email.text);
    print(phone.text);
    print(password);
    print(role);
    print(fullname.text);
    final msg = jsonEncode({
      "userName": username.text,
      "email": email.text,
      "phone": phone.text,
      "password": password,
      "role": role,
      "fullName":fullname.text,
    });
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
      body: msg,
      headers: headers,
    );
    print(response.body);
    return response;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [firstColor, secondColor])),
          child: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 20),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/salva-f47c9.appspot.com/o/logo_sans_bg.png?alt=media&token=e099926b-bddd-415e-ad7c-9b8e2fbd78a2" , height: 63,width: 60,),
                  SizedBox(height: 1),
                  Text(
                    "Salva",
                    style: (GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    )),
                  ),
                  SizedBox(height: 20),
                  Form(
                      key: formKey,
                      child: Column(children: [
                        TextFormField(
                          validator: (value){
                            if(value == null){
                              return "you should add a fullname";
                            }
                            return null;
                          },
                          controller: fullname,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: (GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffcdbfbf),
                          )),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.47),
                            hintText: "Fullname",
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
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value == null){
                              return "you should add a username";
                            }
                            return null;
                          },
                          controller: username,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: (GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffcdbfbf),
                          )),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.47),
                            hintText: "Username",
                            //  prefixIcon: Icon(Icons.person_outline),
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
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value){
                            if(value == null){
                              return "you should add an email";
                            }
                            return null;
                          },
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          style: (GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffcdbfbf),
                          )),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.47),
                            hintText: "Email",
                            //  prefixIcon: Icon(Icons.person_outline),
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
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value){
                            if(value == null){
                              return "you should add your phone number";
                            }
                            return null;
                          },
                          controller: phone,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          style: (GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffcdbfbf),
                          )),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.47),
                            hintText: "Phone",
                            //  prefixIcon: Icon(Icons.person_outline),
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
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value){
                            if(value == null){
                              return "you should add a username";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          onChanged: (value) => setState(() => this.password = value),
                          autofocus: false,
                          style: (GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffcdbfbf),
                          )),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.47),
                            hintText: "password",
                            suffixIcon: IconButton(
                              icon: isPasswordVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () => setState(
                                      () => isPasswordVisible = !isPasswordVisible),
                            ),
                            //  prefixIcon: Icon(Icons.person_outline),
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
                          obscureText: isPasswordVisible,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyRadioListTile<int>(
                              value: 3,
                              groupValue: _value,
                              leading: '',
                              title: Text('simple user',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    color: Colors.white,
                                  )),
                              onChanged: (value) => setState(() {
                                _value = value!;
                                role ="simple";
                              }),
                            ),
                            MyRadioListTile<int>(
                              value: 2,
                              groupValue: _value,
                              leading: '',
                              title: Text('life guard',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    color: Colors.white,
                                  )),
                              onChanged: (value) => setState(() {
                                _value = value!;
                                role="lifguard";
                              }),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        if(role=="simple")
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 44, vertical: 12),
                            minimumSize: Size(160, 20),
                            primary: Colors.white,
                            side: BorderSide(width: 1, color: Colors.white),
                          ),
                          child: Text('Sign up',
                              style: (GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ))),
                          onPressed: () {
                            signupUser();
                            Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
                          },
                        ),
                        if(role=="lifguard")
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 44, vertical: 12),
                              minimumSize: Size(160, 20),
                              primary: Colors.white,
                              side: BorderSide(width: 1, color: Colors.white),
                            ),
                            child: Text('Next',
                                style: (GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ))),
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  "/life_guard",
                                  arguments: {
                                'username': username.text,
                                "email": email.text,
                                "phone": phone.text,
                                "password": password,
                                "role": role,
                                "fullName":fullname.text,
                              });
                            },
                          ),
                      ],)),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Already have an account ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.065),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                        onTap: () {Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
                          },
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: RegisterColor,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.065),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}