
import 'package:first_app/model/DuaSubTopicCategory.dart';
import 'package:first_app/screen/dua/DuaDetailPage.dart';
import 'package:flutter/material.dart';

class DuaTopicListItem extends StatelessWidget {
  int index;
  DuaSubTopicCategory duaSubTopic;

  DuaTopicListItem(this.index, this.duaSubTopic);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 7.0,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DuaDetailPage(duaSubCategory: duaSubTopic)));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).accentColor),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      index.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      duaSubTopic.duaSubtopic,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).accentColor),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
          )),
    );
  }
}
