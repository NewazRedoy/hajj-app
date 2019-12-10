import 'package:flutter/material.dart';
import 'package:first_app/screen/SendQuestion.dart';


class QueAns extends StatefulWidget {
  @override
  _QueAnsState createState() => _QueAnsState();
}

class _QueAnsState extends State<QueAns> {
  hexColor(String colorCode) {
    String colorNew = '0xff' + colorCode;
    colorNew = colorNew.replaceAll('#', '');
    int colorInt = int.parse(colorNew);
    return colorInt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hajj App-guide"),
        backgroundColor: Color(hexColor('4F7491')),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Item(Icons.adjust, 'নির্বাচিত প্রশ্নোত্তর'),
          Item(Icons.adjust, 'প্রশ্ন করুন'),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final IconData adjust;
  final String s;
  Item(this.adjust, this.s);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 7.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => SendQuestion(),
              ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(adjust),
            SizedBox(
              height: 16,
            ),
            Text(s),
          ],
        ),
      ),
    );
  }
}
