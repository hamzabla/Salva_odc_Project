import 'dart:convert';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class addsection extends StatefulWidget {
  @override
  State<addsection> createState() => _addsectionState();
}

class _addsectionState extends State<addsection> {
  final  tagsSelected  = TextEditingController();
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final List<String> items = [
    'Safe',
    'Friendly',
    'Surf',
    'Clean',
    'Wavy'
  ];
  List<String> selectedItems = [];

  set image(File image) {}
  Future pickImage()async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() =>
      this.image = imageTemporary
      );
    }
    on PlatformException catch (e) {
      print("Failed to pick image : $e ");
    }
  }

  var formKey = GlobalKey<FormState>();
  var title = TextEditingController();
  var adress = TextEditingController();
  var description = TextEditingController();
  String tags = '';
  var picture = TextEditingController();

  insertSection() async {
    var url = Uri.http('192.168.11.102:5000', '/api/v1/sections/');

    Map<String,String> headers = {'Content-Type':'application/json'};
    final msg = jsonEncode({
      "Adress": adress.text,
      "Description": description.text,
      "Picture": "picture.text",
      "Tags": tags,
      "Title":title.text
    });
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        body: msg,
      headers: headers,
    );
      print(response.body);
      return response;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Section',
        style: TextStyle( color: Color(0xff073983),)),
        backgroundColor: Colors.white70,
      ),
      backgroundColor: Color(0xfff2f3f3),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Center(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/salva-f47c9.appspot.com/o/logo_sans_bg.png?alt=media&token=e099926b-bddd-415e-ad7c-9b8e2fbd78a2"),
                  SizedBox(height: 1),
                  Text(
                    "Salva",
                    style: (GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Color(0xff073983),
                    )),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding:
                      const EdgeInsets.only(right: 92, top: 8),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_outline_outlined,color: Color(0xff072983),),
                          SizedBox(width: 10,),
                          Text(
                            "ADD SECTION ",
                            style: (GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xff073983),
                            )),
                          ),

                        ],
                      )

                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value == null){
                                return "you should add a title";
                              }
                              return null;
                            },
                            controller: title,
                            autofocus: false,
                            style: (GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xffcdbfbf),
                            )),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.47),
                              hintText: "section name",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffcdbfbf),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value){
                              if(value == null){
                                return "you should add a location";
                              }
                              return null;
                            },
                            controller: adress,
                            autofocus: false,
                            style: (GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xffcdbfbf),
                            )),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.47),
                              suffixIcon: Icon(Icons.location_on_outlined),
                              hintText: "Location",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffcdbfbf),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 343,
                            height:56 ,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.47),

                                borderRadius:   BorderRadius.circular(10.0),
                                border:Border.all(
                                  color: Colors.white,
                                  width: 1,
                                )
                            ),

                            child: DropdownButtonHideUnderline(
                              child: Container(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Align(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 230),
                                      child: Text(
                                        'Tags',
                                        style:GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(0xffcdbfbf),
                                        ),
                                      ),
                                    ),
                                  ),
                                  items: items.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      //disable default onTap to avoid closing menu when selecting an item
                                      enabled: false,
                                      child: StatefulBuilder(
                                        builder: (context, menuSetState) {
                                          final _isSelected = selectedItems.contains(item);
                                          return InkWell(
                                            onTap: () {
                                              _isSelected
                                                  ? selectedItems.remove(item)
                                                  : selectedItems.add(item);
                                              //This rebuilds the StatefulWidget to update the button's text
                                              setState(() {
                                                  print("${selectedItems.toString()} heeeeeeeeeeeere");
                                                  tags = selectedItems.join(",").toString();
                                                  print("$tags");

                                              });
                                              //This rebuilds the dropdownMenu Widget to update the check mark
                                              menuSetState(() {});
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                              child: Row(
                                                children: [
                                                  _isSelected
                                                      ? const Icon(Icons.check_box_outlined)
                                                      : const Icon(Icons.check_box_outline_blank),
                                                  const SizedBox(width: 16),
                                                  Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                  //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                  value: selectedItems.isEmpty ? null : selectedItems.last,
                                  onChanged: (value) {
                                  },
                                  buttonHeight: 40,
                                  buttonWidth: 140,
                                  itemHeight: 40,
                                  itemPadding: EdgeInsets.zero,
                                  selectedItemBuilder: (context) {
                                    return items.map(
                                          (item) {
                                        return Container(
                                          alignment: AlignmentDirectional.center,
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Text(
                                            selectedItems.join(', '),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 1,
                                          ),
                                        );
                                      },
                                    ).toList();
                                  },
                                ),

                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: picture,
                            validator: (value){
                              if(value == null){
                                return "you should add a location";
                              }
                              return null;
                            },
                            autofocus: false,
                            style: (GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xffcdbfbf),
                            )),
                            onTap: ()=> pickImage(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.47),
                              hintText: "import picture",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffcdbfbf),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: description,
                            validator: (value){
                              if(value == null){
                                return "you should add a descrption";
                              }
                              return null;
                            },
                            autofocus: false,
                            style: (GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xffcdbfbf),
                            )),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.47),
                              hintText: "section description ...",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 26.0, horizontal: 10.0),
                              hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffcdbfbf),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          SizedBox(height: 25),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal:20,vertical: 8 ),
                              minimumSize: Size(160, 16),
                              primary: Color(0xff072983),
                              side: BorderSide(width: 1,color: Color(0xff072983)),

                            ),

                            child: Text('Add Section',style: (
                                GoogleFonts.poppins(

                                  fontWeight: FontWeight.w400,
                                  fontSize: 18
                                  ,
                                  color: Color(0xff072983),

                                ))),
                            onPressed: () {
                              insertSection();
                              Navigator.pushNamed(context, "/main_screen");
                            },
                          ),
                        ],
                      )),
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}