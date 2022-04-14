import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_form_with_phone_auth/screens/views/forgotPwd_screen.dart';
import 'package:login_form_with_phone_auth/screens/views/otp_verification.dart';
import 'package:login_form_with_phone_auth/screens/views/register_screen.dart';
import 'package:login_form_with_phone_auth/screens/welcome/welcome_screen_1.dart';
import 'package:login_form_with_phone_auth/services/auth.dart';
import 'package:login_form_with_phone_auth/services/database.dart';
import 'package:login_form_with_phone_auth/shared/widgtes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userEmailController = new TextEditingController();
  TextEditingController userPasswordController = new TextEditingController();

  /// TODO Sign in Method
  signInMethod() async {
    try {
      if (formKey.currentState.validate()) {
        await AuthMethods()
            .signInWithEmailAndPassword(
                userEmailController.text, userPasswordController.text)
            .then((result) async {
          if (result != null) {
            QuerySnapshot snapshotUserInfo = await DatabaseMethods()
                .getUserByUserEmail(userEmailController.text);
            if (snapshotUserInfo.docs.length > 0) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreenOne()));
            } // third IF
          } // second IF
          else {
            showToaster("Verify your Email First!");
          }
        });
      } else {
        showToaster("Enter valid credentials !");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              /// Status Bar
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Image.asset(
                  'assets/welcomeScreen/status_bar_black.png',
                  width: double.infinity,
                ),
              ),

              /// Title
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 35.0),
                child: Text('Login', style: TextStyle(fontSize: 35.0)),
              ),

              /// Subtitle
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 85.0),
                child: Text('Add your details to login'),
              ),

              /// Form
              Container(
                padding: EdgeInsets.only(top: 140.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            /// email
                            TextFormField(
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration('Email'),
                              controller: userEmailController,
                              validator: (val) {
                                return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                ).hasMatch(val)
                                    ? null
                                    : "Valid email required";
                              },
                            ),
                            SizedBox(height: 20.0),

                            /// password
                            TextFormField(
                              style: simpleTextStyle(),
                              obscureText: true,
                              decoration: textFieldInputDecoration('Password'),
                              controller: userPasswordController,
                              validator: (val) {
                                return val.isEmpty || val.length < 6
                                    ? 'Minimum 6 characters required'
                                    : null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Button
                    GestureDetector(
                      onTap: () => signInMethod(),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 20.0),
                        child: Image.asset("assets/login_button.png"),
                      ),
                    ),

                    /// Forgot Password
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Forgot your Password ?',
                          style: TextStyle(
                            fontSize: 16.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),

                    /// or Login With
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: Center(child: Text("or Login With")),
                    ),

                    /// Facebook Button
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50.0,
                          child: Material(
                            shape: roundedButtonBorder(),
                            color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/facebook.PNG",
                                  width: 8.0,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  'Login with Facebook',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Google Button
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.0, right: 30.0, bottom: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPVerificationPage()),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          child: Material(
                            shape: roundedButtonBorder(),
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/googlePlus.png",
                                  width: 20.0,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  'Login with Google',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Don't have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an Account? ',
                            style: simpleTextStyle()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    /// Rectangle Bar
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                        'assets/welcomeScreen/rectangle183.png',
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
