// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iposter/providers/data_provider.dart';
import 'package:iposter/utils/my_colors.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {

    final postId = ModalRoute.of(context)!.settings.arguments as int;
    final post = Provider.of<DataProvider>(context).postById(postId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Post - ${post.id.toString()}"),

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

      body: ListView(
        children: [
          ListTile(
            title: Text(
              post.title.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),

            subtitle: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                post.body.toString(),
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}