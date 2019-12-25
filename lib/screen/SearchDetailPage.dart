import 'package:first_app/widgets/Search&Settings.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/model/ArabicSentencesCategory.dart';
import 'package:flutter/material.dart';

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
          :ListView.builder(
            itemCount: data.length,

            itemBuilder: (context, index){
              SentencesCategory sentencesCategory = data[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(left:16.0,right: 16.0,top:30.0,bottom:30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                     Text(
                       sentencesCategory.sentencetopic,
                       style:TextStyle(
                           fontSize: 22.0,
                           fontWeight: FontWeight.bold
                       ),
                     ),
                     Text(
                     sentencesCategory.sentencetopic,
                       style: TextStyle(
                           color: Colors.grey.shade600
                       ),
                     )
                 ],
              ),
            ),
          );}
        ),
      );
  }
}
_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
