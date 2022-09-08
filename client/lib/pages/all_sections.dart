import 'package:client/api_services.dart';
import 'package:client/config.dart';
import 'package:client/pages/addsection.dart';
import 'package:client/pages/loading.dart';



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../Widgets/Menu.dart';
import '../Widgets/SearchBar.dart';
import '../shared_services.dart';



class AllSections extends StatefulWidget {

  @override
  _AllSectionsState createState() => _AllSectionsState();

}

class _AllSectionsState extends State<AllSections> {
  var count = 0;
  var current;

  getAllSections() async {
    var url = Uri.http(Config.apiURL, Config.sectionAPI);
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    current = await APIServices.getUserProfile();
    //print("${current['data']} hani");
    if (response.statusCode == 200) {
      //print(response.body);
      Map data = convert.jsonDecode(response.body);
      this.count = data['count'];
      //print(data['data']['sections']);
      return data['data']['sections']!;

    }
    else {
      return 'Request failed with status: ${response.statusCode}.';
      //print('Request failed with status: ${response.statusCode}.');
    }
  }



  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

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
                const EdgeInsets.symmetric(vertical: 120.0, horizontal: 15.0),
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                ),
                Icon(
                  Icons.dashboard,
                  color: Color(0xff072983),
                  size: 18,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'ALL SECTIONS',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff072983),
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                ElevatedButton(
                    child: Text(
                      "Add section".toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffF2F3F3)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff072983)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))),
                    onPressed: () {
                    //Navigator.pushNamed(context, "/add_section")// ),
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => addsection()));
                    }
                )],
            ),
          ),
          Container(
              margin:
                  EdgeInsets.only(left: 14, top: 180, bottom: 0.50, right: 14),
              child: FutureBuilder(
                future: getAllSections(),
                builder: (context, snapshot){
                  if(snapshot.data != null){
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: count,
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

  Widget SectionWidget(data,index){
    return InkWell(
      onTap: () => Navigator.pushNamed(
          context, "/section_details", arguments: {
        'title': data[index]["Title"],
        'tags': data[index]["Tags"],
        'picture': data[index]["Picture"],
        'adress': data[index]["Adress"],
        'description': data[index]["Description"],
        'id': data[index]["id"],
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
                        "${data[index]["Adress"]}",
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


