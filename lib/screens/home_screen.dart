// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iposter/providers/data_provider.dart';
import 'package:iposter/utils/my_colors.dart';
import 'package:iposter/widgets/list_itel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> refreshPosts(BuildContext context) async {
    await Provider.of<DataProvider>(context, listen: false).fetchAndSetPosts();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Iposter")
      ),

      body: ListView(
        children: const [
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "Add more", 
          style: TextStyle(
            color: MyColors.black, 
            fontWeight: FontWeight.bold
          )
        ),
        icon: const Icon(Icons.add, color: MyColors.primary,), 
        backgroundColor: MyColors.white,
        onPressed: () {
          
        },
        
      )

    );
  }
}
