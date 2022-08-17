import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/BottomNavbar.dart';
import '../Widgets/Menu.dart';
import '../Widgets/SearchBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      drawer: Menu(), // Drawer
      body: Stack(
        children: <Widget>[
          //searchBar
         SearchBarWidget(),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 120.0, horizontal: 45.0),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_outline_rounded,
                    color: Color(0xff072983),
                    size: 18,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'LIKED BY YOU',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff072983),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 14, top: 150, bottom: 300),
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      LikedWidget(),
                      SizedBox(
                        width: 20.0,
                      ),
                      LikedWidget(),
                      SizedBox(
                        width: 20.0,
                      ),
                      LikedWidget(),
                      SizedBox(
                        width: 20.0,
                      ),
                      LikedWidget(),
                      SizedBox(
                        width: 20.0,
                      ),
                      LikedWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 400,left: 45, ),
              child: Row(
                children: [
                  Icon(
                    Icons.recommend_outlined,
                    color: Color(0xff072983),
                    size: 18,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'RECOMMENDED FOR YOU',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff072983),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 14, top: 450, bottom: 50),
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      RecommendedWidget(),
                      SizedBox(
                        width: 20.0,
                      ),
                      RecommendedWidget(),
                      SizedBox(
                        width: 20.0,
                      ),
                      RecommendedWidget(),
                      SizedBox(
                        width: 20.0,
                      ),
                      RecommendedWidget(),
                      SizedBox(
                        width: 20.0,
                      ),
                      RecommendedWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // bottom navigation
      bottomNavigationBar: NavBarWidget(), // CurvedNavigationBar
    ); // Scaffold
  }
}








class LikedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width - 50.0,
      height: MediaQuery.of(context).size.height - 200.0,
      padding: EdgeInsets.all(5.0),
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
            margin: EdgeInsets.only(top: 120,left: 15,),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "beach harhoura",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Color(0xffFFFFFF),
                      size: 16,
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


class RecommendedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:  MediaQuery.of(context).size.width - 150.0,
        height: MediaQuery.of(context).size.width - 150.0,
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
                  image: NetworkImage('https://placeimg.com/640/480/animals'),
                  fit: BoxFit.fill, )
            ),
            child: Container(
              margin: EdgeInsets.only(top: 90,left: 15,),
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
