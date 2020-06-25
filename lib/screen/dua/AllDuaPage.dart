import 'package:flutter/material.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

import 'DuaDetailPage.dart';

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
                  return ListPageItem(
                    (index + 1),
                    data[index].name,
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DuaDetailPage(data[index]);
                      }));
                    },
                  );
                }));
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
