// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iposter/utils/my_colors.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),

        actions: [
          IconButton(
            onPressed: () {}, 
            icon: CircleAvatar(
              backgroundColor: MyColors.white,
              child: Icon(Icons.edit,)
            )
          ),

          IconButton(
            onPressed: () {}, 
            icon: CircleAvatar(
              backgroundColor: MyColors.white,
              child: Icon(Icons.delete, color: MyColors.danger,)
            )
          )
        ],
      ),
    );
  }
}