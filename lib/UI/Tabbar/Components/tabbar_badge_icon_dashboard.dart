import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';

class TabBarBadgeIcon extends StatelessWidget {
  const TabBarBadgeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Default Motion Badge Widget with indicator only
    return const MotionBadgeWidget(
      isIndicator: true,
      color: Colors.red, // optional, default to Colors.red
      size: 5, // optional, default to 5,
      show: true, // true / false
    );
  }

// custom badge Widget
/*
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(2),
      child: const Text(
        '48',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
     */
}
