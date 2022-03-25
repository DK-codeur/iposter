
import 'package:flutter/material.dart';
class Posts with ChangeNotifier {

  int? userId;
  int? id;
  String? title;
  String? body;

  Posts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });


  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

}
