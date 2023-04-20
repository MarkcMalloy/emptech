import 'package:emptech.app.emptech/UI/Dashboard/Components/dashboard_profile_avatar.dart';
import 'package:emptech.app.emptech/UI/Dashboard/Components/dashboard_profile_row.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: personalDashboardProfile(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                )
              ],
            ),
            Positioned(
                top: 175,
                right: 96,
                left: 96,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          CustomColors.foregroundColor),
                      alignment: Alignment.center,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                                color: CustomColors.foregroundColor)),
                      )),
                  child: Text("Edit profile"),
                  onPressed: () {},
                ))
          ],
        ));
  }

  Widget opaquePurpleLine() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: 2,
      color: CustomColors.foregroundColor.withOpacity(0.25),
    );
  }

  Widget personalDashboardProfile() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: const Color(0xfffafafa),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: dashboardColumn(),
              )
            ],
          ),
        ));
  }

  Widget dashboardColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DashboardProfileRow(
            iconWidget: DashboardProfileAvatar(),
            descriptionTxt: "Mark Calum Malloy"),
        opaquePurpleLine(),
        DashboardProfileRow(
            iconWidget: Icon(Icons.email_outlined),
            descriptionTxt: "descriptionTxt")
      ],
    );
  }
}
