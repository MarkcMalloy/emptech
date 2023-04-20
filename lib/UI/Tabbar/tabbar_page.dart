import 'package:emptech.app.emptech/UI/Onboarding/onboarding_page.dart';
import 'package:emptech.app.emptech/UI/Tabbar/Components/tabbar_badge_icon_dashboard.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-item.dart';

import '../Camera/camera_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  TabController? _tabController;
  bool showContainer = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _tabController = TabController(
        initialIndex: 0,
        length: 3,
        vsync: this,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: CustomColors.foregroundColor,
        title: Text(
          "EmpTech",
          style: GoogleFonts.montserrat(fontStyle: FontStyle.italic),
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  toggleInformationContainer();
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: CustomColors.backgroundColor,
                ))
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
      body: Stack(
        children: [
          GestureDetector(
            onTap: toggleInformationContainer,
            child: TabBarView(
              physics:
                  const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const OnboardingPage(),
                CameraPage(),
                const OnboardingPage()
              ],
            ),
          ),
          informationContainer()
        ],
      ),
    );
  }

  Widget navBar() {
    return MotionTabBar(
      initialSelectedTab: "Dashboard",
      useSafeArea: true, // default: true, apply safe area wrapper
      labels: const ["Dashboard", "Order", "Profile"],
      // Profil -> Dine egne oplysninger, Hvilke handsker er i brug, Man kan administrere sine handkser + dashboard
      // Order Glove -> Onboarding module -> Camera page -> Order received / confirmed page with result image
      // Min virksomhed?
      icons: const [Icons.dashboard, Icons.camera, Icons.people_alt],

      // optional badges, length must be same with labels
      badges: const [
        /*
         TabBarBadgeIcon(),
        TabBarBadgeIcon(),
        TabBarBadgeIcon(),
         */
      ],
      tabSize: 50,
      tabBarHeight: 65,
      textStyle: GoogleFonts.montserrat(
        fontSize: 18,
        color: const Color(0xfffafafa),
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: CustomColors.iconColor,
      tabIconSize: 28.0,
      tabIconSelectedSize: 26.0,
      tabSelectedColor: CustomColors.backgroundColor.withOpacity(0.4),
      tabIconSelectedColor: Colors.white,
      tabBarColor: CustomColors.foregroundColor,
      onTabItemSelected: (int value) {
        setState(() {
          _tabController!.index = value;
        });
      },
    );
  }

  Widget informationContainer() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOut,
      top: showContainer ? MediaQuery.of(context).size.height / 10 : -800,
      left: 24,
      right: 24,
      child: Container(
        width: 200,
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            //color: CustomColors.backgroundColor,
            color: Color(0xfffafafa),
            border:
                Border.all(color: CustomColors.foregroundColor, width: 4.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text('Get in touch!',
                  style: GoogleFonts.roboto(
                      color: CustomColors.foregroundColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            informationContainerRow(Icons.email_outlined, "nkbd@emptech.dk"),
            informationContainerRow(Icons.person, "Niels Dahl"),
            informationContainerRow(
                Icons.phone_android_rounded, "+45 22 37 35 09"),
            informationContainerRow(
                Icons.house_outlined, "Falkoner Allé 65, 5 th."),
          ],
        ),
      ),
    );
  }

  Widget informationContainerRow(IconData iconData, String txt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Icon(
              iconData,
              color: CustomColors.foregroundColor,
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text(
            txt,
            style: GoogleFonts.roboto(
                color: CustomColors.foregroundColor, fontSize: 20),
          ),
        )
      ],
    );
  }

  toggleInformationContainer() {
    setState(() {
      showContainer = !showContainer;
      print(showContainer);
    });
  }
}
