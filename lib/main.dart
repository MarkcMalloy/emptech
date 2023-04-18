import 'package:emptech.app.emptech/API/api_service.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:emptech.app.emptech/Utils/emptech_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Onboarding/onboarding_page.dart';

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
 */


void main() {
  ApiService apiService = ApiService();
  apiService.sendImage();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: CustomColors.foregroundColor,

            textTheme: TextTheme(
                headline1: CustomTheme.headlineTextStyle,
                bodyText1: CustomTheme.subTextStyle),
          backgroundColor: CustomColors.foregroundColor,

          buttonTheme: CustomTheme.buttonTheme,
        ),
        home: const OnboardingPage());
  }
}
