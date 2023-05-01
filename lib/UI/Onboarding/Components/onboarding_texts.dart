class OnboardingTexts {
  static const String firstStepTitle = "Getting Started";
  static const String firstStepSubText =
      "Find a white sheet of A4 paper\nand place it on a flat and\nvisually uniform surface";
  static const String firstStepSubText2 =
      "Next, place your hand on the table\nwith your fingers spread.\n"
      "This is important for accurately\n measuring hand dimensions!";

  static const String secondStepTitle = "Camera Positioning";
  static const String secondStepSubText = "When taking a picture of your hand,\nit is very important"
      "to make sure\nthat the camera is imaging your hand\n as close to perpendicular as possible";
  static const String secondStepSubText2 = "When taking a picture of your hand,\nit is very important"
      "to make sure\nthat the camera is imaging your hand\n as close to perpendicular as possible";

  static const String thirdStepTitle = "";
  static const String thirdStepSubTitle = "";

  String getHeadlines(int index){
    List<String> headlines = [firstStepTitle, secondStepTitle];
    return headlines[index];
  }

  String getFirstsubtext(int index){
    List<String> headlines = [firstStepSubText, secondStepSubText];
    return headlines[index];
  }

  String getSecondsubtext(int index){
    List<String> headlines = [firstStepSubText2, secondStepSubText2];
    return headlines[index];
  }

}
