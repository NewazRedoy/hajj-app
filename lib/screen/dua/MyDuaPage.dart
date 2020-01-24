import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/screen/dua/MyDuaSavingPage.dart';
import 'package:hajjapp/widgets/ColorChangeWidget.dart';
import 'package:hajjapp/widgets/MyDuaListItem.dart';
import 'package:provider/provider.dart';

class MyDuaPage extends StatefulWidget {
  @override
  MyDuaPageState createState() {
    return MyDuaPageState();
  }
}

class MyDuaPageState extends State<MyDuaPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(builder: (context, model, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            ("আমার দু'আ"),
          ),
        ),
        body: Consumer<CurrentUserProvider>(
          builder: (context, model, _) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return MyDuaListItem(model.duas[index]);
              },
              itemCount: model.duas.length,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyDuaSavingPage()));
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }
}

