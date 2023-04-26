import 'package:emptech.app.emptech/UI/Dashboard/Components/concave_curve_container.dart';
import 'package:emptech.app.emptech/UI/Dashboard/Components/dashboard_profile_avatar.dart';
import 'package:emptech.app.emptech/UI/Dashboard/Components/dashboard_profile_row.dart';
import 'package:emptech.app.emptech/UI/Design/glass_overlay.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            GlassOverlay(
                body: Column(
              children: [
                Center(
                  child: ConvexCurveContainer(
                    borderColor: Colors.red,
                    borderWidth: 12,
                    height: MediaQuery.of(context).size.height / 3,
                    curveHeight: 20,
                    child: Container(
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ));
  }

  /*
  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [myGlovesContainer()],
              ),
   */

  Widget myGlovesContainer() {
    EdgeInsetsGeometry columnItemPadding =
        const EdgeInsets.symmetric(vertical: 0, horizontal: 6);
    var topStyle = GoogleFonts.montserrat(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700);

    var bottomStyle = GoogleFonts.roboto(
        fontSize: 14,
        color: Colors.grey.withOpacity(0.7),
        fontWeight: FontWeight.w700);

    return Container(
      height: 100,
      width: 220,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child:
                        //Image(image: AssetImage("assets/onboarding_step_1.png"))),
                        Icon(
                      FontAwesomeIcons.hand,
                      color: CustomColors.foregroundColor,
                      size: 32,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "My glove",
                      style: topStyle,
                    ),
                    Text(
                      "S/N 0001",
                      style: bottomStyle,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget glovesListView() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.list),
              trailing: const Text(
                "GFG",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              title: Text("List item $index"));
        });
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
