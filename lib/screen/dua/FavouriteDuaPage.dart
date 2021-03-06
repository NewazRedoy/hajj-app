import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:provider/provider.dart';

import 'DuaDetailPage.dart';

class FavouriteDuaPage extends StatefulWidget {
  @override
  _FavouriteDuaPageState createState() => _FavouriteDuaPageState();
}

class _FavouriteDuaPageState extends State<FavouriteDuaPage> {
  List data = [];
  var loading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadData();
  }

  loadData() async {
    var ids = Provider.of<AuthProvider>(context).favDuaId;
    var content = await DataProvider.of(context).queryFavDuas(ids);
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, model, widget) {
      return Scaffold(
          appBar: AppBar(
            title: Text("পছন্দ তালিকা"),
            actions: <Widget>[
              SearchSettings(),
            ],
          ),
          body: loading
              ? _buildCircularProgressIndicator()
              : data.isEmpty
                  ? Container(
                      child: Center(
                        child: Text("No Dua found"),
                      ),
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListPageItem(
                          (index + 1),
                          data[index].name,
                          () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return DuaDetailPage(data[index]);
                            }));
                          },
                        );
                      }));
    });
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
