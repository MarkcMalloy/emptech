import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const buttonTheme =
      ButtonThemeData(buttonColor: CustomColors.foregroundColor);
  static const buttonStylee = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(CustomColors.foregroundColor),
      alignment: Alignment.center);

  ///* TextStyles
  /// Headline Textstyles
  static TextStyle headlineTextStyle = GoogleFonts.montserrat(
      color: Color(0xfffafafa), fontSize: 36, fontWeight: FontWeight.w500);

  static TextStyle headlineTextStyle2 =
      GoogleFonts.montserrat(color: Color(0xfffafafa), fontSize: 36);

  /// Subtext Textstyles
  static TextStyle subTextStyle = GoogleFonts.montserrat(
      color: Color(0xfffafafa),
      fontSize: 16,
      fontWeight: FontWeight.w500);

  /// TextStyles */
}
