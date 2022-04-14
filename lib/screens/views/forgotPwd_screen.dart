import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_form_with_phone_auth/services/auth.dart';
import 'package:login_form_with_phone_auth/shared/widgtes.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with SingleTickerProviderStateMixin {
  /// TODO Variable
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController userEmailController = new TextEditingController();

  /// TODO Forgot Password Method
  forgotPwdMethod() async {
    try {
      if (formKey.currentState.validate()) {
        // final FirebaseAuth _auth = FirebaseAuth.instance;
        // await _auth.sendPasswordResetEmail(email: userEmailController.text);
        await AuthMethods().resetForgotPassword(userEmailController.text);
        Navigator.of(context).pop();
        showToaster("Link has been sent to your email !");
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
                child: Text('Reset Password', style: TextStyle(fontSize: 35.0)),
              ),

              /// Subtitle
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 85.0),
                child: Text(
                  '   Please enter your email to receive a'
                  '\nlink to create a new password via Email',
                ),
              ),

              /// Form
              Container(
                padding: EdgeInsets.only(top: 180.0),
                child: Column(
                  children: [
                    /// email
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Form(
                        key: formKey,
                        child: TextFormField(
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
                      ),
                    ),

                    /// Button
                    Padding(
                      padding: EdgeInsets.only(
                          top: 30.0, left: 30.0, right: 30.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () => forgotPwdMethod(),
                              child: Text(
                                'Send',
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

                    /// Rectangle Bar
                    Container(
                      padding: EdgeInsets.only(top: 350.0),
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
