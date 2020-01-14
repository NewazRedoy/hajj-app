import 'package:flutter/material.dart';
import 'package:hajjapp/model/ArabicSentencesCategory.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:hajjapp/widgets/SearchListDetailItem.dart';

class SearchDetailPage extends StatefulWidget {
  @override
  _SearchDetailPageState createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
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
        title: Text("অনুসন্ধান"),
        actions: <Widget>[SearchSettings()],
      ),
      body: loading
          ? _buildCircularProgressIndicator()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                SentencesCategory sentencesCategory = data[index];
                return SearchListDetailItem(sentencesCategory: sentencesCategory);
              }),
    );
  }
}



_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
