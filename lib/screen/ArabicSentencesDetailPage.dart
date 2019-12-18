import 'package:flutter/material.dart';
import 'package:first_app/model/ArabicSentences.dart';
import 'package:first_app/model/ArabicSentencesCategory.dart';
import 'package:first_app/util/Constants.dart';

class ArabicSentencesDetailPage extends StatefulWidget {
  final SentencesCategory sentences;


  const ArabicSentencesDetailPage({Key key, @required this.sentences,})
      : super(key: key);

  @override
  _ArabicSentencesDetailPageState createState() =>
      _ArabicSentencesDetailPageState(sentences);
}

class _ArabicSentencesDetailPageState extends State<ArabicSentencesDetailPage> {
  SentencesCategory sentences;

  _ArabicSentencesDetailPageState(this.sentences);
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.sentences;
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
          sentences.sentencetopic,
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

  ArabicSentences arabicSentences;

  NewWidget(this.arabicSentences);

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
            arabicSentences.bengali,
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
            arabicSentences.arabic,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        Divider(),
        Container(
          height: 100.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            arabicSentences.pronunciation,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ]),
    );
  }
}
