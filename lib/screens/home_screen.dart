// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iposter/providers/data_provider.dart';
import 'package:iposter/utils/my_buttons.dart';
import 'package:iposter/utils/my_colors.dart';
import 'package:iposter/utils/utils.dart';
import 'package:iposter/widgets/list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _formKey = GlobalKey<FormState>();

  var _isInit = true;
  var _isLoading = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

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
                        fontFamily: 'PoppinsReg',
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
                            FocusScope.of(context).unfocus();

                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            Utils.loadingDialog(context);

                            await Provider.of<DataProvider>(context, listen: false).addPost(
                              _titleController.text, 
                              _bodyController.text
                            ).then((value) => {
                                if (value == "success") {
                                  _titleController.clear(),
                                  _bodyController.clear(),
                                  Navigator.pop(context),
                                  Navigator.pop(context),

                                  Utils.showSnackbar(context, "Enregister avec sucèss", backColor: MyColors.primary)
                                } else {
                                  Navigator.pop(context),
                                  Utils.customToast("Une erreur s'est produite")
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
          _newPostBottomSheet(context);
        },
        
      )

    );
  }
}
