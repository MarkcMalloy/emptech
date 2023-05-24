import 'package:emptech.app.emptech/Web/Components/wave_widget.dart';
import 'package:emptech.app.emptech/Web/dashboard_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWebPage extends StatefulWidget {
  const DashboardWebPage({Key? key}) : super(key: key);

  @override
  State<DashboardWebPage> createState() => _DashboardWebPageState();
}

class _DashboardWebPageState extends State<DashboardWebPage> {
  static Color backgroundColor = const Color(0xFFD6D6D6);

  static Color mainColor = const Color(0xFFEDE1D5);
  static Color accentColor = const Color(0xFFE9D9CA);
  static Color accentColor2 = const Color(0xFFE6D3C5);

  static Color buttonColor = const Color(0xFFE7E7E7);

  static Color blackButtonColor = const Color(0xFF161616);

  final List<DashboardTabBarItem> items = [
    DashboardTabBarItem(icon: Icons.dashboard, name: "Dashboard"),
    DashboardTabBarItem(icon: Icons.message_rounded, name: "Messages"),
    DashboardTabBarItem(icon: Icons.list, name: "Activity Log"),
    DashboardTabBarItem(icon: Icons.people, name: "Billing"),
  ];

  final DashboardTabBarItem settingsItem =
      DashboardTabBarItem(icon: Icons.settings, name: "Settings");

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: WaveWidget(
              baseColor: mainColor,
              accentColor1: accentColor,
              accentColor2: accentColor2,
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: dashboardMenu(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: 2,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              Flexible(
                flex: 3,
                child: dashboardSelectedPage1(),
              ),
              Flexible(
                flex: 2,
                child: dashboardSelectedPage2(),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget dashboardMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Emptech",
          style: GoogleFonts.roboto(
              fontSize: 32,
              color: blackButtonColor,
              fontWeight: FontWeight.bold),
        ),
        Wrap(
          direction: Axis.vertical,
          spacing: 2,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 22,
              child: Icon(Icons.person, color: blackButtonColor, size: 40),
            ),
            Text(
              "Mark M.",
              style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: blackButtonColor,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                "Admin",
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Color(0xfffafafa).withOpacity(0.9),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 300,
          child: DashboardTabBar(
            items: items,
            initialIndex: _selectedIndex,
            onTabChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        )
      ],
    );
  }

  Widget dashboardSelectedPage1() {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Text(
                  items[_selectedIndex].name,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dashboardSelectedPage2() {
    Color pageColor = Color(0xFFF2F2F2);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: pageColor,
            child: Center(
              child: Text(
                items[_selectedIndex].name,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
