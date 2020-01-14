import 'package:flutter/material.dart';
import 'package:hajjapp/provider/database_helper.dart';
import 'package:hajjapp/widgets/DuaTopicListItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

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
    var content = await DatabaseHelper.instance.queryAllDuaCategories();
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("সব দু'আ"),
        actions: <Widget>[
          SearchSettings(),
        ],
      ),
      body: loading
          ? _buildCircularProgressIndicator()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return DuaTopicListItem(index + 1, data[index]);
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
