import 'package:first_app/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  hexColor (String colorCode) {
    String colorNew= '0xff' + colorCode;
    colorNew= colorNew.replaceAll('#', '');
    int colorInt = int.parse(colorNew);
    return colorInt;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal,
          textTheme: TextTheme()),
      home: Home(),
    );
  }
}
