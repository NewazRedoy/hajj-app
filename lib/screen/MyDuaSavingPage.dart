import 'package:first_app/widgets/DuaInherit.dart';
import 'package:flutter/material.dart';
enum DuaMode{
  Editing,
  Adding,
}
class MyDuaSavingPage extends StatefulWidget {
  final DuaMode duaMode;

  MyDuaSavingPage(this.duaMode);
  @override
  _MyDuaSavingPageState createState() => _MyDuaSavingPageState();
}

class _MyDuaSavingPageState extends State<MyDuaSavingPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  List<Map<String,String>> get duas => DuaInherit.of(context).duas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         widget.duaMode == DuaMode.Adding ? "Add Dua" : "Edit Dua"
        ),
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
              decoration: InputDecoration(
              hintText: "Title"
            ),),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  hintText: "Text"
              ),
            ),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DuaButton('Save', Colors.blue, () {
                  if (widget?.duaMode == DuaMode.Adding) {
                    final title = titleController.text;
                    final text = textController.text;
                    duas.add({
                      "title":title,
                      "text":text,
                    });
                  }
                  Navigator.pop(context);
                }),
                DuaButton('Diccard', Colors.amber, () {
                  Navigator.pop(context);
                }),
                widget.duaMode == DuaMode.Editing ?
                DuaButton('Delete', Colors.red, () {
                  Navigator.pop(context);
                }) : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

class DuaButton extends StatelessWidget {
 final String text;
 final Color color;
 final Function onPressed;
  DuaButton(this.text, this.color,this.onPressed);
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
