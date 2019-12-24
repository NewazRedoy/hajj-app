import 'package:first_app/util/Constants.dart';
import 'package:first_app/widgets/DuaTopicListItem.dart';
import 'package:flutter/material.dart';

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
    var content = await Constants.duaSub_categories;
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("সব দু'আ")),
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
