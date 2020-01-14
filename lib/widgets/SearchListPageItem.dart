import 'package:flutter/material.dart';

class SearchListPageItem extends StatelessWidget {
  int index;
  String name;
  GestureTapCallback onTap;

  SearchListPageItem(this.index, this.name, this.onTap);

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
        elevation: 7.0,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                padding: const EdgeInsets.all(18.0),
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
                  name,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
                child: Text(
                  "",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
