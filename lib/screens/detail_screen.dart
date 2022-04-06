// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';
import '../utils/utils.dart'; 

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    
    //recuperation de l'argument id
    final postId = ModalRoute.of(context)!.settings.arguments as int;
    //requete avec postById
    final post = Provider.of<DataProvider>(context).postById(postId);
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Post - ${post.id.toString()}"), //implementation de l'id
        actions: [
          IconButton(
            onPressed: () async {

              Utils.loadingDialog(context);
              await Provider.of<DataProvider>(context, listen: false).updatePost(post.id).then((value) => {
                if (value == "success") {
                  Navigator.pop(context),
                  Navigator.pop(context),

                  Utils.showSnackbar(context, "Modifié avec sucèss", backColor: Colors.green)
                } else {
                  Navigator.pop(context),
                  Utils.showSnackbar(context, "Une erreur s'est produite")
                }
              });
            
            }, 
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.edit,)
            )
          ),

          IconButton(
            onPressed: () async {
              Utils.loadingDialog(context);
              await Provider.of<DataProvider>(context, listen: false).deletePost(post.id).then((value) => {
                if (value == "success") {
                  Navigator.pop(context),
                  Navigator.pop(context),

                  Utils.showSnackbar(context, "Supprimé avec sucèss", backColor: Colors.green)
                } else {
                  Navigator.pop(context),
                  Utils.showSnackbar(context, "Une erreur s'est produite")
                }
              });
            }, 
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
              post.title.toString(), //implementation de du title
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),

            subtitle: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                post.body.toString(), //implementation de body
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