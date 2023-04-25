import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  ProfileListItem(
      {required this.icon, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                color: CustomColors.foregroundColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.0)),
            child: Icon(
              icon,
              size: 24.0,
              color: CustomColors.foregroundColor,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: CustomColors.foregroundColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            color: Colors.blue,
            icon: const Icon(
              Icons.chevron_right_outlined,
              color: CustomColors.foregroundColor,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
