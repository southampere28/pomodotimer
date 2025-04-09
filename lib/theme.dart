import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xffffffff);
const Color secondaryColor = Color(0xff38ABBE);
const Color primaryTextColor = Colors.black;
const Color secondaryTextColor = Color(0xff545454);
const Color subtitleColor = Color.fromARGB(255, 62, 62, 62);
const Color blackColor = Colors.black;
const Color blackActiveColor = Color.fromARGB(255, 48, 48, 48);
const Color whiteColor = Colors.white;
const Color alertColor = Color(0xffED6363);
const Color priceColor = Color(0xff2C96F1);
const Color backgroundColor1 = Color(0xff1F1D2B);
const Color backgroundColor2 = Color(0xff2B2937);
const Color backgroundColor3 = Color(0xff242231);
const Color transparentColor = Colors.transparent;

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);

TextStyle titleTextStyle = GoogleFonts.montserrat(
  color: blackColor,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleColor,
);

TextStyle deactivatedTextSytyle = GoogleFonts.poppins(color: whiteColor);

TextStyle alertTextStyle = GoogleFonts.roboto(
  color: alertColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
