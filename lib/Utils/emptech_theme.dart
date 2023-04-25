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
  static TextStyle headlineTextStyle = GoogleFonts.roboto(
      color: Color(0xfffafafa),
      fontSize: 36,
      fontWeight: FontWeight.w400);

  static TextStyle headlineTextStyle2 =
      GoogleFonts.montserrat(color: CustomColors.subTextColor, fontSize: 36);

  /// Subtext Textstyles
  static TextStyle subTextStyle = GoogleFonts.roboto(
      color: CustomColors.subTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w800);

  /// TextStyles */

}
