import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

InputDecoration textFieldInputDecoration(String labelText) {
  return InputDecoration(
    fillColor: Colors.grey.withOpacity(0.3),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    labelText: labelText,
    labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
  );
}

InputDecoration phoneTextFieldInputDecoration(String labelText) {
  return InputDecoration(
    fillColor: Colors.grey.withOpacity(0.3),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
      borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
    ),
    prefix: Padding(padding: EdgeInsets.all(4), child: Text('+92')),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    labelText: labelText,
    labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
  );
}

showToaster(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey.shade700,
    textColor: Colors.white,
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(fontSize: 17.0);
}

RoundedRectangleBorder roundedButtonBorder() {
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0));
}
