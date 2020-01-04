import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/provider/CurrentUserModel.dart';
import 'package:hajjapp/screen/dua/MyDuaSavingPage.dart';
import 'package:hajjapp/util/Constants.dart';
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
    return Consumer<CurrentUserModel>(builder: (context, model, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            ("আমার দু'আ"),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MyDuaListItem(data[index]);
          },
          itemCount: data.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyDuaSavingPage(DuaMode.Adding)));
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }

  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.duas;
    setState(() {
      data = content;
      loading = false;
    });
  }
}

class MyDuaListItem extends StatelessWidget {
  MyDua dua;

  MyDuaListItem(this.dua);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyDuaSavingPage(DuaMode.Editing)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).accentColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      dua.title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(child: Text("কালার পরিবর্তন")),
                        PopupMenuItem(child: Text("মুছুন")),
                      ];
                    },
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).accentColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Container(
                  child: Divider(
                color: Colors.grey,
                height: 1,
              )),
              Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    dua.text,
                    style: TextStyle(fontSize: 14.0),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
