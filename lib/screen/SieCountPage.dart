import 'package:flutter/material.dart';

class SaiCount extends StatefulWidget {
  @override
  _SaiCountState createState() => _SaiCountState();
}

class _SaiCountState extends State<SaiCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("স'ঈ গণনা"),
      ),
      body: Column(
        children: <Widget>[
          Text(
              "সাফা থেকে শুরু করুন এবং মারওয়ায় পৌঁছে সাফা এবং মারওয়াতে ট্যাপ করুন"),
          Stack(
              children:[
                 Align( alignment: Alignment.bottomLeft,
                  child: Text("দু'আ তালিকা"),
                ),
              ],
            ),
          InkWell(
            onTap: () {},
            child: RawMaterialButton(
              fillColor: Colors.red,
              shape: StadiumBorder(),
              child: Text("শুরু করুন"),
            ),
          )
        ],
      ),
    );
  }
}
