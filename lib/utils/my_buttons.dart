// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Container myButton(String title, {void Function()? onPressed }) {
  return Container(
    height: 50.0,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 10),
    
    child: TextButton(
      onPressed:onPressed,
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.green,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}
