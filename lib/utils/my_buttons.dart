// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iposter/utils/my_colors.dart';

Container myButton(String title, {void Function()? onPressed }) {
  return Container(
    height: 50.0,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 10),
    
    child: TextButton(
      onPressed:onPressed,
      style: TextButton.styleFrom(
        // primary: Colors.white,
        backgroundColor: MyColors.primary,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: MyColors.primary, width: 1.4),
          borderRadius: BorderRadius.all(
            Radius.circular(3)
          )
        ), 
      ),
      child: Text(
        title,
        style: TextStyle(
          color: MyColors.white,
          fontFamily: 'CenturyGothic',
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}
