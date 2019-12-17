import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ("My Dua"),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 13.0, right: 22.0, top: 30, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Question",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Answer"),
              ],
            ),
          ),
        );
      }),
    );
  }
}
