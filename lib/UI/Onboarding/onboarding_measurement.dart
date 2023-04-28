import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:emptech.app.emptech/Utils/emptech_theme.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class _MeasurementOnboardingPageState extends State<MeasurementOnboardingPage>
    with SingleTickerProviderStateMixin {
  var radius = BorderRadius.circular(12.0);
  bool _showFirstIcon = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controller.forward();
    _controller.addStatusListener((status) {
      print(status.toString());
      if (status == AnimationStatus.completed){
        setState(() {
          _showFirstIcon = !_showFirstIcon;
        });
        _controller.reverse();
      }
      if(status == AnimationStatus.dismissed){
        _controller.forward();
      }

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(36.0),
                          bottomLeft: Radius.circular(36.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Center(
                      child: hands(),
                    ),
                  )),
              //TODO: Maybe implement onboarding glassy text here
            ],
          ),
        ],
      ),
    );
  }

  Widget hands() {
    return AnimatedCrossFade(
      alignment: Alignment.center,
        firstChild: const Icon(
          FontAwesomeIcons.solidHand,
          color: CustomColors.foregroundColor,
          size: 64,
        ),
        secondChild: const Icon(
          FontAwesomeIcons.solidHandSpock,
          color: CustomColors.foregroundColor,
          size: 64,
        ),
        crossFadeState: _showFirstIcon
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 250));
  }

  Widget assetImage() {
    return Image(image: AssetImage(widget.assetImage));
  }

  String fetchOnboardingHeadline() {
    switch (widget.index) {
      case 0:
        return OnboardingTexts.firstStepTitle;
      case 1:
        return OnboardingTexts.secondStepTitle;
    }
    return "";
  }
}
