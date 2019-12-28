import 'package:hajjapp/model/AllDuaCategory.dart';
import 'package:hajjapp/screen/dua/DuaDetailPage.dart';
import 'package:flutter/material.dart';

class DuaTopicListItem extends StatelessWidget {
  int index;
  AllDuaCategory allDuatopic;

  DuaTopicListItem(this.index, this.allDuatopic);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left:10.0,right:10.0,top:3.0,bottom:0.0,),
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
                      builder: (context) =>
                          DuaDetailPage(allDuaCategory: allDuatopic)));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).accentColor),
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
                      allDuatopic.allDuatopic,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).accentColor),
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
