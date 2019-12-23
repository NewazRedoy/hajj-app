import 'package:first_app/provider/CurrentUserModel.dart';
import 'package:first_app/screen/HomePage.dart';
import 'package:first_app/util/HexToColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentUserModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            accentColor: Color.fromARGB(255, 167, 142, 114),
            textTheme: TextTheme()
        ),
        home: Home(),
      ),
    );
  }
}
