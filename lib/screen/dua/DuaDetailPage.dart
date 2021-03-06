import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/DuaDetailItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class DuaDetailPage extends StatefulWidget {
  final DuaCategory allDuaCategory;

  DuaDetailPage(this.allDuaCategory);

  @override
  _DuaDetailPageState createState() => _DuaDetailPageState(allDuaCategory);
}

class _DuaDetailPageState extends State<DuaDetailPage> {
  DuaCategory allDuaCategory;

  _DuaDetailPageState(this.allDuaCategory);

  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await DataProvider.of(context).queryDuaByCategoryId(widget.allDuaCategory.id);
    print(widget.allDuaCategory.id);
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
          allDuaCategory.name,
        ),
        actions: <Widget>[
          SearchSettings(),
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return DuaDetailItem(data[index], widget.allDuaCategory);
        },
      ),
    );
  }
}
