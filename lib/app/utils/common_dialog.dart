import 'dart:developer';

import 'package:flutter/material.dart';

class CommonDialog {
  static void showLoadingDialog(BuildContext context, [String? text]) {
    log("DialogOpen.........");
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.75,
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.black87,
                ),
              ),
              Center(
                child: Container(
                  width: text != null ? 200 : 100,
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.white12,
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black26,
                    //     blurRadius: 10,
                    //     offset: Offset(0, 5),
                    //   ),
                    // ],
                  ),
                  child: Center(
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              // const Color(0xFFFF795E)),
                              Colors.blue),
                          strokeWidth: 4.0,
                        ),
                        text != null
                            ? Text(
                                "$text",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.3),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    log("ClosingDialog.........");
  }

  static void closeLoadingDialog(BuildContext context) {
    log("ClosingDialog.........");
    Navigator.of(context).pop();
  }
}