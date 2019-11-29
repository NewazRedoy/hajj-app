import 'package:flutter/material.dart';
import 'package:first_app/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch:Colors.cyan),
    home: Home(),

  ));
}