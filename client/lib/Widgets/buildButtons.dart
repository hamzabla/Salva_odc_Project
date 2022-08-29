import 'package:flutter/material.dart';

class buildButtons extends StatefulWidget {

  @override
  _buildButtonsState createState() => _buildButtonsState();
}

class _buildButtonsState extends State<buildButtons> {

  bool isFavorite = false;
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            isFavorite = !isFavorite;
            setState(() {
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
            setState(() { });
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