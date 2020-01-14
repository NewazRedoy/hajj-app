import 'package:flutter/material.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/model/Subtopic.dart';

class ContentListItem extends StatelessWidget {
  Content content;
  Subtopic subtopic;

  ContentListItem({
    this.content,
    this.subtopic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).accentColor),
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      content.content_id.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      subtopic.name_en,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      size: 24.0,
                    ),
                    onPressed: () {},
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
              SizedBox(height: 6),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  content.textAr,
//                  textAlign: TextAlign.end,
//                  style: TextStyle(fontSize: 22, fontFamily: 'Quran'),
//                ),
//              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  content.text,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              SizedBox(height: 6),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  content.referenceEn,
//                  style: TextStyle(fontSize: 12),
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
