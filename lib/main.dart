import 'package:first_app/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal,
        textTheme: TextTheme()),
    home: Home(),
  ));
}
