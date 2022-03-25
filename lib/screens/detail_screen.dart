// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Post "),

        actions: [
          IconButton(
            onPressed: () {}, 
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.edit,)
            )
          ),

          IconButton(
            onPressed: () {}, 
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.delete, color: Colors.pink,)
            )
          )
        ],
      ),

      body: ListView(
        children: [
          ListTile(
            title: Text(
              "montitre",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),

            subtitle: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "mon body",
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