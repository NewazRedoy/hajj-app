import 'package:flutter/material.dart';
import 'package:hajjapp/provider/DataProvider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double bnSize = 0.0;
  double arSize = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bnSize = DataProvider.of(context).banglaFontSize;
    arSize = DataProvider.of(context).arabicFontSize;
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
            Text("বাংলা"),
            Row(
              children: [
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
                Text(bnSize.toStringAsFixed(2))
              ],
            ),
            Column(
              children: [
                Text("আরবী"),
                Row(
                  children: [
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
                    Text(arSize.toStringAsFixed(2))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
