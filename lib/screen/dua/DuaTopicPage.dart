import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaTopic.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/screen/dua/AllDuaPage.dart';
import 'package:hajjapp/screen/dua/FavouriteDuaPage.dart';
import 'package:hajjapp/screen/dua/MyDuaPage.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:provider/provider.dart';

import '../AppDrawerPage.dart';
import '../LoginPage.dart';

class DuaTopicPage extends StatefulWidget {
  @override
  _DuaTopicPageState createState() => _DuaTopicPageState();
}

class _DuaTopicPageState extends State<DuaTopicPage> {
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
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text("দু'আ"),
        actions: <Widget>[SearchSettings()],
      ),
      body: loading
          ? _buildCircularProgressIndicator()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                DuaTopic duaTopic = data[index];

                return ListPageItem((index + 1), duaTopic.duatopic, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (duaTopic.duatopic_id == 1) {
                      return AllDuaPage();
                    } else if (duaTopic.duatopic_id == 2) {
                      var user = Provider.of<CurrentUserProvider>(context).user;
                      if (user == null) {
                        return LoginPage();
                      } else
                        return MyDuaPage();
                    } else {
                      return FavouriteDuaPage();
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
