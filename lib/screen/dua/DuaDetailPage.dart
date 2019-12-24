import 'package:first_app/model/DuaDetail.dart';
import 'package:first_app/model/DuaSubTopicCategory.dart';
import 'package:first_app/util/Constants.dart';
import 'package:flutter/material.dart';

class DuaDetailPage extends StatefulWidget {
  final DuaSubTopicCategory duaSubCategory;

  const DuaDetailPage({
    Key key,
    @required this.duaSubCategory,
  }) : super(key: key);

  @override
  _DuaDetailPageState createState() => _DuaDetailPageState(duaSubCategory);
}

class _DuaDetailPageState extends State<DuaDetailPage> {
  DuaSubTopicCategory duaSubCategory;

  _DuaDetailPageState(this.duaSubCategory);

  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.all;
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
          duaSubCategory.duaSubtopic,
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return DuaDetailItem(data[index]);
        },
      ),
    );
  }
}

class DuaDetailItem extends StatelessWidget {
  DuaDetail duaSubTopic;

  DuaDetailItem(this.duaSubTopic);

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
                  duaSubTopic.duaSubcategory_id.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  duaSubTopic.duaSubcategory_id.toString(),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
              duaSubTopic.arabic,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              duaSubTopic.bengali,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              duaSubTopic.english,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ]),
      ),
    );
  }
}
