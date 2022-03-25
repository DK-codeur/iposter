// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iposter/models/posts.dart';
import 'package:provider/provider.dart';

import '../screens/detail_screen.dart';


class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final post = Provider.of<Posts>(context);

    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push( //go to detial page
            context, 
            CupertinoPageRoute(
              builder: (context) => DetailScreen(),
              settings: RouteSettings(
                arguments: post.id
              )
            ),
          );
        }, 
        child: Card(
          child: ListTile(
            leading: CircleAvatar(child: Text(post.id.toString()),),
            title: Text(
              post.title.toString()
            ),

            subtitle: Text(
              post.body.toString(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}