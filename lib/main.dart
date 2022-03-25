// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iposter/providers/data_provider.dart';
import './screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvider(),
      child: MaterialApp(
        title: 'Flutter API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomeScreen()
      ),
    );
  }
}
