import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_form_with_phone_auth/screens/views/after_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// TODO initState
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), afterSplashScreen);
  }

  /// Callback function
  void afterSplashScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AfterSplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// Status Bar
            Container(
              child: Image.asset(
                'assets/welcomeScreen/status_bar_black.png',
                width: double.infinity,
              ),
            ),

            /// Background image
            Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Image.asset(
                'assets/doodles.jpg',
                fit: BoxFit.fill,
                height: double.infinity,
              ),
            ),

            /// Logo
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/app_logo.png'),
                radius: 80.0,
              ),
            ),

            /// Title
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 200.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Food",
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.orange,
                        fontFamily: 'Monsterrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "ie",
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.blueGrey[700],
                        fontFamily: 'Monsterrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),

            /// Subtitle
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 245.0),
              child: Text(
                "Food Delivery",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueGrey,
                  fontFamily: 'Monsterrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
