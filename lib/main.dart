import 'package:first_app/screen/Home.dart';
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
      color: Color(hexColor('4F7491')),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme()),
      home: Home(),
    );
  }
}
