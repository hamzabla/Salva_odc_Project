import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';



class lifeguard extends StatefulWidget {
  @override
  State<lifeguard> createState() => _lifeguardState();
}

class _lifeguardState extends State<lifeguard> {
  TextEditingController date = TextEditingController();
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f3f3),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Center(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Image.network("https://firebasestorage.googleapis.com/v0/b/salva-f47c9.appspot.com/o/logo_sans_bg.png?alt=media&token=e099926b-bddd-415e-ad7c-9b8e2fbd78a2" , height: 80,width: 72,),
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
                      padding:
                      const EdgeInsets.only(right: 130, top: 8, left: 1),
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
                    TextField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: date,

                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2200));

                        if (pickeddate != null) {
                          setState(() {
                            date.text =
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
                    TextField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: date,

                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2200));

                        if (pickeddate != null) {
                          setState(() {
                            date.text =
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
                    SizedBox(height:  35,),

                  ],
                ),



              ),
            ),
          ),
        ));
  }
}