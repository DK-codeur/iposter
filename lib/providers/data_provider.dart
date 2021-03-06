import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:iposter/models/posts.dart';
import 'package:iposter/utils/constant.dart';

class DataProvider with ChangeNotifier{

  List<Posts> _posts = [];
  List<Posts> get post {
    return [..._posts];
  }


  Future<void> fetchAndSetPosts() async {
    final url = '$API_ENDPOINT/posts';

    try {
      
      final response = await http.get(Uri.parse(url));
      print('get:' + '${response.statusCode}');
      final extractedData = json.decode(response.body);

      if(extractedData == null) {
        return;
      }

      print("============== Data fetched");

      final List<Posts> loadedPosts = [];
      for (var i = 0; i < extractedData.length; i++) {
        var postItem = Posts.fromJson(extractedData[i]); 
        loadedPosts.add(postItem);
      }

      _posts = loadedPosts;
      notifyListeners();


    } catch (error) {
      throw error;
    }
  }

  Future<String> addPost(String title, String body) async {
    final url = '$API_ENDPOINT/posts';

    try {
      final response = await http.post(
        Uri.parse(url),
         headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "title": title,
          "body": body,
          "userId": 1
        })
      );

      print("================ ${response.body}");
      print("================ ${response.statusCode}");

      if (response.statusCode == 201) {
        return "success";
      } else {
        return "error";
      }
      
    } catch (e) {
      rethrow;
    }
  }



  Posts postById(int id) {
    return _posts.firstWhere((post) => post.id == id);
  }

  


}