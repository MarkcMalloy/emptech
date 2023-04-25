import 'dart:io';

import 'package:emptech.app.emptech/UI/Design/glass_overlay.dart';
import 'package:emptech.app.emptech/UI/Onboarding/Components/onboarding_texts.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:emptech.app.emptech/Utils/emptech_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_measurement.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: onboardingGlassyOverlay(onboardingBody()));
  }

  Widget onboardingBody() {
    final pages = List.generate(
        3,
        (i) => MeasurementOnboardingPage(
              index: i,
              assetImage: 'assets/glove_2.png',
            ));
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (_, index) {
            return pages[index % pages.length];
          },
        ),
        onboardingGlassyText(),
        Positioned(
            bottom: 42,
            left: 22,
            child: SmoothPageIndicator(
                controller: controller, // PageController
                count: pages.length,
                effect: const WormEffect(
                    activeDotColor: CustomColors.foregroundColor))),
        Positioned(
            bottom: 32,
            right: 32,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                      CustomColors.foregroundColor),
                  alignment: Alignment.center,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                            color: CustomColors.foregroundColor)),
                  )),
              onPressed: () {
                setState(() {
                  if (currentIndex < 3) {
                    currentIndex = currentIndex + 1;
                  }
                  controller.jumpToPage(currentIndex);
                });
              },
              child: Text(
                "Next Step",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ))
      ],
    );
  }

  Widget onboardingGlassyText() {
    return Positioned(
        top: MediaQuery.of(context).size.height / 2.5,
        child: Center(
            child: GlassContainer(
          borderRadius: BorderRadius.circular(42.0),
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 1.1,
          borderGradient: LinearGradient(
            // Set the gradient colors and stops to achieve the desired glass effect
            colors: [
              CustomColors.backgroundColor.withOpacity(0.2),
              CustomColors.backgroundColor.withOpacity(0.3),

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
              /*
              CustomColors.foregroundColor.withOpacity(1.0),
              CustomColors.foregroundColor.withOpacity(0.5),
              CustomColors.foregroundColor.withOpacity(0.3),
              CustomColors.foregroundColor.withOpacity(0.1)
               */
              Color(0xff9475FF).withOpacity(0.95),
              Color(0xff9475FF).withOpacity(0.9),
              Color(0xff9475FF).withOpacity(0.2),
              Color(0xff9475FF).withOpacity(0.7)
            ],
            stops: [0, 0.2, 0.5, 0.7],
          ),
          blur: 4, //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4, left: 12, right: 12),
                child: Text(
                  OnboardingTexts.firstStepTitle,
                  style: CustomTheme.headlineTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                child: Text(
                  OnboardingTexts.firstStepSubText,
                  style: CustomTheme.subTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24, left: 12, right: 12),
                child: Text(
                  OnboardingTexts.firstStepSubText2,
                  style: CustomTheme.subTextStyle,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        )));
  }

  Widget onboardingGlassyOverlay(Widget body) {
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
          CustomColors.foregroundColor.withOpacity(0.55),
          CustomColors.backgroundColor.withOpacity(0.4),
          CustomColors.backgroundColor.withOpacity(0.3),
          CustomColors.backgroundColor.withOpacity(0.2)
        ],
        stops: [0, 0.3, 0.6, 0.9],
      ),
      blur: 6, // Set the blur value to achieve the desired glass effect
      child: SafeArea(child: body),
    );
  }
}