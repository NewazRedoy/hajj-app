import 'package:flutter/material.dart';
import 'package:hajjapp/model/Content.dart';

class BookmarkListItem extends StatelessWidget {
  final Content dua;

  BookmarkListItem(this.dua);

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      dua?.title ?? "",
                      style: TextStyle(fontSize: 20),
                    ),
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
    );
  }
}
