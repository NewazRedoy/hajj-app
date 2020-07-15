import 'package:flutter/material.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/util/FontFamily.dart';

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

  var banglaFonts = [FontFamily.kalpurush, FontFamily.aponalohit, FontFamily.siyamrupali];
  var arabicFonts = [FontFamily.mequran, FontFamily.kitab, FontFamily.qalam];

  @override
  Widget build(BuildContext context) {
    var currentFont = DataProvider.of(context).banglaFont;
    var currentArabicFont = DataProvider.of(context).arabicFont;
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
              "টেক্সট সাইজ",
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
            ToggleButtons(
              hoverColor: Colors.green[700],
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Kalpurush',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'AponaLohit',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'SiyamRupali',
                  ),
                ),
              ],
              onPressed: (int index) {
                DataProvider.of(context).updateFontFamily(banglaFontValue: banglaFonts[index]);
              },
              isSelected: [
                currentFont == FontFamily.kalpurush,
                currentFont == FontFamily.aponalohit,
                currentFont == FontFamily.siyamrupali,
              ],
            ),
            ToggleButtons(
              hoverColor: Colors.green[700],
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'MeQuran',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Kitab',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Qalam',
                  ),
                ),
              ],
              onPressed: (int index) {
                DataProvider.of(context).updateFontFamily(arabicFontValue: arabicFonts[index]);
              },
              isSelected: [
                currentArabicFont == FontFamily.mequran,
                currentArabicFont == FontFamily.kitab,
                currentArabicFont == FontFamily.qalam,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
