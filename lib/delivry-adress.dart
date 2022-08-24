import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class deliveryasress extends StatefulWidget {
  @override
  State<deliveryasress> createState() => _deliveryadressState();
}

class _deliveryadressState extends State<deliveryasress> {
  TextEditingController date = TextEditingController();
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f3f3),

    appBar: AppBar(
    backgroundColor: Color(0xffF2F3F3),
    elevation: 0,

      leading: IconButton(

        icon: Icon(
          Icons.read_more,
          color: Colors.black45,
        ),
        onPressed: () {

        },
      ),
        leadingWidth: 25.5,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black45,
                size: 25.0,
              ))
        ],
      ),


    resizeToAvoidBottomInset: false,
    body: Center(
    child: Container(
    padding: EdgeInsets.only(right: 20, left: 20),
    child: Center(
    child: SafeArea(
    child: Column(
    children: [

    Image.asset("assets/logo_sans_bg.png",
    height: 160, width: 125),
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
    Container(
      height: 130,
    width: 900,
    child: Text(
    "The product will be delivered to your adress ",
    style: (GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Color(0xff073983),
    )),
    ),
    ),

      Text(
        "Fill the form please and confirm your address  ",
        style: (GoogleFonts.poppins(
          fontWeight: FontWeight.w200,
          fontSize: 12,
          color: Color(0xff073983),
        )),
      ),
      SizedBox(height: 20,),
      TextField(

        autofocus: false,
        style: (GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xffcdbfbf),
        )),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.47),
          suffixIcon: Icon(Icons.phone),
          hintText: "Phone",
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
      SizedBox(height: 20,),
      TextField(

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
          hintText: "delivery adress",
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
      SizedBox(height: 30,),
      OutlinedButton(

        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal:44,vertical: 12 ),
          minimumSize: Size(188, 16),
          primary: Color(0xff072983),
          side: BorderSide(width: 1,color: Color(0xff072983)),

        ),


        child: Text('Submit',style: (
            GoogleFonts.poppins(

              fontWeight: FontWeight.w400,
              fontSize: 18
              ,
              color: Color(0xff072983),

            ))),
        onPressed: ()=> {},

      ),


    ],
    ),



    ),
    ),
    ),
    ),
    );
  }
}