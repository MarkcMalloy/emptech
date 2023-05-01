import 'dart:io';
import 'package:emptech.app.emptech/UI/Login/Components/login_butotn.dart';
import 'package:emptech.app.emptech/UI/Tabbar/tabbar_page.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkedin_login/linkedin_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String redirectUrl = 'https://emptech.app.emptech';
  final String clientId = '86czplxzrtvpz5';
  final String clientSecret = 't3RaxP98HR69IaTZ';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffafafa), body: loginBody());
  }

  Widget loginBody() {
    return Stack(
      children: [
        const Positioned(
            top: 0,
            child: Image(
              image: AssetImage("assets/honeycomb_2.png"),
            )),
        glassyBackground(),
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16.0),
                GlassContainer(
                  padding: const EdgeInsets.all(24),
                  height: 280, width: MediaQuery.of(context).size.width - 10,
                  borderRadius: BorderRadius.circular(36),
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
                  blur: 1, //
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Log in",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username or Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          prefixIcon: const Icon(FontAwesomeIcons.user),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          prefixIcon: const Icon(FontAwesomeIcons.lock),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginButton(
                      buttonTxt: "Sign in",
                      function: login,
                    ),
                    LoginButton(buttonTxt: "Sign Up", function: signup)
                  ],
                ),
                const SizedBox(height: 12.0),
                Center(
                  child: Text(
                    'or',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 12.0),
                Center(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 200,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(2),
                          color: Colors.redAccent,
                          onPressed: () {

                          },
                          icon: const Icon(
                            FontAwesomeIcons.linkedin,
                            color: CustomColors.foregroundColor,
                          ),
                          iconSize: 32.0,
                        ),
                        Text(
                          "Sign in with LinkedIn",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: CustomColors.foregroundColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget glassyBackground() {
    return GlassContainer(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      borderGradient: LinearGradient(
        // Set the gradient colors and stops to achieve the desired glass effect
        colors: [
          CustomColors.backgroundColor.withOpacity(0.2),
          CustomColors.backgroundColor.withOpacity(0.3)
        ],
        stops: [0.3, 0.7],
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Set the gradient colors and stops to achieve the desired glass effect
        colors: [
          CustomColors.foregroundColor.withOpacity(0.2),
          CustomColors.backgroundColor.withOpacity(0.2),
          CustomColors.backgroundColor.withOpacity(0.2),
          CustomColors.backgroundColor.withOpacity(0.1)
        ],
        stops: [0.3, 0.4, 0.6, 0.7],
      ),
      blur: 6, // Set the blur value to achieve the desired glass effect
    );
  }

  void login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => linkedInAuthOnly(),
      ),
    );
  }

  Widget linkedInAuthOnly() {
    return LinkedInAuthCodeWidget(
      destroySession: false,
      frontendRedirectUrl: "emptech.app.emptech" ,
      redirectUrl: redirectUrl,
      clientId: clientId,
      useVirtualDisplay: true,
      onError: (AuthorizationFailedAction value) {
        print("AUTH ERROR!");
      },
      onGetAuthCode: (AuthorizationSucceededAction value) {
        print("AUTH SUCCESS!");
        print('Access token ${value.codeResponse.accessToken}');
        print('Code: ${value.codeResponse.code}');
        print('State: ${value.codeResponse.state}');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const TabBarPage(
                      initialIndex: 3,
                    )));
      },
    );
  }
  // https://www.linkedin.com/developers/apps/verification/8b11772a-7a20-43a9-a70e-17a041d2ae7a
  Widget linkedInUserOnly() {
    return LinkedInUserWidget(
        onGetUserProfile: (UserSucceededAction linkedInUser) {
          print('Access token ${linkedInUser.user.token.accessToken}');
          print('First name: ${linkedInUser.user.firstName?.localized?.label}');
          print('Last name: ${linkedInUser.user.lastName?.localized?.label}');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const TabBarPage(
                    initialIndex: 3,
                  )));
        },
        onError: (UserFailedAction action){
          print("ERROR");
        },
        redirectUrl: redirectUrl,
        clientId: clientId,
        clientSecret: clientSecret);
  }



  void signup() {}
}