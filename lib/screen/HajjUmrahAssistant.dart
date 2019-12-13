import 'package:first_app/screen/RiyalTakaConverter.dart';
import 'package:first_app/screen/SieCount.dart';
import 'package:first_app/screen/SomeArabicSentences.dart';
import 'package:first_app/screen/TawafCount.dart';
import 'package:flutter/material.dart';

class HajjAssistant extends StatefulWidget {
  @override
  _HajjAssistantState createState() => _HajjAssistantState();
}

class _HajjAssistantState extends State<HajjAssistant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("হজ্জ - উমরাহ সহায়ক"),
      ),
      body: Center(
        child: Container(
          height:300.0,
              width:300.0,
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  Item(Icons.adjust, 'তাওয়াফ গণনা', 1),
                  Item(Icons.adjust, "স'ঈ গণনা", 2),
                  Item(Icons.adjust, "রিয়াল-টাকা কনভার্টার", 3),
                  Item(Icons.adjust, "কিছু আরবি বাক্য", 4),
                ],
              ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final int option;

  Item(this.icon, this.title, this.option);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 7.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              if (option < 2) {
                return TawafCount();
              }
              if (option == 2) {
                return SaiCount();
              }
              if (option == 3) {
                return RiyalConverter();
              } else {
                return SomeArabicSentences();
              }
            }),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            SizedBox(
              height: 16,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
   }
