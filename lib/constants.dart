import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
const addtocartcolor=Color(0xff7fb5ff);
const firstColor = Color(0xff366ED8);
const secondColor=Color(0xff2457B7);
const white =Color(0xffFFFFFF);
const cursorColor=Color(0xffD8D5D9);
const RegisterColor=Color(0xff7fb5ff);
const AddSectionSalvaColor=Color(0xff072983);
//********
const backgroundColorAddsection=Color(0xfff2f3f3);
const sectionColor=Color(0xff6c6161);
const kSpacingUnit = 10;
final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit* 1.7),
  fontWeight: FontWeight.w600,
);
final SalvaTitle=Text(
  'Salva',
  style: (
  GoogleFonts.poppins(

      fontWeight: FontWeight.w600,
      fontSize: 24,
      color:Colors.white,

  )
  ),

);
final addSectionStyle=Text(
  'ADD SECTION',
  style: (
      GoogleFonts.poppins(

        fontWeight: FontWeight.w700,
        fontSize: 24,
        color:AddSectionSalvaColor,
        height: 36,
      )
  )
);
final addSectionButton=Text(
    'Add Section',
    style: (
        GoogleFonts.poppins(

          fontWeight: FontWeight.w400,
          fontSize: 18,
          color:AddSectionSalvaColor,
          height: 21,
        )
    )
);
final SectionName=Text(
    'Section name',
    style: (
        GoogleFonts.poppins(

          fontWeight: FontWeight.w400,
          fontSize: 16,
          color:sectionColor,
          height: 24,
        )
    )
);
final Location=Text(
    'Location',
    style: (
        GoogleFonts.poppins(

          fontWeight: FontWeight.w400,
          fontSize: 16,
          color:sectionColor,
          height: 24,
        )
    )
);
final Tags=Text(
    'Tags',
    style: (
        GoogleFonts.poppins(

          fontWeight: FontWeight.w400,
          fontSize: 16,
          color:sectionColor,
          height: 24,
        )
    )
);
final ImportPicture=Text(
    'Import picture',
    style: (
        GoogleFonts.poppins(

          fontWeight: FontWeight.w400,
          fontSize: 16,
          color:sectionColor,
          height: 24,
        )
    )
);
final SectionDescription=Text(
    'Section description',
    style: (
        GoogleFonts.poppins(

          fontWeight: FontWeight.w400,
          fontSize: 16,
          color:sectionColor,
          height: 24,
        )
    )
);

final buttomText=Text(
    'Add Section',
    style: (
        GoogleFonts.poppins(

          fontWeight: FontWeight.w400,
          fontSize: 18,
          color:AddSectionSalvaColor,
          height: 21,
        )
    )
);






