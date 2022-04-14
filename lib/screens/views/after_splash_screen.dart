import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_form_with_phone_auth/screens/views/register_screen.dart';
import 'package:login_form_with_phone_auth/screens/views/login_screen.dart';

class AfterSplashScreen extends StatefulWidget {
  @override
  _AfterSplashScreenState createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// Background Shaped
            Container(child: Image.asset('assets/shaped_subtraction.png')),
            Container(child: Image.asset('assets/background_objects.png')),
            Container(
              padding: EdgeInsets.only(top: 30.0),
              child: Image.asset('assets/subtraction2.png'),
            ),

            /// Status Bar
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Image.asset(
                'assets/status_bar_white.png',
                width: double.infinity,
              ),
            ),

            /// Logo
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 60.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/app_logo.png'),
                radius: 65.0,
              ),
            ),

            /// Title
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 250.0),
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
              ),
            ),

            /// Subtitle
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 290.0),
              child: Image.asset("assets/food_delivery_text.png"),
            ),

            /// Descp
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 390.0),
              child: Image.asset("assets/discover the best foods.png"),
            ),

            /// Sign In
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 480.0),
                child: Image.asset("assets/login_button.png"),
              ),
            ),

            /// Sign Up
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 610.0),
                child: Image.asset("assets/create-an_account_button.png"),
              ),
            ),

            /// Rectangle Bar
            Container(
              padding: EdgeInsets.only(top: 690.0),
              child: Image.asset(
                'assets/welcomeScreen/rectangle183.png',
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
