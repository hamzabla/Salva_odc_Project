import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/Menu.dart';
import 'constants.dart';

class orderproduct extends StatefulWidget {
  @override
  State<orderproduct> createState() => _orderproductState();
}

class _orderproductState extends State<orderproduct> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Color(0xffF2F3F3),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F3F3),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xff072983),
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        leadingWidth: 25.5,
        actions: [
          IconButton(
              onPressed: () {
                print('notif');
              },
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Color(0xff072983),
                size: 25.0,
              ))
        ],
      ),
      drawer: Menu(),
      body:
     ListView(
       children:[
         SizedBox(height: 15,),
         Padding(
           padding: EdgeInsets.only(left: 20),
           child: Text(
             "ORDER NOW !",
             style: (GoogleFonts.poppins(
               fontWeight: FontWeight.w700,
               fontSize: 20,
               color: Color(0xff072983),
             )),
           ),
         ),
       Stack(

         clipBehavior: Clip.none,

         children: [

           SizedBox(height: 15,),

           Padding(
             padding: EdgeInsets.only(left: 6,right: 6),
             child: Container(
               width: 350,
               height: 266,
               decoration:  BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   gradient: LinearGradient(

                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                     stops: [
                       0.17,
                       0.55,
                       0.84,

                     ],
                     colors: [
                       Color(0xff7fb5ff),
                       Color(0xffc4ddff),
                       Color(0xff7fb5ff),

                     ],
                   )
               ),
               child: Padding(
                 padding: EdgeInsets.only(top: 1,bottom:50 ),
                 child: Image.asset("assets/bracelet.png"),
               ),
             ),
           ),
           Positioned(top: 230,
               child: Padding(
                 padding: EdgeInsets.only(left: 1,right: 1),
                 child: Container(
                   height: 355,
                   width: 360,
                   decoration: BoxDecoration(
                     color: Color(0xfff8f8f8),

                     borderRadius: BorderRadius.circular(20.0),
                   ),
                   child: ListView(

                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Padding(
                               padding: EdgeInsets.only(left:20 ),
                               child: Text(
                                 'Bracelet',
                                 style: (
                                     GoogleFonts.poppins(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 24,
                                       color:Color(0xff072983),
                                     )
                                 ),
                               ),
                             ),
                             SizedBox(width: 180,),
                             Icon(
                               Icons.favorite_border,
                               color: Color(0xff366ed8),
                               size: 30.0,

                             ),
                           ],
                         ),

                       ),
                       SizedBox(height: 5,),
                       Text(
                         'salva your vida,beacuse your live is our priority',
                         style: (
                             GoogleFonts.poppins(

                               fontWeight: FontWeight.w400,
                               fontSize: 12,
                               color:Color(0xff808080),
                             )

                         ),
                       ),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Padding(
                             padding:EdgeInsets.only(left: 20),
                             child: Text(
                               'Price :',
                               style: (
                                   GoogleFonts.poppins(

                                     fontWeight: FontWeight.w500,
                                     fontSize: 16,
                                     color:Color(0xff121212),
                                   )

                               ),
                             ),
                           ),
                           SizedBox(width: 10,)  ,
                           Text(
                             ' 195.00 DH',
                             style: (
                                 GoogleFonts.poppins(

                                   fontWeight: FontWeight.w400,
                                   fontSize: 14,
                                   color:Color(0xff121212),
                                 )

                             ),
                           ),

                         ],
                       ),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,

                         children: [
                           Padding(
                             padding:EdgeInsets.only(left: 20),
                             child: Text(
                               'Quantity :',
                               style: (
                                   GoogleFonts.poppins(

                                     fontWeight: FontWeight.w500,
                                     fontSize: 16,
                                     color:Color(0xff121212),
                                   )

                               ),
                             ),
                           ),
                           SizedBox(width: 10,)  ,
                           Text(
                             ' - 1 +',
                             style: (
                                 GoogleFonts.poppins(

                                   fontWeight: FontWeight.w400,
                                   fontSize: 14,
                                   color:Color(0xff121212),
                                 )

                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 36,),
                       Container(
                         height: 50,
                         width: 300,
                         child: ElevatedButton.icon(onPressed: (){},icon: Icon(Icons.shopping_cart), label:
                         Text('Add to cart',
                           style: (
                               GoogleFonts.poppins(
                                 fontWeight: FontWeight.w400,
                                 fontSize: 14,
                                 color:Color(0xffffffff),
                               )

                           ),
                         ),
                           style:  ElevatedButton.styleFrom(
                             primary: addtocartcolor,
                           ),
                         ),
                       ),
                       SizedBox(height: 15,),
                       Padding(
                         padding: EdgeInsets.only(right: 210),
                         child: Text(
                           'testimony',
                           style: (
                               GoogleFonts.poppins(

                                 fontWeight: FontWeight.w500,
                                 fontSize: 14,
                                 color:Color(0xff000000),

                               )
                           ),

                         ),
                       ),
                       SizedBox(height: 15,),
                       testimony(),
                       testimony(), testimony(), testimony(), testimony(), testimony(),
                     ],
                   ),
                 ),
               )),


         ],


       ),

       ],

  ),
    );
  }
}



Widget testimony (){
  return Container(
    height: 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                      NetworkImage('https://gulfbusiness.com/wp-content/uploads/2022/03/Luzy-Aziz-Image-1.jpeg'),
                    )),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1,right: 40),
                    child: Text(
                      'Riaz Marceloz',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Really good gadget',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ),
                  ),

                ],
              )

            ],
          ),
  );
}

