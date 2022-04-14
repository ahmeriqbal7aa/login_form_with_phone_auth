import 'package:flutter/material.dart';

class WelcomeScreenTwo extends StatelessWidget {
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
                'assets/welcomeScreen/fast_delivery_vector.png',
              ),
            ),

            /// Slider
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 130.0),
              child: Image.asset(
                'assets/welcomeScreen/slider_indicator2.png',
                width: 35.0,
              ),
            ),

            /// Title
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 240.0),
              child: Image.asset(
                'assets/welcomeScreen/fast_delivery_text.png',
                width: 190.0,
              ),
            ),

            /// Descp
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 350.0),
              child: Text(
                "Fast food delivery to your home,"
                "\n       office wherever you are",
              ),
            ),

            /// Button
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 520.0),
              child: Image.asset("assets/welcomeScreen/next_button.png"),
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
