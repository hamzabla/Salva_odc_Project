import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Menu.dart';

class SectionDetails extends StatefulWidget {
  @override
  _SectionDetailsState createState() => _SectionDetailsState();
}

class _SectionDetailsState extends State<SectionDetails> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
            color: Colors.black45,
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
                color: Colors.black45,
                size: 25.0,
              ))
        ],
      ),
      drawer: Menu(),
      body:  ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                buildImage(),
                Positioned(top: 255, left: 280, child: buildButtons()),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Tags(),
            SizedBox(
              height: 20,
            ),
            Title(),
            SizedBox(
              height: 20,
            ),
            Infos(),
            SizedBox(
              height: 20,
            ),
            Description(),
            SizedBox(
              width: 20,
              height: 20,
            ),
            addReview(context),
            SizedBox(
              height: 20,
            ),
            Reviews(),
            Reviews(),
        Reviews(),
          ],
      ),
    );
  }
}

Widget Reviews() {

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
                        NetworkImage('https://placeimg.com/640/480/nature'),
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                'Ahmed.karimi',
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
          padding: const EdgeInsets.only(left: 30.0, right: 10.0,bottom: 15.0),
          child: Text(
            'Very nice beach especially when the weather is calm and you can see families ..',
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: Color(0xffF2F3F3),
            ),
          ),
        ),
      ]),
    ),
  );
}

Widget addReview(BuildContext context) {
  return InkWell(
    onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Title'),
              content: Text('test test test test'),
            )),
    child: Padding(
      padding: const EdgeInsets.only(right: 25.0,left: 25.0),
      child: Container(
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
      "One of the few sandy beaches in the region,but it is advisable to go there in the morning to enjoy it even more Very beautiful sunrise for early risers.",
      textAlign: TextAlign.left,
      style: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff072983).withOpacity(0.6),
      ),
    ),
  );
}

Widget Infos() {
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
              'el hoceima',
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
              '250 comments',
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
    padding: const EdgeInsets.only(left: 16.0),
    child: Text(
      'BEACH HOCEIMA',
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

Widget buildImage() {
  final image = NetworkImage(
    'https://placeimg.com/640/480/people',
  );

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
        'https://placeimg.com/640/480/nature',
        width: double.infinity,
        height: 280,
        fit: BoxFit.cover,
      ));
}

Widget buildButtons() {
  return Row(
    children: [
      InkWell(
        onTap: () {
          print("Click event on Container");
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
          child: Icon(
            Icons.favorite,
            color: Color(0xffff4578),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      InkWell(
        onTap: () => print('saved'),
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
          child: Icon(
            Icons.bookmark_outline,
            color: Color(0xffF2F3F3),
            size: 28,
          ),
        ),
      ),
    ],
  );
}

Widget Tags() {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
    child: Row(
      children: [
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
              "#surf",
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
              "#family",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xffF2F3F3),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
