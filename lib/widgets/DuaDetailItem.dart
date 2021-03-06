import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/DuaDetail.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/util/FontFamily.dart';
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
        elevation: 3,
        child: Column(children: <Widget>[
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).accentColor),
                  width: 4,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
//                  child: Text(
//                    allDuatopic.id.toString(),
//                    style: TextStyle(color: Colors.black, fontSize: 16),
//                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    allDuaCategory.name,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(value: 1, child: Text('ফেভারিট')),
                    ];
                  },
                  onSelected: (value) {
                    print("value:$value");
                    switch (value) {
                      case 1:
                        Provider.of<AuthProvider>(context, listen: false).setFavDuas(allDuatopic.id.toString());
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("ফেভারিট করা হয়েছে"),
                        ));
                        break;
                      case 2:
                        break;
                    }
                  },
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
            padding: const EdgeInsets.all(6.0),
            child: Text(
              allDuatopic.arabic,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: DataProvider.of(context).arabicFontSize,
                  fontWeight: FontWeight.bold,
                  fontFamily: DataProvider.of(context).arabicFont),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              allDuatopic.bangla ?? "",
              style: TextStyle(fontSize: DataProvider.of(context).banglaFontSize),
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              allDuatopic.transliteration,
              style: TextStyle(fontSize: DataProvider.of(context).banglaFontSize),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              allDuatopic.reference ?? "",
              style: TextStyle(fontSize: DataProvider.of(context).banglaFontSize, color: Colors.grey),
            ),
          ),
        ]),
      ),
    );
  }
}
