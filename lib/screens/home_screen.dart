// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import '../providers/data_provider.dart';
import '../widgets/list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if(_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<DataProvider>(context).fetchAndSetPosts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    final posts = Provider.of<DataProvider>(context, listen: false).posts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("FLUTTER API")
      ),

      body: _isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: posts[i],
          child: ListItem(),
        )
      ),
      

      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "Add more", 
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold
          )
        ),
        icon: const Icon(Icons.add, color: Colors.green,), 
        backgroundColor: Colors.white,
        onPressed: () {
          
        },
      )
    );
  }
}

