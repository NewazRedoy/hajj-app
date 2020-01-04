import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaTopic.dart';
import 'package:hajjapp/screen/dua/AllDuaPage.dart';
import 'package:hajjapp/screen/dua/FavouriteDuaPage.dart';
import 'package:hajjapp/screen/dua/MyDuaPage.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';

class DuaTopicPage extends StatefulWidget {
  @override
  _DuaTopicPageState createState() => _DuaTopicPageState();
}

class _DuaTopicPageState extends State<DuaTopicPage> {
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
                    if (duaTopic.duatopic_id == 1) {
                      return AllDuaPage();
                    } else if (duaTopic.duatopic_id == 2) {
                      return MyDuaPage();
                    } else {
                      return FavouriteDuaPage();
                    }
                  }));
                });
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
