import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:emptech.app.emptech/Utils/emptech_theme.dart';

import 'package:flutter/material.dart';

import 'Components/onboarding_texts.dart';

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
    return Container(
      decoration: const BoxDecoration(color: CustomColors.backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Flexible(
            flex: 2,
            child: CircleAvatar(
                radius: 128,
                backgroundColor: Colors.transparent,
                child:
                    Image(image: AssetImage("assets/onboarding_step_1.png"))),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 16, top: 16, bottom: 0, left: 32),
              child: Text(
                OnboardingTexts.firstStepTitle,
                style: CustomTheme.headlineTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  OnboardingTexts.firstStepSubText,
                  style: CustomTheme.subTextStyle,
                  textAlign: TextAlign.left,
                ),
              ))
        ],
      ),
    );
  }

  String fetchOnboardingHeadline(){
    switch(widget.index){
      case 0:
        return OnboardingTexts.firstStepTitle;
      case 1:
        return OnboardingTexts.secondStepTitle;
      case 2:
        return OnboardingTexts.thirdStepTitle;
    }
    return "";
  }
}
