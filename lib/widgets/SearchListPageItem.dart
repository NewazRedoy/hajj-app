import 'package:flutter/material.dart';

class SearchListPageItem extends StatelessWidget {
  int index;
  String name;
  GestureTapCallback onTap;

  SearchListPageItem(this.index, this.name, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
      child: InkWell(
        onTap: onTap,
        child: Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
