import 'dart:convert';

import 'package:client/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../config.dart';
import 'constants.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  String password = '';
  bool isPasswordVisible = true;

  var formKey = GlobalKey<FormState>();
  var username = TextEditingController();

  loginUser() async {
    var url = Uri.http(Config.apiURL, "${Config.authAPI}login");

    Map<String,String> headers = {'Content-Type':'application/json'};
    print(username.text);
    print(password);
    final msg = jsonEncode({
      "userName": username.text,
      "password": password,
    });
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
      body: msg,
      headers: headers,
    );
    Map data = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
    currentUser = data['data']['user'];
    }

    return data["success"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            padding: EdgeInsets.only(right:20,left: 20 ),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [firstColor, secondColor])),
            child: Center(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Image.network("https://firebasestorage.googleapis.com/v0/b/salva-f47c9.appspot.com/o/logo_sans_bg.png?alt=media&token=e099926b-bddd-415e-ad7c-9b8e2fbd78a2",height: 128,width: 118,),
                    SizedBox(height: 1),
                    Text(
                      "Salva",
                      style: (GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                        color: Colors.white,
                      )),
                    ),
                    SizedBox(height: 40),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
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
                              decoration:InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.47),
                                hintText: "Username",
                                contentPadding: const EdgeInsets.symmetric(vertical:  15.0, horizontal: 10.0),
                                hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xffcdbfbf),
                                ),
                                enabledBorder:  OutlineInputBorder(
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

                            TextField(
                              keyboardType: TextInputType.text,
                              onChanged: (value) => setState(() => this.password = value),
                              autofocus: false,
                              style: (GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffcdbfbf),
                              )),
                              decoration:InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.47),
                                hintText: "password",
                                suffixIcon: IconButton(
                                  icon: isPasswordVisible
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () =>
                                      setState(() => isPasswordVisible = !isPasswordVisible),
                                ),
                                //  prefixIcon: Icon(Icons.person_outline),
                                contentPadding: const EdgeInsets.symmetric(vertical:  15.0, horizontal: 10.0),

                                hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xffcdbfbf),
                                ),
                                enabledBorder:  OutlineInputBorder(
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
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(right: 190,top: 8),
                              child: Text(
                                "Forget password ?",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(1),fontWeight: FontWeight.w200,letterSpacing: -0.1),
                              ),
                            ),
                            SizedBox(height: 80),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal:44,vertical: 12 ),
                                minimumSize: Size(160, 20),
                                primary: Colors.white,
                                side: BorderSide(width: 1,color: Colors.white),
                              ),

                              child: Text('Log in',style: (
                                  GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ))),
                              onPressed: () {
                                void submit() async {
                                  final logged = await loginUser();
                                  if(logged){
                                    Navigator.of(context).pushNamedAndRemoveUntil("/main_screen",(route) => false);}
                                  else{
                                    print('invlaid user creds');
                                  }
                                }
                                return submit();

                              },

                            ),
                          ],
                        )),
                    SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text(
                          "Don't have an account ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w400,letterSpacing: 0.065),
                        ),
                        SizedBox(width: 2,),
                        InkWell(
                          onTap: ()=>
                              Navigator.of(context).pushNamedAndRemoveUntil("/signup", (route) => false),
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: RegisterColor,fontWeight: FontWeight.w400,letterSpacing: 0.065),
                          ),
                        ),
                      ],

                    )


                  ],

                ),
              ),
            ),
          ),
        )
    );

  }
}