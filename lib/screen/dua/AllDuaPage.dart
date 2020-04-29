import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/DuaTopicListItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class AllDuaPage extends StatefulWidget {
  @override
  _AllDuaPageState createState() => _AllDuaPageState();
}

class _AllDuaPageState extends State<AllDuaPage> {
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await DataProvider.of(context).queryAllDuaCategories();

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
