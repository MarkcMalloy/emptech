import 'package:emptech.app.emptech/UI/Dashboard/Components/concave_curve_container.dart';
import 'package:emptech.app.emptech/UI/Dashboard/Components/dashboard_profile_avatar.dart';
import 'package:emptech.app.emptech/UI/Dashboard/Components/dashboard_profile_row.dart';
import 'package:emptech.app.emptech/UI/Design/glass_overlay.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var nielsAvatorUrl =
      "https://media.licdn.com/dms/image/C4E03AQEqy87kjxv0Jg/profile-displayphoto-shrink_800_800/0/1581859194944?e=1687996800&v=beta&t=mWacwPHOrB_qaXhmnuqzrWpCy7QYPdyx8ozqI9LD3W4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            GlassOverlay(body: Container()),
            SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    "Dashboard",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 42,
                        color: const Color(0xfffafafafa)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: dashboardDarkElement(Icons.dashboard, "txt", index),
                          );
                        }),
                  ),
                ),
              ],
            ))
          ],
        ));
  }

  Widget dashboardDarkElement(IconData icon, String txt, int index) {
    return GlassContainer(
      elevation: 10,
      height: 130,
      width: MediaQuery.of(context).size.width,
      borderRadius: BorderRadius.circular(36),
      borderGradient: LinearGradient(
        // Set the gradient colors and stops to achieve the desired glass effect
        colors: [
          CustomColors.backgroundColor.withOpacity(0.2),
          CustomColors.backgroundColor.withOpacity(0.3),
        ],
        stops: const [0.3, 0.7],
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF222A33).withOpacity(0.7),
          const Color(0xFF222A33).withOpacity(0.55),
          const Color(0xFF222A33).withOpacity(0.45),
          const Color(0xFF222A33).withOpacity(0.6),
        ],
        stops: const [0.3, 0.4, 0.55, 0.7],
      ),
      blur: 1,
      child: dashboardBody("S/N 000${index+1} - 'Niels Kragh'", "", "Hrs used this week: ${index*2}", Icons.handshake, index),
    );
  }

  Widget dashboardBody(
      String text1, String text2, String text3, IconData icon1, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesomeIcons.hand,
                color: Color(0xfffafafa),
                size: 42,
              ),
              SizedBox(height: 12,),
              Container(
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Text("${index*24}%", textAlign: TextAlign.center,),
              ),
              Icon(batteryIcon(index*24), color: Color(0xfffafafa),)
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardColumnElement(text1),
                dashboardColumnElement(text2),
                dashboardColumnElement("Hrs used this week: 12"),
              ],
            ),
          ),
        )
        /*
           Text(
            "Gloves",
            style:
            GoogleFonts.montserrat(fontSize: 14, color: const Color(0xfffafafa)),
          ),
            */
      ],
    );
  }

  IconData batteryIcon(double percent){
    if(percent <= 25){
      return FontAwesomeIcons.batteryQuarter;
    } else if(percent > 25 && percent <= 50){
      return FontAwesomeIcons.batteryHalf;
    } else if(percent > 50 && percent <= 75){
      return FontAwesomeIcons.batteryThreeQuarters;
    } else if(percent > 75 && percent <= 100){
      return FontAwesomeIcons.batteryFull;
    }
    return FontAwesomeIcons.batteryFull;
  }

  Widget dashboardColumnElement(String txt) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            txt,
            style: GoogleFonts.montserrat(
                fontSize: 12, color: const Color(0xfffafafa)),
          )
        ],
      ),
    );
  }

  Widget opaquePurpleLine() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: 2,
      color: CustomColors.foregroundColor.withOpacity(0.25),
    );
  }

  Widget dashboardColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        informationContainerRow(
            "Niels Dahl", _iconWidget(Icons.person_2_outlined)),
        informationContainerRow(
            "nkbd@emptech.dk", _iconWidget(Icons.email_outlined)),
        informationContainerRow(
            "+45 22 37 35 09", _iconWidget(Icons.phone_android_rounded)),
        informationContainerRow(
            "Falkoner Allé 65, 5 th.", _iconWidget(Icons.house_outlined)),
      ],
    );
  }

  Widget informationContainerRow(String txt, Widget iconWidget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: iconWidget),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text(
            txt,
            style: GoogleFonts.roboto(
                color: CustomColors.foregroundColor, fontSize: 16),
          ),
        )
      ],
    );
  }

  Widget _iconWidget(IconData iconData) {
    return Icon(
      iconData,
      color: CustomColors.foregroundColor,
      size: 28,
    );
  }
}
