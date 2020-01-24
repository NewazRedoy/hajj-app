import 'package:flutter/material.dart';
import 'package:hajjapp/model/SearchItem.dart';
import 'package:hajjapp/provider/database_helper.dart';
import 'package:hajjapp/screen/ContentDetailListPage.dart';
import 'package:hajjapp/screen/dua/DuaDetailPage.dart';
import 'package:hajjapp/screen/questions/ElectedQuestionDetailPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:hajjapp/widgets/SearchListDetailItem.dart';

class SearchDetailPage extends StatefulWidget {

  List data;
  SearchDetailPage(this.data);

  @override
  _SearchDetailPageState createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
//  List data = [];
  var loading = false;
//
//  @override
//  void initState() {
//    super.initState();
//
//    loadData();
//  }

//  loadData() async {
//    var content = await DatabaseHelper.instance.querybySearch("সা'ঈ");
//    setState(() {
//      data = content;
//      loading = false;
//    });
//  }

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
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                SearchItem searchItem = widget.data[index];
                return SearchListDetailItem(searchItem, () {
                  if (searchItem.viewtype == PageViewType.Content) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentDetailListPage(searchItem.item),
                        ));
                  } else if (searchItem.viewtype == PageViewType.Dua) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DuaDetailPage(searchItem.item),
                        ));
                  } else if (searchItem.viewtype == PageViewType.Question) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionDetailPage(searchItem.item),
                        ));
                  }
                });
              }),
    );
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
