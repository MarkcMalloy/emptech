import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final String buttonTxt;
  final Function function;
  const LoginButton({Key? key, required this.buttonTxt, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        function;
      },
      child: GlassContainer(
        height: 46,
        width: 100,
        borderRadius: BorderRadius.circular(12),
        borderGradient: LinearGradient(
          // Set the gradient colors and stops to achieve the desired glass effect
          colors: [
            CustomColors.backgroundColor.withOpacity(0.2),
            CustomColors.backgroundColor.withOpacity(0.3),
          ],
          stops: const [0.3, 0.7],
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF222A33).withOpacity(0.7),
            const Color(0xFF222A33).withOpacity(0.55),
            const Color(0xFF222A33).withOpacity(0.45),
            const Color(0xFF222A33).withOpacity(0.6),
          ],
          stops: const [0.3, 0.4, 0.55, 0.7],
        ),
        blur: 1, //
        child: Center(
          child: Text(buttonTxt, style: GoogleFonts.roboto(fontSize: 18),),
        )),);
  }
}
