import 'package:flutter/material.dart';

class ListPageItem extends StatelessWidget {
  int index;
  String name;
  GestureTapCallback onTap;

  ListPageItem(this.index, this.name, this.onTap);

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
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 3.0,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).accentColor),
                  width: 4,
                ),
//                Container(
//                  padding: const EdgeInsets.symmetric(vertical: 21.0, horizontal: 18.0),
//                  child: Text(
//                    index.toString(),
//                    style: TextStyle(color: Colors.white, fontSize: 16),
//                  ),
//                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.0,
                  color: Colors.grey,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
