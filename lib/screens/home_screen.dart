// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import '../providers/data_provider.dart';
import '../utils/my_buttons.dart';
import '../utils/utils.dart';
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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

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



  void _newPostBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
          )
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Wrap(
              children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 3,
                      width: 40,
                      color: Colors.grey,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add Post',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 17
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey,),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          label: Text("Title")
                        ),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer un titre";
                          }
                        },
                        onSaved: (value) {
                          _titleController.text = value!;
                        },
                      ),

                      TextFormField(
                        controller: _bodyController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          label: Text("Description")
                        ),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer une description";
                          }
                        },
                        onSaved: (value) {
                          _bodyController.text = value!;
                        },
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                        child: myButton(
                          "Add",
                          onPressed: () async {
                            FocusScope.of(context).unfocus(); //fait entrer le clavier
                            
                            //valider les champs 
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            //valider les champs 
                            Utils.loadingDialog(context);

                            //appel de notre methode
                            await Provider.of<DataProvider>(context, listen: false).addPost(
                              _titleController.text, 
                              _bodyController.text
                            ).then((value) => {
                              if (value == "success") {
                                _titleController.clear(),
                                _bodyController.clear(),
                                Navigator.pop(context),
                                Navigator.pop(context),

                                Utils.showSnackbar(context, "Enregister avec sucèss", backColor: Colors.green)
                              } else {
                                Navigator.pop(context),
                                Utils.showSnackbar(context, "Une erreur s'est produite")
                              }
                            });
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          );
        }
    );
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
          _newPostBottomSheet(context);
        },
      )
    );
  }
}

