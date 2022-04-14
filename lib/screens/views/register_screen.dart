import 'package:flutter/material.dart';
import 'package:login_form_with_phone_auth/screens/views/login_screen.dart';
import 'package:login_form_with_phone_auth/screens/views/otp_verification.dart';
import 'package:login_form_with_phone_auth/services/auth.dart';
import 'package:login_form_with_phone_auth/shared/widgtes.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // TODO Variables
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userEmailController = new TextEditingController();
  TextEditingController userPhoneController = new TextEditingController();
  TextEditingController userAddressController = new TextEditingController();
  TextEditingController userPasswordController = new TextEditingController();
  TextEditingController userConformPwdController = new TextEditingController();

  // TODO Sign up Method
  signUpMethod() async {
    try {
      if (formKey.currentState.validate()) {
        await AuthMethods()
            .registerWithEmailAndPassword(
          userNameController.text,
          userEmailController.text,
          userPhoneController.text,
          userAddressController.text,
          userPasswordController.text,
        )
            .then((value) {
          if (value != null) {
            value.sendEmailVerification();
            showToaster("Email sent for verification");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    OTPVerificationPage(phoneNumber: userPhoneController.text),
              ),
            );
          } else {
            showToaster("Already registered");
          }
        }).catchError((e) {
          print(e.toString());
        });
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
                child: Text('Sign Up', style: TextStyle(fontSize: 35.0)),
              ),

              /// Subtitle
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 85.0),
                child: Text('Add your details to sign up'),
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
                            /// name
                            TextFormField(
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration('Name'),
                              controller: userNameController,
                              validator: (val) {
                                return val.isEmpty || val.length < 3
                                    ? 'Minimum 3+ characters required'
                                    : null;
                              },
                            ),
                            SizedBox(height: 20.0),

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

                            /// mobile
                            TextFormField(
                              style: simpleTextStyle(),
                              decoration:
                                  phoneTextFieldInputDecoration('Mobile No'),
                              keyboardType: TextInputType.phone,
                              controller: userPhoneController,
                              validator: (val) {
                                return RegExp(
                                  // "^(?:[+0]9)?[0-9]{10,12}",
                                  "^[0-9]{3}[0-9]{7}",
                                ).hasMatch(val)
                                    ? null
                                    : 'Format XXXXXXXXXX';
                              },
                            ),
                            SizedBox(height: 20.0),

                            /// address
                            TextFormField(
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration('Address'),
                              controller: userAddressController,
                              validator: (val) {
                                return val.isEmpty || val.length > 50
                                    ? 'Minimum 50 characters required'
                                    : null;
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
                            SizedBox(height: 20.0),

                            /// conform password
                            TextFormField(
                              style: simpleTextStyle(),
                              obscureText: true,
                              decoration:
                                  textFieldInputDecoration('Confirm Password'),
                              controller: userConformPwdController,
                              validator: (val) {
                                return val == userPasswordController.text
                                    ? null
                                    : 'Password did\'nt matched';
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Button
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20.0, left: 30.0, right: 30.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () => signUpMethod(),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              color: Colors.orange.shade700,
                              shape: roundedButtonBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an Account? ',
                            style: simpleTextStyle()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Login',
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
                  ],
                ),
              ),

              /// Rectangle Bar
              Container(
                padding: EdgeInsets.only(top: 685.0),
                child: Image.asset(
                  'assets/welcomeScreen/rectangle183.png',
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
