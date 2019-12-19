
import 'package:flutter/material.dart';

class DuaInherit extends InheritedWidget{
  final duas = [
    {"title": "পরিবার",
      "text":"কেও চাইলে নিজের ব্যাক্তিগত দু'আ এখানে সেইভ করে রাখতে পারে ।",
    },
    {"title": "Bangladesh",
      "text":"Kew chaile nij desher dua korte pare. Upore akta button thakbe jekhane dua creat korar option thakbe.",
    },
    {"title": "Sara muslim ummahr jonno dua",
      "text":"amar dua option tha ashole ekta note pad er moto. ekhn je jar Khushi moto dua likhe rakhte parbe. amar dua option tha ashole akta note pad er moto.",
    }
  ];

  DuaInherit(Widget child) : super(child:child);

  static DuaInherit of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(DuaInherit)as DuaInherit);
  }

  @override
  bool updateShouldNotify(DuaInherit oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.duas != duas;
  }
}