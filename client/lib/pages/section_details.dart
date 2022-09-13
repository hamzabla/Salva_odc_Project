import 'dart:convert';

import 'package:client/pages/loading.dart';
import 'package:client/api_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../Widgets/buildButtons.dart';
import '../config.dart';


class SectionDetails extends StatefulWidget {
  @override
  _SectionDetailsState createState() => _SectionDetailsState();
}

class _SectionDetailsState extends State<SectionDetails> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Map data ={};

  String id_section = "";
  var currentUser;
  var pic;
  var review = TextEditingController();
  var count = 0;
  String liked = "0";
  String saved = "0";

  insertReview() async {
    var url = Uri.http(Config.apiURL, Config.reveiwsAPI);

    Map<String,String> headers = {'Content-Type':'application/json'};
    final msg = jsonEncode({
      "Body": review.text,
      "ReviewOwner": currentUser['data']['userName'],
      "rating":"3",
      "id_section": id_section
    });
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
      body: msg,
      headers: headers,
    );
    //print(response.body);
    return response;
  }



  //getingReviewsBysection
  getingReviewsBysection() async {
    await getInterestById();

    var url = Uri.http(Config.apiURL, '/api/v1/reviews/section/${id_section}');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body);
      this.count = data['count'];
      return data['data']['reviews']!;
    }
    else {
      return 'Request failed with status: ${response.statusCode}.';
      //print('Request failed with status: ${response.statusCode}.');
    }
  }

  getInterestById() async {
    var user_id=currentUser['data']['id'];
    var section_id= id_section;
    var url = Uri.http(Config.apiURL, "${Config.interestAPI}${user_id}${section_id}");
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    //print("${current['data']} hani");
    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body);
      liked= data["data"]["like"];
      saved =data["data"]["save"];
      return data['data']!;

    }
    else {
      return 'Request failed with status: ${response.statusCode}.';
      //print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {

     data = ModalRoute.of(context)!.settings.arguments as Map;
     String stringTags = '${data['tags']}';
     String stringlocation = '${data['adress']}';
     pic = data['picture'];
     id_section = data['id'];
     currentUser=data['current'];

     //split string
     var arr = stringTags.split(',');
     var arr2 = stringlocation.split(',');




    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Color(0xffF2F3F3),
      appBar: AppBar(
        title: const Text('Section details',
            style: TextStyle( color: Color(0xff073983),)),
        backgroundColor: Colors.white70,
      ),
      body:  Container(
        child: FutureBuilder(
          future: getingReviewsBysection(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              //print('${snapshot.data} data ins section_details ');
              return
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            buildImage(pic),
                            Positioned(top: 255, left: 280, child: buildButtons(liked,saved,currentUser['data']['id'],id_section)),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Tags(arr),
                        SizedBox(
                          height: 20,
                        ),
                        Title(),
                        SizedBox(
                          height: 20,
                        ),
                        Infos(arr2,count),
                        SizedBox(
                          height: 20,
                        ),
                        Description(),
                        SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        addReview(context,review),
                        SizedBox(
                          height: 20,
                        ),
                        for(var i=0;i<count;i++)
                          Reviews(snapshot.data,i),
                      ],
                    );
                  },
                );
            } else { return Loading();}
          },
        ),
      ),

    );


  }









  Widget Reviews(data,index) {

    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0,bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff072983),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                child: Row(
                  children: [
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: CircleAvatar(
                          backgroundImage:
                          NetworkImage('https://placeimg.com/640/480/people'),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${data[index]['ReviewOwner']}',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Color(0xffF2F3F3),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 150.0,bottom: 15.0),
                child: Text(
                  '${data[index]['Body']}',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffF2F3F3),
                  ),
                ),
              ),
             Modifications(data,index),
            ]),
      ),
    );


  }


  Widget Modifications(data,index) {

    if(currentUser['data']['userName']==data[index]['ReviewOwner'])
           return  Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit,color: Color(0xffF2F3F3),),
                  onPressed: () {  },),
                IconButton(
                  icon: Icon(Icons.delete,color: Color(0xffF2F3F3),),
                  onPressed: () {  },)
              ],);
    else{
      return Container();
  }}




  Widget addReview(BuildContext context, review) {

    return InkWell(
      onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Your review matter'),
            content: TextFormField(
              autofocus: true,
              decoration: InputDecoration(hintText: "add review here ..."),
              validator: (value){
              if(value == null){
                return "add review ";
              }
              return null;
            },
              controller: review,
            ),
            actions: [
              TextButton(onPressed:(){
                if(!review.toString().isEmpty){
                  insertReview();
                  Navigator.of(context).pop(review.text);
                  Navigator.pushReplacementNamed(context, "/section_details",arguments: {
                    'title': data["title"],
                    'tags': data["tags"],
                    'picture': data["picture"],
                    'adress': data["adress"],
                    'description': data["description"],
                    'id': data["id"],
                    'current': currentUser,
                  });
                }

                },
                  child: Text("Submit")),
            ],
          )),

        child: Padding(
          padding: const EdgeInsets.only(right: 14.0,left: 14.0),
          child: Container(
            width: 370,
            decoration: BoxDecoration(
              color: Color(0xff072983),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0,top: 10.0,left: 14.0),
              child: Text(
                textAlign: TextAlign.left,
                'add review...',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffF2F3F3),
                ),
              ),
            ),
          ),
        ),
    );
  }

  Widget Description() {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
      child: Text(
        "${data['description']}",
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xff072983).withOpacity(0.6),
        ),
      ),
    );
  }

  Widget Infos(arr,count) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20.0,
        left: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Color(0xff072983),
                size: 12,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '${arr[0]}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff072983),
                ),
              ),
              SizedBox(
                width: 150,
              ),
              Icon(
                Icons.comment_bank_outlined,
                color: Color(0xff072983),
                size: 12,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '${count} reviews',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff072983),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.star_border_outlined,
                color: Color(0xff072983),
                size: 12,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '4.5',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff072983),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Title() {
    return Padding(
      padding: const EdgeInsets.only(right: 160.0),
      child: Text(
        '${data['title']}',
        style: GoogleFonts.poppins(
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0.0, 0.0),
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4.0,
            )
          ],
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xff072983),
        ),
      ),
    );
  }

  Widget buildImage(pic) {

    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Image.network(
          '${pic}',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ));
  }



  Widget Tags(arr) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
      child: Row(
        children: [
      for (var i = 0; i < arr.length; i++)
        Container(
          height: 25,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF2F3F3)),
            color: Color(0xff072983),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              "#${arr[i]}",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xffF2F3F3),
              ),
            ),
          ),
        ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }


}





