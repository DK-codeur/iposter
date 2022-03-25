// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Utils {

  
  static loadingDialog(BuildContext context, {String? msg}) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 150.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(msg ?? 'Veuillez patienter...',),
                ],
              ),
            ),
          );
        },
      );
    }

    static void showSnackbar(BuildContext context, String msg, {Color backColor = Colors.black}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$msg"), backgroundColor: backColor,)
      );
    }

}