import 'package:first_app/screen/SearchDetailPage.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
          SizedBox(
            height: 250.0,
          ),
          Container(alignment: Alignment.bottomRight,
            child: RaisedButton(
              color: Theme
                  .of(context)
                  .accentColor,
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => SearchDetailPage(),),
                );
              },
              child: Text(
                "সম্পূর্ণ রেজাল্ট দেখুন",
                style: TextStyle(color: Colors.white),
              ),),
          ),
        ],
      ),
    );
  }
}
