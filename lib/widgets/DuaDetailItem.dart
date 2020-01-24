import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/DuaDetail.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:provider/provider.dart';

class DuaDetailItem extends StatelessWidget {
  Dua allDuatopic;
  DuaCategory allDuaCategory;
  DuaDetailItem(this.allDuatopic, this.allDuaCategory);

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
                  allDuatopic.id.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  allDuaCategory.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(value: 1, child: Text('Favourite')),
                  ];
                },
                onSelected: (value) {
                  print("value:$value");
                  switch (value) {
                    case 1:
                    Provider.of<CurrentUserProvider>(context, listen: false).setFavDuas(allDuatopic.id.toString());
                      break;
                    case 2:

                      break;
                  }
                },
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
