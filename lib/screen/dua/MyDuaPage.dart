import 'package:first_app/model/MyDua.dart';
import 'package:first_app/provider/CurrentUserModel.dart';
import 'package:first_app/screen/dua/MyDuaSavingPage.dart';
import 'package:first_app/util/Constants.dart';
import 'package:flutter/material.dart';
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DuaTitle(dua.title),
            Divider(),
            DuaText(dua.text),
          ],
        ),
      ),
    );
  }
}

class DuaTitle extends StatelessWidget {
  final String title;

  DuaTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 7.0,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.amber),
          padding: const EdgeInsets.all(8.0),
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
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.amber),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "",
            style: TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }
}

class DuaText extends StatelessWidget {
  final String text;

  DuaText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
