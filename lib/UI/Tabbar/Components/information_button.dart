import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';

class InformationButton extends StatelessWidget {
  final Function function;
  const InformationButton({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          function;
        },
        icon: const Icon(
          Icons.info_outline_rounded,
          color: CustomColors.backgroundColor,
        ));
  }
}
