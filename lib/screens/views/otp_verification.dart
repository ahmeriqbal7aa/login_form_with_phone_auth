import 'package:flutter/material.dart';
import 'package:login_form_with_phone_auth/screens/views/login_screen.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:login_form_with_phone_auth/shared/widgtes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPVerificationPage extends StatefulWidget {
  final String phoneNumber;
  OTPVerificationPage({this.phoneNumber});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _verificationID;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  /// TODO initState() method
  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  /// TODO _verifyPhone() method
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+92${widget.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          await FirebaseAuth.instance
              .signInWithCredential(authCredential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verID, int forceCodeResend) {
          setState(() {
            _verificationID = verID;
          });
        },
        codeAutoRetrievalTimeout: (String verID) {
          setState(() {
            _verificationID = verID;
          });
        },
        timeout: Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                child: Text(
                    'We have sent an OTP to'
                    '\n         Your Mobile',
                    style: TextStyle(fontSize: 30.0)),
              ),

              /// Subtitle
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 110.0),
                child: Text(
                  'Please check your Mobile Number '
                  '${widget.phoneNumber.substring(0, 3)}*****${widget.phoneNumber.substring(8)}'
                  '\n         continue to reset your password',
                ),
              ),

              /// OTP
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 220.0, left: 30.0, right: 30.0),
                child: PinPut(
                  fieldsCount: 6,
                  textStyle:
                      const TextStyle(fontSize: 25.0, color: Colors.white),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration,
                  selectedFieldDecoration: pinPutDecoration,
                  followingFieldDecoration: pinPutDecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(
                        PhoneAuthProvider.credential(
                            verificationId: _verificationID, smsCode: pin),
                      )
                          .then((value) async {
                        if (value.user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          .showSnackBar(SnackBar(content: Text('Invalid OTP')));
                    }
                  },
                ),
              ),

              /// Button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 350.0),
                  child: Image.asset("assets/welcomeScreen/next_button.png"),
                ),
              ),

              /// Did'nt Receive?
              Container(
                padding: EdgeInsets.only(top: 420.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Did\'nt Receive? ', style: simpleTextStyle()),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Click Here',
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
      ),
    );
  }
}
