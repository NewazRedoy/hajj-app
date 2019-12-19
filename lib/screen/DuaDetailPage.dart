import 'package:flutter/material.dart';
import 'package:first_app/model/DuaSubTopicCategory.dart';
import 'package:first_app/model/DuaSubTopic.dart';
import 'package:first_app/util/Constants.dart';

class DuaDetailPage extends StatefulWidget {
  final DuaSubTopicCategory all;

  const DuaDetailPage({Key key, @required this.all,})
      : super(key: key);

  @override
  _DuaDetailPageState createState() =>
      _DuaDetailPageState(all);
}

class _DuaDetailPageState extends State<DuaDetailPage> {
  DuaSubTopicCategory all;

  _DuaDetailPageState(this.all);
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.all;
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
          all.duaSubtopic,
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

  DuaSubTopic duaSubTopic;

  NewWidget(this.duaSubTopic);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5.0,
      child: Column(children: <Widget>[
        Container(
          height: 50.0,
          padding: const EdgeInsets.all(6.0),
          child: Text(
            duaSubTopic.arabic,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(),
        Container(
          height: 50.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            duaSubTopic.bengali,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        Divider(),
        Container(
          height: 100.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            duaSubTopic.english,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ]),
    );
  }
}
