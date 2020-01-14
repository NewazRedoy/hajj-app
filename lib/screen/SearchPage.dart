import 'package:flutter/material.dart';
import 'package:hajjapp/provider/database_helper.dart';
import 'package:hajjapp/screen/SearchDetailPage.dart';
import 'package:hajjapp/widgets/SearchListPageItem.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List data = [];
  var loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("অনুসন্ধান"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
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
            child:
                ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int position) {
                      var subtopic = data[position];

                      return SearchListPageItem((position + 1), subtopic.name, () {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => ContentDetailListPage(subtopic),
//                        ));
                      });
                    }),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchDetailPage(),
                  ),
                );
              },
              child: Text(
                "সম্পূর্ণ রেজাল্ট দেখুন",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  loadData(String value) async {
    var subtopics = await DatabaseHelper.instance.querybySearch(value);

    setState(() {
      data = subtopics;
      loading = false;
    });
  }
}
