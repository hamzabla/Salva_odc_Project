import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/BottomNavbar.dart';
import '../Widgets/Menu.dart';
import '../Widgets/SearchBar.dart';
import '../api_services.dart';
import '../config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'loading.dart';

class SavedSections extends StatefulWidget {
  @override
  _SavedSectionsState createState() => _SavedSectionsState();
}

class _SavedSectionsState extends State<SavedSections> {
  var countSaved = 0;
  var current;

  getAllInterestByUser() async {
    current = await APIServices.getUserProfile();
    var user_id=current['data']['id'];
    var url = Uri.http(Config.apiURL, "${Config.interestAPI}save/${user_id}");
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    //print("${current['data']} hani");
    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body);
      countSaved= data['countSaved'];
      print("${countSaved} saved number in getAllInterestByUser");
      print("${data['data']} data in getAllInterestByUser");
      return data['data']!;

    }
    else {
      return 'Request failed with status: ${response.statusCode}.';
      //print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



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
            padding:
                const EdgeInsets.symmetric(vertical: 130, horizontal: 25.0),
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                ),
                Icon(
                  Icons.bookmark_outline,
                  color: Color(0xff072983),
                  size: 18,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'SAVED',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff072983),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 14, top: 180, bottom: 0.50,right: 14),
                  child: FutureBuilder(
                    future: getAllInterestByUser(),
                    builder: (context, snapshot){
                      if(snapshot.data != null){
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: countSaved,
                          itemBuilder: (context,index){
                            return SectionWidget(snapshot.data,index);
                          },
                        );
                      } else { return Loading();}
                    },
                  )),
        ],
      ),
    );
  }



  Widget SectionWidget(data,index) {

    return  InkWell(
      onTap: () => Navigator.pushNamed(
          context, "/section_details", arguments: {
        'title': data[index]["Title"],
        'tags': data[index]["Tags"],
        'picture': data[index]["Picture"],
        'adress': data[index]["Adress"],
        'description': data[index]["Description"],
        'id': data[index]["id_section"],
        'current': current,
      }),
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
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://placeimg.com/640/480/nature'),
                  fit: BoxFit.fill,
                )),
            child: Container(
              margin: EdgeInsets.only(
                top: 140,
                left: 15,
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data[index]["Title"]}",
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
                        '${data[index]["Adress"]}',
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

