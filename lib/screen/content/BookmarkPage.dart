import 'package:flutter/material.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/BookmarkListItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<Content> data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
   loadData();
  }

  loadData() async {
    var ids = Provider.of<AuthProvider>(context).bookmarkId;
    var content = await DataProvider.of(context).queryBookmarkedContent(ids);
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
          title: Text("বুকমার্ক"),
          actions: <Widget>[
            SearchSettings(),
          ],
        ),
        body: loading
            ? _buildCircularProgressIndicator()
            : data.isEmpty
                ? Container(
                    child: Center(
                      child: Text("কোন বুকমার্ক পাওয়া যায়নি"),
                    ),
                  )
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return BookmarkListItem(data[index]);
                    },
                  ),
      );
    });
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
