import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class GlassOverlay extends StatelessWidget {
  const GlassOverlay({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return GlassContainer(
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
      child: SafeArea(
        child: body
      ),
    );
  }
}
