import 'package:emptech.app.emptech/API/api_service.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:emptech.app.emptech/Utils/emptech_theme.dart';
import 'package:flutter/material.dart';
import 'UI/Onboarding/onboarding_page.dart';
import 'UI/Tabbar/tabbar_page.dart';

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
 */


// #2 Place your hand in the middle of a white piece of A4 paper, on a table which is NOT white
// Step #3 Position your phone vertically above the center of the hand (See figure 2). If you stand up with the piece of paper on a desk, the height of your phone should be between your elbow and shoulder. Make sure all corners of the piece of paper are visible!

void main() {
  ApiService apiService = ApiService();
  apiService.sendImage();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
            /*
            textTheme: TextTheme(
                headline1: CustomTheme.headlineTextStyle,
                bodyText1: CustomTheme.subTextStyle),
          backgroundColor: CustomColors.foregroundColor,
             */
          buttonTheme: CustomTheme.buttonTheme,
        ),
        home: const TabBarPage());
  }
}
