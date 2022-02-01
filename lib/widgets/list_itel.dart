// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(),
          title: Text(
            "My nice Text"
          ),

          subtitle: Text("quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nost"),
        ),
      ),
    );
  }
}