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
  var nielsAvatorUrl =
      "https://scontent-arn2-1.xx.fbcdn.net/v/t1.6435-9/79688978_2644716808952559_25377196520505344_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=A4MktojLlZkAX8MyZ5S&_nc_ht=scontent-arn2-1.xx&oh=00_AfDX0PJyGLDBJL-83ghb3U7xnnVvHQmhmMEZY6sJlHdlXg&oe=646DA475";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  personalDashboardProfile(),
                  Positioned(
                      bottom: -6,
                      right: 96,
                      left: 96,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                CustomColors.foregroundColor),
                            alignment: Alignment.center,
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: const BorderSide(
                                      color: CustomColors.foregroundColor)),
                            )),
                        child: const Text("Edit profile"),
                        onPressed: () {},
                      ))
                ],
              ),
            ),
            //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "My (company) Gloves",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            color:
                                CustomColors.foregroundColor.withOpacity(0.90),
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: const Color(0xfffafafa),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            )
          ],
        ));
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

  Widget personalDashboardProfile() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "My profile",
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                    color: CustomColors.foregroundColor.withOpacity(0.95),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
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
            )
          ],
        ));
  }

  Widget dashboardColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        informationContainerRow(
            "Niels Dahl",
            CircleAvatar(
              radius: 14,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(nielsAvatorUrl),
              ),
            )),
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
