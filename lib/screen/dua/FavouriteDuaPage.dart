import 'package:first_app/model/DuaTopic.dart';
import 'package:first_app/screen/dua/DuaSubTopicPage.dart';
import 'package:first_app/screen/dua/MyDuaPage.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:flutter/material.dart';

class FavouriteDuaPage extends StatefulWidget {
  @override
  _FavouriteDuaPageState createState() => _FavouriteDuaPageState();
}

class _FavouriteDuaPageState extends State<FavouriteDuaPage> {
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
      body: loading
          ? _buildCircularProgressIndicator()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                DuaTopic duaTopic = data[index];

                return ListPageItem((index + 1), duaTopic.duatopic, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (duaTopic.duatopic_id == 2) {
                      return MyDuaPage();
                    } else {
                      return AllDuaPage();
                    }
                  }));
                });
                return NewWidget(index, data[index]);
              },
            ),
    );
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

class NewWidget extends StatelessWidget {
  int index;
  DuaTopic duaTopic;

  NewWidget(this.index, this.duaTopic);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 7.0,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              if (duaTopic.duatopic_id == 2) {
                return MyDuaPage();
              } else {
                return AllDuaPage();
              }
            }));
          },
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
}
