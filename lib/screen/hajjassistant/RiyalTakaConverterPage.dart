import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class RiyalConverter extends StatefulWidget {
  final Topic topic;

  RiyalConverter(this.topic);

  @override
  _RiyalConverterState createState() => _RiyalConverterState();
}

class _RiyalConverterState extends State<RiyalConverter> {
  final TextEditingController rialController = TextEditingController();
  final TextEditingController takaController = TextEditingController();


  double conversion = 1 / 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.name),
        actions: <Widget>[
          SearchSettings(),
        ],
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
                      Image.asset(
                        "assets/images/BangladeshFlag.png",
                        width: 48,
                        height: 48,
                      ),
                      Text(
                        "বাংলাদেশ টাকা",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextField(
                      controller: takaController,
                      decoration: InputDecoration.collapsed(hintText: null),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        print("First text field taka: $text");
                        setState(() {
                          rialController.text = (conversion * int.parse(text)).toString();
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
                      Image.asset(
                        "assets/images/SaudiarabiaFlag.png",
                        width: 48,
                        height: 48,
                      ),
                      Text(
                        "সৌদি রিয়াল",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextField(
                      controller: rialController,
                      decoration: InputDecoration.collapsed(hintText: null),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 32),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        print("First text field: $text");
                        setState(() {
                          takaController.text = (int.parse(text) / conversion).toString();
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
