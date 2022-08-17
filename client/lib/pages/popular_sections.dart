import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/BottomNavbar.dart';
import '../Widgets/Menu.dart';
import '../Widgets/SearchBar.dart';

class PopularSections extends StatefulWidget {

  @override
  _PopularSectionsState createState() => _PopularSectionsState();
}


class _PopularSectionsState extends State<PopularSections> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffF2F3F3),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F3F3),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black45,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
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
      drawer: Menu(),
      body: Stack(
        children: <Widget>[
          SearchBarWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 120.0, horizontal: 25.0),
            child: Row(children: [
              SizedBox(width: 35,),
              Icon(
                Icons.star_border_outlined,
                color: Color(0xff072983),
                size: 22,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'POPULAR',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff072983),
                ),
              ),
              SizedBox(width: 80,),
              ElevatedButton(
                  child: Text(
                    "Add section".toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Color(0xffF2F3F3)),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff072983)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )
                      )
                  ),
                  onPressed: () => null
              ),
            ],),
          ),
          Container(
            margin: EdgeInsets.only(left: 14, top: 180, bottom: 0.50,right: 14),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SectionWidget(),
                      SizedBox(
                        height: 20.0,
                      ),
                      SectionWidget(),
                      SizedBox(
                        height: 20.0,
                      ),
                      SectionWidget(),
                      SizedBox(
                        height: 20.0,
                      ),
                      SectionWidget(),
                      SizedBox(
                        height: 20.0,
                      ),
                      SectionWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}

class SectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 50.0,
        height: MediaQuery.of(context).size.height - 600.0,
        padding: EdgeInsets.all(2.0),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 5,
          child:  Container(
            decoration:BoxDecoration(
                image:  DecorationImage(
                  image: NetworkImage('https://placeimg.com/640/480/nature'),
                  fit: BoxFit.fill, )
            ),
            child: Container(
              margin: EdgeInsets.only(top: 140,left: 15,),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "beach harhoura",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xffFFFFFF),
                        size: 12,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Hoceima, Morocco',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}