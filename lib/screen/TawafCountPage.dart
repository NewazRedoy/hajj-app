import 'package:flutter/material.dart';

class TawafCount extends StatefulWidget {
  @override
  _TawafCountState createState() => _TawafCountState();
}

class _TawafCountState extends State<TawafCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("তাওয়াফ গণনা"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Text(
                "প্রতিবার হাজরে আসওয়াদের কাছে পৌঁছে নিচের বাটন ট্যাপ করুন"),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text("হাজরে আসওয়াদের কাছে পৌঁছেছেন"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text("দু'আ তালিকা"),
            ),
          ),
        ],
      ),
    );
  }
}
