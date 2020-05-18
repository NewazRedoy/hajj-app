import 'package:flutter/material.dart';
import 'package:hajjapp/model/ArabicSentencesCategory.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/ArabicSentenceListItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class ArabicSentencesDetailPage extends StatefulWidget {
  final SentencesCategory sentenceCategory;

  const ArabicSentencesDetailPage({
    Key key,
    @required this.sentenceCategory,
  }) : super(key: key);

  @override
  _ArabicSentencesDetailPageState createState() => _ArabicSentencesDetailPageState();
}

class _ArabicSentencesDetailPageState extends State<ArabicSentencesDetailPage> {
  _ArabicSentencesDetailPageState();

  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await DataProvider.of(context).querySentenceByCategoryId(widget.sentenceCategory.id);
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
          widget.sentenceCategory.name,
        ),
        actions: <Widget>[
          SearchSettings(),
        ],
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
