import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/screen/dua/DuaDetailPage.dart';

class DuaTopicListItem extends StatelessWidget {
  int index;
  DuaCategory allDuatopic;

  DuaTopicListItem(this.index, this.allDuatopic);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 3.0,
        bottom: 0.0,
      ),
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 7.0,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DuaDetailPage(allDuatopic)));
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  index.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  allDuatopic.name,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                child: Text(
                  "",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ]),
          )),
    );
  }
}
