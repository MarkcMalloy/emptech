import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final int selectedIndex;
  const PageViewIndicator({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [pageIcon(0), pageIcon(1), pageIcon(2)],
      ),
    );
  }

  Widget pageIcon(int index) {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: isSelected(index)),
    );
  }

  Color isSelected(int index) {
    return selectedIndex == index
        ? CustomColors.foregroundColor
        : CustomColors.foregroundColor.withOpacity(0.3);
  }
}
