import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:http/http.dart' as http;


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
  void initState() {
    getRate();
  }

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
                          rialController.text = (conversion * int.parse(text)).toStringAsFixed(2);
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
                          takaController.text = (int.parse(text) / conversion).toStringAsFixed(2);
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

  void getRate() async {
    var response = await http.get(
        "https://free.currconv.com/api/v7/convert?q=BDT_SAR&compact=ultra&apiKey=558d63f3c169865a4cb7");

    setState(() {
      conversion = json.decode(response.body)["BDT_SAR"];
      rialController.text = 1.toString();
      takaController.text = (int.parse(rialController.text) / conversion).toStringAsFixed(2);
    });
  }
}
