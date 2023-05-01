import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDetailsColumn extends StatelessWidget {
  final topText;
  final bottomText;
  const AdminDetailsColumn({Key? key, required this.topText, required this.bottomText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle topTextStyle = GoogleFonts.roboto(
        color: CustomColors.backgroundColor,
        fontSize: 36,
        fontWeight: FontWeight.w300);
    TextStyle bottomTextStyle =
        GoogleFonts.montserrat(color: CustomColors.backgroundColor, fontWeight: FontWeight.w400, fontSize: 17);
    return Column(
      children: [
        Text(
          topText,
          style: topTextStyle,
        ),
        Text(
          bottomText,
          style: bottomTextStyle,
        )
      ],
    );
  }
}
