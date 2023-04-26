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