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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 65,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(image: AssetImage("assets/images/BdFlag.png"), fit: BoxFit.cover)),
                    ),
                    Text(
                      "বাংলাদেশী টাকা",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    controller: takaController,
                    decoration: InputDecoration(hintText: null),
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
                  children: <Widget>[
                    Container(
                      width: 65,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                              image: AssetImage("assets/images/SaudiarabiaFlag.png"), fit: BoxFit.cover)),
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
    );
  }
}
