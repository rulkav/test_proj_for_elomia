import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle text(double sp,
    {FontWeight? fw, Color? color, TextDecoration? decoration}) {
  return TextStyle(
      fontFamily: '.SF Pro Text',
      color: color ?? Colors.black,
      fontSize: sp,
      fontWeight: fw ?? FontWeight.w400,
      decoration: decoration);
}

double fsSSmall = 12;
double fsSmall = 13;
double fsSBig = 16;
double fsBig = 17;
double fsLarge = 28;

FontWeight kRegular = FontWeight.w400;
FontWeight kBold = FontWeight.w700;
