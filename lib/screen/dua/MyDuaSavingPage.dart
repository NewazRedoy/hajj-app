import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/provider/CurrentUserModel.dart';
import 'package:provider/provider.dart';

class MyDuaSavingPage extends StatefulWidget {
  final MyDua dua;

  MyDuaSavingPage({this.dua});

  @override
  _MyDuaSavingPageState createState() => _MyDuaSavingPageState();
}

class _MyDuaSavingPageState extends State<MyDuaSavingPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dua == null ? "Add Dua" : "Edit Dua"),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 12.0,
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(hintText: "Text"),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DuaButton('Save', Colors.blue, () {
                  final title = titleController.text;
                  final text = textController.text;
                  ({
                    "title": title,
                    "text": text,
                  });

                  if (widget.dua == null) {
                    var dua = MyDua(text: text, title: title);

                    Provider.of<CurrentUserModel>(context, listen: false).addDua(dua);
                  } else {
                    widget.dua.title = title;
                    widget.dua.text = text;

                    Provider.of<CurrentUserModel>(context, listen: false).updateDua(widget.dua);
                  }

                  Navigator.pop(context);
                }),
                 DuaButton('Delete', Colors.red, () {
                        Provider.of<CurrentUserModel>(context, listen: false).deleteDua(widget.dua.key);
                        Navigator.pop(context);
                      })
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    if (widget.dua != null) {
      titleController.text = widget.dua.title;
      textController.text = widget.dua.text;
    }
  }
}

class DuaButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  DuaButton(this.text, this.color, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      color: color,
    );
  }
}
