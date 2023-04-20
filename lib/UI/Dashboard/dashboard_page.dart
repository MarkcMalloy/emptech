import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';

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
            child: personalDashboardProfile(),
            flex: 2,
          ),
          Expanded(
            child: Container(),
            flex: 2,
          ),
          Expanded(
            child: Container(),
            flex: 2,
          )
        ],
      ),
    );
  }

  Widget opaquePurpleLine() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      height: 2,
      color: CustomColors.foregroundColor.withOpacity(0.5),
    );
  }

  Widget personalDashboardProfile() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: const Color(0xfffafafa),
          ),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: CustomColors.backgroundColor,
                  child: Icon(
                    Icons.person,
                    color: CustomColors.foregroundColor,
                    size: 32,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
