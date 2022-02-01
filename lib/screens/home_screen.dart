// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iposter/providers/data_provider.dart';
import 'package:iposter/utils/my_colors.dart';
import 'package:iposter/widgets/list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;

  Future<void> refreshPosts(BuildContext context) async {
    await Provider.of<DataProvider>(context, listen: false).fetchAndSetPosts();
  }

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

    final posts = Provider.of<DataProvider>(context, listen: false).post;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Iposter")
      ),

      body: (_isLoading) 
      ? Center(child: Text("Waiting..."))
      :RefreshIndicator(
        onRefresh: () => refreshPosts(context),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: posts[i],
            child: ListItem(),
          )
        )
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
