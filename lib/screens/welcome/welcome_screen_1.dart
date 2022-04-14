import 'package:flutter/material.dart';
import 'package:login_form_with_phone_auth/screens/welcome/welcome_screen_2.dart';

class WelcomeScreenOne extends StatelessWidget {
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

            /// Logo
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 250.0),
              child: Image.asset(
                'assets/welcomeScreen/find_food_you_love_vector.png',
              ),
            ),

            /// Slider
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 130.0),
              child: Image.asset(
                'assets/welcomeScreen/slider_indicator1.png',
              ),
            ),

            /// Title
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 240.0),
              child: Image.asset(
                'assets/welcomeScreen/find_food_you_love.png',
              ),
            ),

            /// Descp
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 380.0),
              child: Image.asset("assets/discover the best foods.png"),
            ),

            /// Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WelcomeScreenTwo()));
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 520.0),
                child: Image.asset("assets/welcomeScreen/next_button.png"),
              ),
            ),

            /// Rectangle Bar
            Container(
              padding: EdgeInsets.only(top: 680.0),
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
