import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardProfileRow extends StatelessWidget {
  final Widget iconWidget;
  final String descriptionTxt;
  const DashboardProfileRow({Key? key, required this.iconWidget, required this.descriptionTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        iconWidget,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Text(
            descriptionTxt,
            style: GoogleFonts.montserrat(
                color: CustomColors.foregroundColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
