import 'package:flutter/material.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/model/DuaTopic.dart';

class DuaPage extends StatefulWidget {
  final DuaTopic dua_categories;


  const DuaPage({Key key, @required this.dua_categories,})
      : super(key: key);

  @override
  _DuaPageState createState() =>
      _DuaPageState(dua_categories);
}

class _DuaPageState extends State<DuaPage> {
  DuaTopic dua_categories;

  _DuaPageState(this.dua_categories);

  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.dua_categories;
    setState(() {
      data = content;
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dua_categories.duatopic,
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return NewWidget(data[index]);
        },
      ),
    );
  }
}






class NewWidget extends StatelessWidget {
  DuaTopic duaTopic;
  int index;
  NewWidget(this.duaTopic,this.index);

@override
  Widget build(BuildContext context) {
  return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 7.0,
      child: InkWell(
        onTap: () {},
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.amber),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  index.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  duaTopic.duatopic,
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
      ));
}


