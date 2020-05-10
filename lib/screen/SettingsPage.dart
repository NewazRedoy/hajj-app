import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double size = 0.0;
  double size1 = 0.0;
  double size2 = 0.0;
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

            Center(child: Text("টেক্রট সাইজ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),


            Padding(padding: EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text("বাংলা"),
                  Slider.adaptive(
                    label: "$size",
                    activeColor: Colors.green,
                    value: size,
                    onChanged: (value) {
                      setState(() {
                        size = value;
                      });
                    },
                  ),
                  Column(
                    children: [
                      Text("ইংলিশ"),
                      Slider.adaptive(
                        label: "$size1",
                        activeColor: Colors.green,
                        value: size1,
                        onChanged: (value) {
                          setState(() {
                            size1 = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("আরবী"),
                      Slider.adaptive(
                        label: "$size2",
                        activeColor: Colors.green,
                        value: size2,
                        onChanged: (value) {
                          setState(() {
                            size2 = value;
                          });
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
