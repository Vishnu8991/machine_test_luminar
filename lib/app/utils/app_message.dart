import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppMessage {
  static showMessage(
      {required String text,
      Color? textColor,
      Color? headerColor,
      bool? webShowClose,
      Color? backgroundColor}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        webShowClose: webShowClose ?? false,
        backgroundColor: backgroundColor,
        textColor: textColor,
        webPosition: 'bottom',
        fontSize: 16.0);
  }
}
