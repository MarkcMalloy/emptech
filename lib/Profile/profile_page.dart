import 'package:emptech.app.emptech/Profile/Components/admin_detail_row.dart';
import 'package:emptech.app.emptech/Profile/Components/listview_item.dart';
import 'package:emptech.app.emptech/UI/Dashboard/Components/dashboard_profile_avatar.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePAgeState();
}

class _ProfilePAgeState extends State<ProfilePage> {
  var nielsAvatorUrl =
      "https://media.licdn.com/dms/image/C4E03AQEqy87kjxv0Jg/profile-displayphoto-shrink_800_800/0/1581859194944?e=1687996800&v=beta&t=mWacwPHOrB_qaXhmnuqzrWpCy7QYPdyx8ozqI9LD3W4";

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.settings, 'title': 'Settings'},
    {'icon': Icons.credit_card_outlined, 'title': 'Billing Details'},
    {'icon': Icons.manage_accounts_outlined, 'title': 'User Management'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Stack(
        children: [
          const Positioned(
              top: 0,
              child: Image(
                image: AssetImage("assets/honeycomb_2.png"),
              )),
          GlassContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            borderGradient: LinearGradient(
              // Set the gradient colors and stops to achieve the desired glass effect
              colors: [
                CustomColors.backgroundColor.withOpacity(0.2),
                CustomColors.backgroundColor.withOpacity(0.3)
                /*
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.3)
                 */
              ],
              stops: [0.3, 0.7],
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Set the gradient colors and stops to achieve the desired glass effect
              colors: [
                CustomColors.foregroundColor.withOpacity(0.3),
                CustomColors.backgroundColor.withOpacity(0.4),
                CustomColors.backgroundColor.withOpacity(0.5),
                CustomColors.backgroundColor.withOpacity(0.55)
              ],
              stops: [0.3, 0.4, 0.55, 0.7],
            ),
            blur: 6, // Set the blur value to achieve the desired glass effect
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DashboardProfileAvatar(
                  url: nielsAvatorUrl,
                  size: 46.0,
                ),
                userName(),
                adminDetails(),
                Expanded(
                  flex: 2,
                  child: profileListView(),
                )
                /*
          Expanded(
            child:           profileListView(),
            flex: 2,
          )
           */
              ],
            ),
          )
        ],
      ),
    );
  }

/*
Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DashboardProfileAvatar(url: nielsAvatorUrl, size: 46.0,),
            userName(),
            adminDetails(),
            Expanded(
              flex: 2,
              child: profileListView(),
            )
            /*
          Expanded(
            child:           profileListView(),
            flex: 2,
          )
           */
          ],
        ),
 */
  Widget userName() {
    TextStyle _style1 = GoogleFonts.montserrat(
        fontSize: 24, color: Color(0xfffafafa), fontWeight: FontWeight.w400);
    TextStyle _style2 = GoogleFonts.montserrat(
        fontSize: 18,
        color: Colors.grey.withOpacity(0.8),
        fontWeight: FontWeight.w500);

    return Column(
      children: [
        Text(
          "Niels Kragh Blume Dahl",
          style: _style1,
        ),
        Text(
          "Founder, EmpTech",
          style: _style2,
        )
      ],
    );
  }

  Widget adminDetails() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 12),
          child: Container(
            height: 2,
            color: CustomColors.foregroundColor.withOpacity(0.3),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                AdminDetailsColumn(
                  topText: "4",
                  bottomText: "Gloves",
                ),
                AdminDetailsColumn(
                  topText: "164hrs",
                  bottomText: "Total usage",
                ),
                AdminDetailsColumn(
                  topText: "2",
                  bottomText: "Employees",
                ),
              ],
            )),
      ],
    );
  }

  Widget profileListView() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: CustomColors.backgroundColor.withOpacity(0.5), spreadRadius: 2, blurRadius: 6)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0)),
            color: const Color(0xfffafafa)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [adminProfileSettings(), logoutButton()],
        ));
  }
  // logoutButton

  Widget adminProfileSettings() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            // Handle button press here
            print('Button pressed for ${items[index]['title']}');
          },
          child: ProfileListItem(
            icon: items[index]['icon'],
            title: items[index]['title'],
            onPressed: () {},
          ),
        );
      },
    );
  }

  Widget logoutButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 72, vertical: 12)),
                shadowColor: const MaterialStatePropertyAll<Color>(
                    CustomColors.foregroundColor),
                textStyle: MaterialStatePropertyAll<TextStyle>(
                    GoogleFonts.roboto(
                        fontWeight: FontWeight.w600, fontSize: 16)),
                backgroundColor: const MaterialStatePropertyAll<Color>(
                    CustomColors.foregroundColor),
                elevation: const MaterialStatePropertyAll<double>(8.0)),
            onPressed: () {
              //TODO: implement logout
            },
            child: const Text("Logout")));
  }
}
