import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/DuaDetail.dart';
import 'package:hajjapp/provider/database_helper.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class DuaDetailPage extends StatefulWidget {
  final DuaCategory allDuaCategory;

  const DuaDetailPage({
    Key key,
    @required this.allDuaCategory,
  }) : super(key: key);

  @override
  _DuaDetailPageState createState() => _DuaDetailPageState(allDuaCategory);
}

class _DuaDetailPageState extends State<DuaDetailPage> {
  DuaCategory allDuaCategory;

  _DuaDetailPageState(this.allDuaCategory);

  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await DatabaseHelper.instance.queryDuaByCategoryId(widget.allDuaCategory.id);
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          allDuaCategory.name,
        ),
        actions: <Widget>[
          SearchSettings(),
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return DuaDetailItem(DuaDetail.fromJson(data[index]));
        },
      ),
    );
  }
}

class DuaDetailItem extends StatelessWidget {
  DuaDetail allDuatopic;

  DuaDetailItem(this.allDuatopic);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5.0,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  allDuatopic.category_id.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  allDuatopic.category_id.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: 24.0,
                ),
                onPressed: () {},
              ),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Text(
                  "",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
              child: Divider(
            color: Colors.grey,
            height: 1,
          )),
          Container(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              allDuatopic.arabic,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              allDuatopic.bangla,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              allDuatopic.transliteration,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ]),
      ),
    );
  }
}
