import 'dart:io';

import 'package:emptech.app.emptech/UI/Camera/camera_page.dart';
import 'package:emptech.app.emptech/UI/Design/glass_overlay.dart';
import 'package:emptech.app.emptech/UI/Onboarding/Components/onboarding_texts.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:emptech.app.emptech/Utils/emptech_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
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
    List<String> assets = ["assets/glove_2.png", "onboarding_step_1.png"];
    List<String> texts = [OnboardingTexts.firstStepTitle, OnboardingTexts.secondStepTitle];
    final pages = List.generate(
        2,
        (i) => MeasurementOnboardingPage(
              index: i,
              assetImage: assets[i],
            ));
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        PageView.builder(
          controller: controller,
          itemCount: 2,
          itemBuilder: (_, index) {
            return pages[index % pages.length];
          },
        ),
        onboardingGlassyText(),
        Positioned(
            bottom: 42, left: 22, right: 22, child: onboardingBottomRow(pages)),
      ],
    );
  }

  Widget onboardingBottomRow(List<MeasurementOnboardingPage> pages) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          color: Color(0xfffafafa), borderRadius: BorderRadius.circular(16.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(2),
            child: SmoothPageIndicator(
                controller: controller, // PageController
                count: pages.length,
                effect: const WormEffect(activeDotColor: Color(0xFF9475FF))),
          ),
          NeumorphicButton(
              padding: EdgeInsets.all(2),
              backgroundColor: Color(0xfffafafa),
              onTap: () {
                setState(() {
                  if (currentIndex < 3) {
                    currentIndex = currentIndex + 1;
                    controller.jumpToPage(currentIndex);
                  }
                  else if(currentIndex == 3){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraPage()),
                    );
                  }

                });
              },
              width: 100,
              height: 40,
              topLeftShadowColor: Colors.grey.withOpacity(0.4),
              bottomRightShadowColor: Colors.grey.withOpacity(0.4),
              child: Center(
                child: Text(
                  "Next Step",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: CustomColors.foregroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ))
        ],
      ),
    );
  }
  /*
  style: Buttonstyle(
                backgroundColor: MaterialStatePropertyAll(
                    Color(0xFF9475FF).withOpacity(0.8)),
                alignment: Alignment.center,
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(
                          color: CustomColors.foregroundColor)),
                )),
   */

  Widget onboardingGlassyText() {
    return Positioned(
        top: MediaQuery.of(context).size.height / 3,
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
          blur: 3, //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 12, right: 12),
                child: Text(
                  OnboardingTexts.firstStepTitle,
                  style: CustomTheme.headlineTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                child: Text(
                  OnboardingTexts.firstStepSubText,
                  style: CustomTheme.subTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
                child: Text(
                  OnboardingTexts.firstStepSubText2,
                  style: CustomTheme.subTextStyle,
                  textAlign: TextAlign.center,
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
        stops: const [0.3, 0.7],
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
        stops: const [0, 0.3, 0.6, 0.9],
      ),
      blur: 6, // Set the blur value to achieve the desired glass effect
      child: SafeArea(child: body),
    );
  }

  Widget onboardingGlassyRow() {
    return GlassContainer(
      padding: EdgeInsets.symmetric(horizontal: 22),
      height: 60,
      borderRadius: BorderRadius.circular(16.0),
      width: MediaQuery.of(context).size.width - 44,
      borderGradient: LinearGradient(
        colors: [
          const Color(0xFF222A33).withOpacity(0.5),
          const Color(0xFF222A33).withOpacity(0.3),
        ],
        stops: const [0.3, 0.7],
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF222A33).withOpacity(0.8),
          const Color(0xFF222A33).withOpacity(0.5),
          const Color(0xFF222A33).withOpacity(0.5),
          const Color(0xFF222A33).withOpacity(0.4),
        ],
        stops: const [0.3, 0.4, 0.55, 0.7],
      ),
      blur: 6,
      //child: onboardingBottomRow(),
    );
  }
}
