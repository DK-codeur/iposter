import 'package:flutter/material.dart';
import 'package:iposter/providers/data_provider.dart';
import 'package:iposter/screens/home_screen.dart';
import 'package:iposter/utils/my_colors.dart';
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
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "CenturyGothic",
          primarySwatch: MyColors.primary,
        ),
        home: HomeScreen()
      ),
    );
  }
}
