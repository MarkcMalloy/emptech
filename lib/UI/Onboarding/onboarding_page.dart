import 'dart:io';

import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    final pages = List.generate(
        3,
        (i) => MeasurementOnboardingPage(
              index: i,
            ));
    return Scaffold(
        backgroundColor: CustomColors.foregroundColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView.builder(
              controller: controller,
              itemCount: 3,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
            Positioned(
                bottom: 42,
                left: 22,
                child: SmoothPageIndicator(
                    controller: controller, // PageController
                    count: pages.length,
                    effect: WormEffect(activeDotColor: CustomColors.foregroundColor))),
            Positioned(
              bottom: 32,
                right: 32,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(CustomColors.foregroundColor),
                      alignment: Alignment.center,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),                         side: BorderSide(color: CustomColors.foregroundColor)),
                      )),
              onPressed: () {
                setState(() {
                  if(currentIndex<3){
                    currentIndex = currentIndex + 1;
                  }
                  controller.jumpToPage(currentIndex);
                });
              },
              child: Text("Next Step", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18),),
            ))
            /*
            Positioned(
                bottom: 64,
                left: 32,
                child: PageViewIndicator(selectedIndex: 0))
            */
          ],
        ));
  }
}