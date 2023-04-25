import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:emptech.app.emptech/Utils/emptech_theme.dart';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'Components/onboarding_texts.dart';

class MeasurementOnboardingPage extends StatefulWidget {
  final int index;
  final String assetImage;
  const MeasurementOnboardingPage(
      {Key? key, required this.index, required this.assetImage})
      : super(key: key);

  @override
  State<MeasurementOnboardingPage> createState() =>
      _MeasurementOnboardingPageState();
}

class _MeasurementOnboardingPageState extends State<MeasurementOnboardingPage> {
  var radius = BorderRadius.circular(12.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(36.0),
                          bottomLeft: Radius.circular(36.0))),
                  child: Padding(
                    child: Image(image: AssetImage(widget.assetImage)),
                    padding: const EdgeInsets.all(6.0),
                  )),
              //TODO: Maybe implement onboarding glassy text here
            ],
          ),
        ],
      ),
    );
  }

  String fetchOnboardingHeadline() {
    switch (widget.index) {
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
