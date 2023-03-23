import 'package:emptech/Onboarding/Components/onboarding_texts.dart';
import 'package:emptech/Utils/emptech_theme.dart';
import 'package:flutter/material.dart';

import '../Utils/emptech_colors.dart';

class MeasurementOnboardingPage extends StatefulWidget {
  final int index;
  const MeasurementOnboardingPage({Key? key, required this.index})
      : super(key: key);

  @override
  State<MeasurementOnboardingPage> createState() =>
      _MeasurementOnboardingPageState();
}

class _MeasurementOnboardingPageState extends State<MeasurementOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
        child: Container(
          decoration: const BoxDecoration(
            color: CustomColors.backgroundColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32,),
              const CircleAvatar(
                  radius: 128,
                  backgroundColor: Colors.transparent,
                  child: Image(
                      image: AssetImage("assets/onboarding_picture_1.jpg"))),
              Padding(
                padding: const EdgeInsets.only(
                    right: 16, top: 16, bottom: 0, left: 32),
                child: Text(
                  OnboardingTexts.firstStepTitle,
                  style: CustomTheme.headlineTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  OnboardingTexts.firstStepSubText,
                  style: CustomTheme.subTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ));
  }
}
