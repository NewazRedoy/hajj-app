import 'package:flutter/material.dart';
import 'package:hajjapp/model/SearchItem.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/repository/RepositoryInterface.dart';
import 'package:hajjapp/screen/dua/DuaDetailPage.dart';
import 'package:hajjapp/screen/questions/QuestionDetailPage.dart';
import 'package:hajjapp/screen/search/SearchDetailPage.dart';
import 'package:hajjapp/widgets/SearchListPageItem.dart';

import '../content/ContentDetailListPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List data = [];
  var loading = true;
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("অনুসন্ধান"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 20.0,left: 8.0,right: 8.0),
            child: TextField(
              autofocus: true,
              controller: textController,
              onChanged: (value) => {
                if (value.length > 3) {loadData(value)}
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "অনুসন্ধান করুন",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.blueGrey.withOpacity(0.2),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int position) {
                  SearchItem searchItem = data[position];

                  return SearchListPageItem((position + 1), searchItem.name, () {
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
          ),
          data.isNotEmpty
              ? Container(
                  alignment: Alignment.bottomLeft,
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchDetailPage(data),
                        ),
                      );
                    },
                    child: Text(
                      "সম্পূর্ণ রেজাল্ট দেখুন",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  loadData(String value) async {
    var subtopics = await DataProvider.of(context).querybySearch(value);

    setState(() {
      data = subtopics;
      loading = false;
    });
  }
}
