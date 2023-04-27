import 'package:emptech.app.emptech/UI/Design/glass_overlay.dart';
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
  final String redirectUrl = 'http://emptech.app.emptech';
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
                  padding: EdgeInsets.all(24),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (final BuildContext context) =>
                                    LinkedInAuthCodeWidget(
                                  redirectUrl: redirectUrl,
                                  clientId: clientId,
                                  onError: (final AuthorizationFailedAction e) {
                                    print('Error: ${e.toString()}');
                                    print('Error: ${e.stackTrace.toString()}');
                                  },
                                  onGetAuthCode:
                                      (final AuthorizationSucceededAction
                                          response) {
                                    print(
                                        'Auth code ${response.codeResponse.code}');

                                    print(
                                        'State: ${response.codeResponse.state}');
                                    setState(() {});

                                    Navigator.pop(context);
                                  },
                                ),
                                fullscreenDialog: true,
                              ),
                            );
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
          /*
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.3)
                 */
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
        builder: (BuildContext context) => LinkedInAuthCodeWidget(
          redirectUrl: redirectUrl,
          clientId: clientId,
          onError: (AuthorizationFailedAction value) {
            print("AUTH ERROR!");
          },
          onGetAuthCode: (AuthorizationSucceededAction value) {
            print("AUTH SUCCESS!");
            print('Access token ${value.codeResponse.accessToken}');
            print('Code: ${value.codeResponse.code}');
            print('State: ${value.codeResponse.state}');
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TabBarPage(initialIndex: 3,)));
          },
        ),
      ),
    );
  }

  void signup() {}

  void loginWithOAuth() {}
}

/*
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // LinkedIn API credentials and configuration
  static const String _clientId = 'YOUR_CLIENT_ID';
  static const String _clientSecret = 'YOUR_CLIENT_SECRET';
  static const String _authorizationEndpoint =
      'https://www.linkedin.com/oauth/v2/authorization';
  static const String _tokenEndpoint =
      'https://www.linkedin.com/oauth/v2/accessToken';
  static const String _redirectUrl = 'YOUR_REDIRECT_URL';
  static const List<String> _scopes = ['r_liteprofile', 'r_emailaddress'];

  // Function to handle OAuth 2.0 login
  void _loginWithOAuth2(BuildContext context) async {
    // Create an AuthorizationCodeGrant instance
    final grant = oauth2.AuthorizationCodeGrant(
      _clientId,
      Uri.parse(_authorizationEndpoint),
      Uri.parse(_tokenEndpoint),
      secret: _clientSecret,
    );

    // Build the authorization URL
    final authorizationUrl =
        grant.getAuthorizationUrl(Uri.parse(_redirectUrl), scopes: _scopes);

    // Redirect to the authorization URL
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            _WebViewPage(authorizationUrl.toString()),
      ),
    );

    // Handle the authorization result
    if (result != null) {
      final code = Uri.parse(result).queryParameters['code'];

      if (code != null) {
        try {
          // Exchange the authorization code for an access token
          final tokenResponse = await grant.handleAuthorizationCode(code);

          // Successful login, do something with the access token
          String accessToken = tokenResponse.credentials.accessToken;
          print('Access Token: $accessToken');
          // Navigate to the next screen or perform any other logic
        } catch (error) {
          // Login failed, show an error message
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Login Failed'),
              content: Text('Unable to login with LinkedIn. Please try again.'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        // Authorization code not found, show an error message
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text(
                'Unable to retrieve authorization code. Please try again.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Use BoxDecoration to set the background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background_image.jpg'), // Replace with your actual background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () => _loginWithOAuth2(context),
            child: Text('Login with LinkedIn'),
          ),
        ),
      ),
    );
  }
}
 */
