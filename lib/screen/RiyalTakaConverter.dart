import 'package:flutter/material.dart';

class RiyalConverter extends StatefulWidget {
  @override
  _RiyalConverterState createState() => _RiyalConverterState();
}

class _RiyalConverterState extends State<RiyalConverter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("রিয়াল-টাকা কনভাটার"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "টাকা",
                hintText: "টাকা",
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "রিয়াল",
                hintText: "রিয়াল",
              ),
            )
          ],
        ),
      ),
    );
  }
}
