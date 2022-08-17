import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 29, vertical: 30),
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff0A0A0A).withOpacity(0.2),
            spreadRadius: 0.05,
            blurRadius: 20,
            offset: Offset(5.0, 5.0),
          )
        ],
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(28),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search beach",
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}