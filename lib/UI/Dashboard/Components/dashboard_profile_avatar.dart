import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';

class DashboardProfileAvatar extends StatelessWidget {
  const DashboardProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: CustomColors.backgroundColor,
        child: Icon(
          Icons.person,
          color: CustomColors.foregroundColor,
          size: 24,
        ),
      ),
    );
  }
}
