import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/provider/database_helper.dart';
import 'package:hajjapp/widgets/DuaTopicListItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:provider/provider.dart';

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

//    loadData();
  }

  loadData() async {
    var ids = Provider.of<CurrentUserProvider>(context).favDuaId;
    var content = await DatabaseHelper.instance.queryFavDuas(ids);
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<CurrentUserProvider>(

     builder: (context,model, widget ){

      if(model.favDuaId.isNotEmpty) loadData();

     return Scaffold(
        appBar: AppBar(
          title: Text("সব দু'আ"),
          actions: <Widget>[
            SearchSettings(),
          ],
        ),
        body: loading
            ? _buildCircularProgressIndicator()
            : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return DuaTopicListItem(index + 1,  DuaCategory.fromJson(data[index]));
                  },
                ),

      );
     }
    );
        }

}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
