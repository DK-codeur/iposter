// ignore_for_file: prefer_const_constructors

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {

  static void customToast(String? msg) {
    Fluttertoast.showToast(
      msg: '${msg.toString()}',
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      // fontSize: 13.0
    );
  }


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
                  SpinKitRing(
                    color: Theme.of(context).primaryColor,
                    lineWidth: 1.5,
                    size: 40.0,
                  ),
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