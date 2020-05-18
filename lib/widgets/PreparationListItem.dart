import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class PreparationListItem extends StatelessWidget {
  Content content;
  Subtopic subtopic;

  PreparationListItem({
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
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Theme.of(context).accentColor),
                      width: 4.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        subtopic.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/More-Vert-Share.png",
                                  height: 20,
                                  width: 20,
                                ),
                                title: Text("শেয়ার করুন"),
                              )),
                          PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/More-Vert-Copy.png",
                                  height: 20,
                                  width: 20,
                                ),
                                title: Text("কপি"),
                              )),
                          PopupMenuItem(
                              value: 3,
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/Menu-Bookmarks.png",
                                  height: 20,
                                  width: 20,
                                ),
                                title: Text("বুকমার্ক"),
                              )),
                        ];
                      },
                      // ignore: missing_return
                      onSelected: (value) {
                        print("value:$value");
                        switch (value) {
                          case 1:
                            share(context);
                            break;
                          case 2:
                            Clipboard.setData(ClipboardData(text: content.text));
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("ক্লিপবর্ডে কপি করা হয়েছে"),
                            ));
                            break;
                          case 3:
                            Provider.of<AuthProvider>(context, listen: false).setBookmark(content.id.toString());
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("বুকমার্ক করা হয়েছে"),
                            ));
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
              SizedBox(height: 6),
              Image.asset(
                "assets/images/UmrahPreparation.png",
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  content.text,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void share(BuildContext context) {
    final String text = content.text;
    Share.share(text, subject: text);
  }
}
