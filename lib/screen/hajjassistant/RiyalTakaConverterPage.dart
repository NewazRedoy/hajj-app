import 'package:first_app/widgets/Search&Settings.dart';
import 'package:first_app/model/Subtopic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RiyalConverter extends StatefulWidget {
  final Subtopic subtopic;
  RiyalConverter(this.subtopic);
  @override
  _RiyalConverterState createState() => _RiyalConverterState();
}

class _RiyalConverterState extends State<RiyalConverter> {

  int takaValue =11;
  int rialValue = 200;

  double conversion = 1/20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subtopic.name_en),
        actions: <Widget>[SearchSettings(),],
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset("assets/images/BangladeshFlag.png", width: 48, height: 48,),
                      Text("বাংলাদেশ টাকা",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: takaValue.toString()),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 32,),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        print("First text field taka: $text");
                        setState(() {
                          rialValue = (conversion * int.parse(text)) as int;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset("assets/images/SaudiarabiaFlag.png", width: 48, height: 48,),
                      Text("সৌদি রিয়াল",
                      style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: rialValue.toString()),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 32),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        print("First text field: $text");
                        setState(() {
                          takaValue = (int.parse(text)/conversion) as int;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

