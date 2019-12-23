import 'package:first_app/model/Content.dart';
import 'package:flutter/material.dart';


class ContentListItem extends StatelessWidget {
  Content content;


  ContentListItem({this.content,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4.0,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(color: Colors.amber),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  content.content_id.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                 content.content_id.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(color: Colors.amber),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  content.textAr,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 22, fontFamily: 'Quran'),
                ),
                SizedBox(height: 6),
                Text(
                  content.textEn,
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(height: 6),
                Text(
                  content.referenceEn,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
