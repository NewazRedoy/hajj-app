import 'package:first_app/model/DuaSubTopicCategory.dart';
import 'package:first_app/model/DuaTopic.dart';
import 'package:first_app/screen/DuaDetailPage.dart';
import 'package:first_app/util/Constants.dart';
import 'package:flutter/material.dart';

class DuaSubTopicPage extends StatefulWidget {
  @override
  _DuaSubTopicPageState createState() => _DuaSubTopicPageState();
}

class _DuaSubTopicPageState extends State<DuaSubTopicPage> {
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
      appBar: AppBar(
        title: Text("সব দু'আ")
      ),
      body: loading
          ? _buildCircularProgressIndicator()
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
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
  DuaSubTopicCategory duaSubTopic;

  NewWidget(this.index, this.duaSubTopic);

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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                       DuaDetailPage(all: duaSubTopic)));
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
                    duaSubTopic.duaSubtopic,
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
