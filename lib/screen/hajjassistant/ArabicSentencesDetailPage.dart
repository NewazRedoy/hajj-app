import 'package:first_app/model/ArabicSentences.dart';
import 'package:first_app/model/ArabicSentencesCategory.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/widgets/ArabicSentenceListItem.dart';
import 'package:flutter/material.dart';

class ArabicSentencesDetailPage extends StatefulWidget {
  final SentencesCategory sentences;

  const ArabicSentencesDetailPage({
    Key key,
    @required this.sentences,
  }) : super(key: key);

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
          return ArabicSentenceListItem(data[index]);
        },
      ),
    );
  }
}

