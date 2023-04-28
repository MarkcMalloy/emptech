import 'dart:io';

import 'package:emptech.app.emptech/API/api_service.dart';
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
  List<String> assets = ["assets/glove_2.png", "onboarding_step_1.png"];
  List<String> texts = [
    OnboardingTexts.firstStepTitle,
    OnboardingTexts.secondStepTitle
  ];

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
        2,
        (i) => MeasurementOnboardingPage(
              index: i,
              assetImage: assets[i],
            ));
    return Column(
      children: [
        Expanded(child: onboardingGlassyText(pages), flex: 5,),
        Expanded(child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 50, right: 20, left: 20),
          child: onboardingBottomRow(pages),
        ), flex: 1,)

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
                  if (currentIndex < 1) {
                    currentIndex = currentIndex + 1;
                    controller.jumpToPage(currentIndex);
                  } else if (currentIndex == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraPage()),
                    );
                  }
                });
              },
              width: currentIndex < 1 ? 100 : 140,
              height: 40,
              topLeftShadowColor: Colors.grey.withOpacity(0.4),
              bottomRightShadowColor: Colors.grey.withOpacity(0.4),
              child: Center(
                child: Text(
                  currentIndex < 1 ? "Next Step" : "Open Camera",
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

  Widget onboardingGlassyText(List<MeasurementOnboardingPage> pages) {
    return PageView.builder(
      controller: controller,
      itemCount: 2,
      itemBuilder: (_, index) {
        return GlassContainer(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.1,
          borderRadius: BorderRadius.circular(42.0),
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
          blur: 3,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 24),
                  height: 200,
                  child: pages[index % pages.length]),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Wrap(
                  spacing: 12,
                  direction: Axis.vertical,
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    centerText(OnboardingTexts.firstStepTitle,
                        CustomTheme.headlineTextStyle),
                    centerText(OnboardingTexts.firstStepSubText,
                        CustomTheme.subTextStyle),
                    centerText(OnboardingTexts.firstStepSubText2,
                        CustomTheme.subTextStyle)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
  //pages[index % pages.length]
  /*
  GlassContainer(
          borderRadius: BorderRadius.circular(42.0),
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.1,
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
          blur: 3, //
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 24),
                height: 200,
                child: PageView.builder(
                  controller: controller,
                  itemCount: 2,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Wrap(
                  spacing: 12,
                  direction: Axis.vertical,
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    centerText(OnboardingTexts.firstStepTitle,
                        CustomTheme.headlineTextStyle),
                    centerText(OnboardingTexts.firstStepSubText,
                        CustomTheme.subTextStyle),
                    centerText(OnboardingTexts.firstStepSubText2,
                        CustomTheme.subTextStyle)
                  ],
                ),
              )
            ],
          ),
        )
   */

  Widget centerText(String txt, TextStyle style) {
    return Center(
      child: Text(
        txt,
        style: style,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget onboardingGlassyOverlay(Widget body) {
    return GlassContainer(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      borderGradient: LinearGradient(
        colors: [
          CustomColors.backgroundColor.withOpacity(0.2),
          CustomColors.backgroundColor.withOpacity(0.3)
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
      blur: 6,
      child: SafeArea(child: body),
    );
  }
}
