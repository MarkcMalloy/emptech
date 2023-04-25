import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget body;

  const NeumorphicContainer({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFAFAFA), // Set the background color to #fffafafa
      body: Center(
        child: Neumorphic(
          style: const NeumorphicStyle(
            shape: NeumorphicShape
                .concave, // Set the shape to concave for neumorphic design
            depth: 10, // Set the depth of the neumorphic design
            intensity: 0.7, // Set the intensity of the neumorphic design
            color: Colors.white, // Set the color of the neumorphic design
            lightSource: LightSource
                .topLeft, // Set the light source of the neumorphic design
          ),
          child: Container(
            child: body,
          ),
        ),
      ),
    );
  }
}
