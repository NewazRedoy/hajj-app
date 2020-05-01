import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
  Future<void> Launched;

  // ignore: non_constant_identifier_names
  String LaunchPlayUrl = 'https://play.google.com/store/apps/details?id=com.greentech.hadith&hl=en';

  // ignore: non_constant_identifier_names
  String LaunchGreenTechUrl = 'https://greentechapps.com/';

  // ignore: non_constant_identifier_names
  Future<void> _Launch(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.clear)),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
//                          _Launch(LaunchPlayUrl);
                        },
                        child: Image(
                          image: AssetImage("assets/images/app_icon.png"),
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                      Text(
                        "HADITH",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1.4.1.1',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Hadith Collection(All in one)is an ultimate collection of Hadith of Prophet Muhammad (Peace Be Upon Him)."
                  "The app contains 41000+ hadith from most accepted and authentic Hadith books."
                  "\n\nReference and courtesy of Sunnah.com"
                  "\n\nIf you find any errors in the hadith, please report it to us"
                  "\n\nMay Allah have mercy on the collectors,translators and developers of the Hadiths",
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Important Note:",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text('We feel compelled to make an observation here:'
                    '\nthis is not a fiqh or fatwa application.Hadith are made available on the application as a resourse for reasearch,personal study'
                    'and understanding. the text of one or few hadith alone are not taken as rullings by themselves;scholars have a sophisticated'
                    'process using the principles of fiqh to come up withrullings. We do not advocated do-it-yourself fiqh using these hadithfor those who'
                    'are untrained in these principles. If you have a question on a speecific rulling, please ask your local scholar.'),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    _Launch(LaunchGreenTechUrl);
                  },
                  child: Image(
                    image: AssetImage("assets/images/greentech_icon.png"),
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
