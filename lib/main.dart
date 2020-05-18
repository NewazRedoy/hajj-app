import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/screen/BottomNavigation.dart';
import 'package:hajjapp/util/FontFamily.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFF537790),
            accentColor: Color(0xFFA5936E),
            fontFamily: FontFamily.bangla,
            pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
            textTheme: TextTheme(
            )),
        home: BottomNavigation(),
      ),
    );
  }
}

const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders = <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  // TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
};
