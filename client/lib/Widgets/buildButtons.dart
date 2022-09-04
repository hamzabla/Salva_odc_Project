import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../config.dart';

class buildButtons extends StatefulWidget {
  late  String liked;
  late String saved;
  late String user_id;
  late String section_id;
   buildButtons(this.liked,this.saved, this.user_id,this.section_id);

  @override
  _buildButtonsState createState() => _buildButtonsState();
}

class _buildButtonsState extends State<buildButtons> {

  interestsUser() async {
    var url = Uri.http(Config.apiURL, "${Config.interestAPI}check/${widget.user_id}${widget.section_id}");

    Map<String,String> headers = {'Content-Type':'application/json'};
    final msg = jsonEncode({
      "id_user": widget.user_id,
      "id_section": widget.section_id,
      "like": widget.liked,
      "save": widget.saved
    });
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
      body: msg,
      headers: headers,
    );
    print("${response.body} response.body in interests");
    return response;
  }


  /*getInterestById() async {
    var url = Uri.http(Config.apiURL, "${Config.interestAPI}${widget.user_id}${widget.section_id}");
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    //print("${current['data']} hani");
    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body);
      widget.liked= data["data"]["like"];
      widget.saved =data["data"]["save"];
      return data['data']!;

    }
    else {
      return 'Request failed with status: ${response.statusCode}.';
      //print('Request failed with status: ${response.statusCode}.');
    }
  }*/



  @override
  Widget build(BuildContext context)  {


     print("${widget.liked}");
    bool isFavorite = (widget.liked=="0") ? false : true;
    bool isSaved = (widget.saved=="0") ? false : true;

    return Row(
      children: [
        InkWell(
          onTap: () {
            isFavorite = !isFavorite;
            setState(() {
              if(isFavorite){
                widget.liked="1";
                interestsUser();
              }else{
                widget.liked="0";
                interestsUser();
              }
            });
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xff072983),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: isFavorite ? Icon(
              Icons.favorite,
              color: Color(0xffff4578),
            ): Icon(
                Icons.favorite,
            color: Color(0xFFF2F3F3)),
          ),
          ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            isSaved = !isSaved;
            setState(() {
              if(isSaved){
                widget.saved="1";
                interestsUser();
              }else{
                widget.saved="0";
                interestsUser();
              }
            });
    },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xff072983),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child:isSaved ? Icon(
              Icons.bookmark,
              color: Color(0xffFEE2C5),
              size: 28,
            ): Icon(
              Icons.bookmark_outline,
              color: Color(0xffF2F3F3),
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}