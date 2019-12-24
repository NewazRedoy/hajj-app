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
        title: Text("রিয়াল-টাকা কনভার্টার"),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[

                TextField(
                  maxLines: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "টাকা",
                    hintText: "টাকা",
                  ),
                ),
            TextField(
              maxLines: 3,
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
