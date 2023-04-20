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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  personalDashboardProfile(),
                  Positioned(
                      bottom: 0,
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
                    color: CustomColors.foregroundColor.withOpacity(0.8),
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
        informationContainerRow(Icons.person, "Niels Dahl"),
        informationContainerRow(Icons.email_outlined, "nkbd@emptech.dk"),
        informationContainerRow(Icons.phone_android_rounded, "+45 22 37 35 09"),
        informationContainerRow(
            Icons.house_outlined, "Falkoner Allé 65, 5 th."),
      ],
    );
  }

  Widget informationContainerRow(IconData iconData, String txt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Icon(
              iconData,
              color: CustomColors.foregroundColor,
            )),
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
}
