import 'package:flutter/material.dart';

class TawafCountPage extends StatefulWidget {
  @override
  _TawafCountPageState createState() => _TawafCountPageState();
}

class _TawafCountPageState extends State<TawafCountPage> {
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
