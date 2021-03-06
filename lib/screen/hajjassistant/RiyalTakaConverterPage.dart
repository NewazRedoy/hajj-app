import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/provider/DataProvider.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    rialController.text = 1.toString();
    takaController.text = (int.parse(rialController.text) / DataProvider.of(context).conversion).toStringAsFixed(2);
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          "assets/images/BdFlag.png",
                          width: 80.0,
                        ),
                      ),
                      Text(
                        "বাংলাদেশী টাকা",
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      controller: takaController,
                      decoration: InputDecoration.collapsed(hintText: null),
//                    rialController.text = (DataProvider.of(context).conversion * int.parse(text)).toStringAsFixed(2)),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        setState(() {
                          rialController.text =
                              (DataProvider.of(context).conversion * int.parse(text)).toStringAsFixed(2);
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          "assets/images/SaudiarabiaFlag.png",
                          width: 80.0,
                        ),
                      ),
                      Text(
                        "সৌদি রিয়াল",
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
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
                          takaController.text =
                              (int.parse(text) / DataProvider.of(context).conversion).toStringAsFixed(2);
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
