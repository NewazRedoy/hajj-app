import 'package:flutter/material.dart';
import 'package:hajjapp/provider/DataProvider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double bnSize = 0.0;
  double enSize = 0.0;
  double arSize = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bnSize = DataProvider.of(context).banglaFontSize;
    arSize = DataProvider.of(context).arabicFontSize;
    enSize = DataProvider.of(context).englishFontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("সেটিংস"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
                child: Text(
              "টেক্রট সাইজ",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text("বাংলা"),
                  Slider.adaptive(
                    label: "$bnSize",
                    activeColor: Colors.green,
                    min: 12,
                    max: 50,
                    value: bnSize,
                    onChanged: (value) {
                      setState(() {
                        bnSize = value;
                      });
                      DataProvider.of(context).updateFont(bnValue: value);
                    },
                  ),
                  Column(
                    children: [
                      Text("ইংলিশ"),
                      Slider.adaptive(
                        label: "$enSize",
                        activeColor: Colors.green,
                        value: enSize,
                        min: 12,
                        max: 50,
                        onChanged: (value) {
                          setState(() {
                            enSize = value;
                          });
                          DataProvider.of(context).updateFont(enValue: value);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("আরবী"),
                      Slider.adaptive(
                        label: "$arSize",
                        activeColor: Colors.green,
                        value: arSize,
                        min: 12,
                        max: 50,
                        onChanged: (value) {
                          setState(() {
                            arSize = value;
                          });
                          DataProvider.of(context).updateFont(arValue: value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
