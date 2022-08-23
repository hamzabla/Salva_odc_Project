import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../Widgets/Menu.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final double coverHeight = 180;
  final double profilHeight = 115;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profilHeight / 2;

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
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              buildCoverImage(),
              Positioned(top: top, child: buildProfileImage()),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Infos(),
          SizedBox(
            height: 30,
          ),
          Text(
            'Other ways to find us',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff072983),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Color(0xff8C7A7A),
          ),
          SizedBox(height: 12,),
          IconsWidgets(),
          SizedBox(height: 12,),
          Divider(
            color: Color(0xff8C7A7A),
          ),
          SizedBox(height: 12,),
          HelpWidgets(),
        ],
      ),
    );
  }

  Widget HelpWidgets() => Row(
    children: [
      SizedBox(width: 80,),
      Icon(
        FontAwesomeIcons.handsHelping,
        color: Color(0xff072983),
        size: 15,
      ),
      SizedBox(width: 25,),
      Text(
        'Help and feedback',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Color(0xff072983),
        ),
      ),
      SizedBox(
        width: 25,
      ),
      Icon(
        FontAwesomeIcons.share,
        color: Color(0xff072983),
        size: 15,
      ),
    ],
  );

  Widget IconsWidgets() => Row(
        children: [
          SizedBox(width: 50,),
          Icon(
            FontAwesomeIcons.facebook,
            color: Color(0xff072983),
            size: 35,
          ),
          SizedBox(
            width: 50,
          ),
          Icon(
            FontAwesomeIcons.instagram,
            color: Color(0xff072983),
            size: 35,
          ),
          SizedBox(
            width: 50,
          ),
          Icon(
            FontAwesomeIcons.twitter,
            color: Color(0xff072983),
            size: 35,
          ),
          SizedBox(
            width: 50,
          ),
          Icon(
            FontAwesomeIcons.linkedin,
            color: Color(0xff072983),
            size: 35,
          ),
        ],
      );


  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://placeimg.com/500/480/nature',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: profilHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
          'https://placeimg.com/640/480/people',
        ),
      );

  Widget Infos() => Container(
        width: 380,
        height: 150,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 25.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Color(0xffFFFFFF),
                    size: 14,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Username',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Ahmed.karimi',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    color: Color(0xffFFFFFF),
                    size: 14,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Contact',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '+245 6554788',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Color(0xffFFFFFF),
                    size: 14,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'ahmed.karmi@gmail.com',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
