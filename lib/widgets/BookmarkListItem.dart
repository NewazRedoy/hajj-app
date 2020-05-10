import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/screen/dua/MyDuaSavingPage.dart';
import 'package:provider/provider.dart';

import 'ColorChangeWidget.dart';

class BookmarkListItem extends StatelessWidget {
  final MyDua dua;

  BookmarkListItem(this.dua);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyDuaSavingPage(dua: dua)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 1.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                color: Color(dua.color ?? Colors.white.value),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Theme.of(context).accentColor),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        dua.title,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(value: 1, child: Text("কালার পরিবর্তন")),
                          PopupMenuItem(value: 2, child: Text("মুছুন")),
                        ];
                      },
                      onSelected: (value) {
                        print("value:$value");
                        switch (value) {
                          case 1:
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ColorChangeWidget(dua);
                                });
                            break;
                          case 2:
                            Provider.of<CurrentUserProvider>(context, listen: false).deleteDua(dua.key);
                            break;
                        }
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              Container(
                  child: Divider(
                color: Colors.grey,
                height: 1,
              )),
              Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    dua.text,
                    style: TextStyle(fontSize: 14.0),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
