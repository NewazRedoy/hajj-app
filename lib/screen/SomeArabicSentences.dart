import 'package:flutter/material.dart';
import 'package:first_app/screen/ElectedQuestion.dart';
class SomeArabicSentences extends StatefulWidget {
  @override
  _SomeArabicSentencesState createState() => _SomeArabicSentencesState();
}

class _SomeArabicSentencesState extends State<SomeArabicSentences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("কিছু আরবি বাক্য"),
        backgroundColor: Colors.cyan,
      ),
     body: ListView.builder(
         itemCount: 5,
         itemBuilder: (context, index) {
           return ElectedQuestion();
         },
     ),
    );
  }
}
