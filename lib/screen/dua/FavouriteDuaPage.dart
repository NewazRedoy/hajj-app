import 'package:first_app/model/DuaTopic.dart';
import 'package:first_app/screen/dua/AllDuaPage.dart';
import 'package:first_app/screen/dua/MyDuaPage.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:flutter/material.dart';

class FavouriteDuaPage extends StatefulWidget {
  @override
  _FavouriteDuaPageState createState() => _FavouriteDuaPageState();
}

class _FavouriteDuaPageState extends State<FavouriteDuaPage> {
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.dua_categories;
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? _buildCircularProgressIndicator()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                DuaTopic duaTopic = data[index];

                return ListPageItem((index + 1), duaTopic.duatopic, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (duaTopic.duatopic_id == 2) {
                      return MyDuaPage();
                    } else {
                      return AllDuaPage();
                    }
                  }));
                });
              },
            ),
    );
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

