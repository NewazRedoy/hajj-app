import 'package:first_app/model/ArabicSentencesCategory.dart';
import 'package:first_app/screen/hajjassistant/ArabicSentencesDetailPage.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:flutter/material.dart';

class ArabicSentencesTopicPage extends StatefulWidget {
  @override
  _ArabicSentencesTopicPageState createState() =>
      _ArabicSentencesTopicPageState();
}

class _ArabicSentencesTopicPageState extends State<ArabicSentencesTopicPage> {
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.sentense_categories;
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("কিছু আরবি বাক্য"),
        ),
        body: loading
            ? _buildCircularProgressIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  SentencesCategory sentencesCategory = data[index];

                  return ListPageItem(
                      (index + 1), sentencesCategory.sentencetopic, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArabicSentencesDetailPage(
                                  sentences: sentencesCategory,
                                )));
                  });
                }));
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

class NewWidget extends StatelessWidget {
  int index;
  SentencesCategory sentencesCategory;

  NewWidget(this.index, this.sentencesCategory);

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
                    builder: (context) => ArabicSentencesDetailPage(
                          sentences: sentencesCategory,
                        )));
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
                    sentencesCategory.sentencetopic,
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
