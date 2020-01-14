import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/provider/CurrentUserModel.dart';
import 'package:hajjapp/screen/dua/MyDuaSavingPage.dart';
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
        body: Consumer<CurrentUserModel>(
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

class MyDuaListItem extends StatelessWidget {
  final MyDua dua;

  MyDuaListItem(this.dua);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyDuaSavingPage(dua: dua)));
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
                    decoration: BoxDecoration(color: Theme.of(context).accentColor),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
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
                        PopupMenuItem(value: 1, child: Text("কালার পরিবর্তন")),
                        PopupMenuItem(value: 2, child: Text("মুছুন")),
                      ];
                    },
                    onSelected: (value) {
                      print("value:$value");
                      if (value) {
                        switch (value) {
                          case 1:
                            break;
                          case 2:
                            Provider.of<CurrentUserModel>(context, listen: false).deleteDua(dua.key);
                            break;
                        }
                      }
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).accentColor),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
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
