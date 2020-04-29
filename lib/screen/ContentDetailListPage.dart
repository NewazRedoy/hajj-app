import 'package:flutter/material.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/ContentListItem.dart';
import 'package:hajjapp/widgets/PreparationListItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class ContentDetailListPage extends StatelessWidget {
  Subtopic subtopic;

  ContentDetailListPage(this.subtopic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            subtopic.name,
          ),
          actions: <Widget>[
            SearchSettings(),
          ],
        ),
        body: SampleAppPage(subtopic));
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage(this.subtopic);

  Subtopic subtopic;

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List data = [];
  var loading = true;

  _SampleAppPageState();

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? _buildCircularProgressIndicator()
        : new GestureDetector(
            onScaleUpdate: (ScaleUpdateDetails scaleDetails) {
//              setState(() {
//                int newNumberOfDays =
//                    (previousNumOfDays / scaleDetails.scale).round();
//                if (newNumberOfDays >= 7) {
//                  numberOfDays = newNumberOfDays;
//                }
//              });
            },
            child: widget.subtopic.topic_id == 4 && widget.subtopic.subtopic_id == 1
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int position) {
                      return PreparationListItem(subtopic: widget.subtopic, content: Content.fromMap(data[position]));
                    })
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int position) {
                      return ContentListItem(subtopic: widget.subtopic, content: Content.fromMap(data[position]));
                    }));
  }

  loadData() async {
    var content =
        await DataProvider.of(context).queryHadithsBySubtopicId(widget.subtopic.topic_id, widget.subtopic.subtopic_id);

    setState(() {
      data = content;
      loading = false;
    });
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
