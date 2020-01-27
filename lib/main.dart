import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/screen/HomePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentUserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            accentColor: Color.fromARGB(255, 167, 142, 114),
            fontFamily: 'Bangla',
            pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
            textTheme: TextTheme()),
        home: Home(),
      ),
    );
  }
}

const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders = <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
};
