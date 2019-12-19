import 'package:first_app/screen/MyDuaSavingPage.dart';
import 'package:first_app/widgets/DuaInherit.dart';
import 'package:flutter/material.dart';

class MyDuaPage extends StatefulWidget {
  @override
  MyDuaPageState createState() {
    return MyDuaPageState();
  }
}
class MyDuaPageState extends State<MyDuaPage> {
  List<Map<String,String>> get duas => DuaInherit.of(context).duas;

  @override
  Widget build(BuildContext context) {
    return DuaInherit(
      Scaffold(
        appBar: AppBar(
          title: Text(
            ("আমার দু'আ"),
          ),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => MyDuaSavingPage(DuaMode.Editing)
                  ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                DuaTitle(duas[index]["title"]),
                  Divider(),
                  DuaText(duas[index]["text"]),
                ],
              ),
            ),
          );
        },
          itemCount: duas.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => MyDuaSavingPage(DuaMode.Adding)));
          },
          child: Icon(Icons.add),
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
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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

