import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/screen/SettingsPage.dart';
import 'package:hajjapp/screen/content/BookmarkPage.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AboutApp.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Future<void> send() async {
    final Email email = Email(
      recipients: ['example@example.com'],
    );
    await FlutterEmailSender.send(email);
  }

  Future<void> launched;

  String launchFBUrl = 'https://m.facebook.com/GreenTech0';

  String launchPlayUrl = 'https://play.google.com/store/apps/details?id=com.greentech.muslimscholars';

  String launchPlayRateUrl = 'https://play.google.com/store/apps/details?id=com.greentech.muslimscholars';

  Future<void> _launch(String url) async {
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
    var user = Provider.of<AuthProvider>(context).user;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                child: Column(
                  children: [
                    user == null
                        ? Column(
                            children: [
                              CircleAvatar(
                                radius: 40.0,
                                backgroundImage: AssetImage("assets/images/character.jpg"),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "লগইন করা নাই",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              CircleAvatar(
                                radius: 40.0,
                                backgroundImage: AssetImage("assets/images/character.jpg"),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(user.firstName ?? ""),
                            ],
                          )
                  ],
                )),
            if (Provider.of<AuthProvider>(context, listen: false).user != null)
              ListTile(
                leading: Icon(Icons.person),
                onTap: () =>
                    Provider.of<AuthProvider>(context, listen: false).signOut(),
                title: Text("লগআউট"),
              ),
            drawerImageItemTitle(
              "assets/images/Menu-Settings.png",
              "সেটিংস",
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage())),
            ),
            drawerImageItemTitle(
              "assets/images/Menu-Rating&Review.png",
              "রেটিং এবং রিভিউ",
              () => _launch(launchPlayRateUrl),
            ),
            drawerImageItemTitle(
              "assets/images/Menu-About-Us.png",
              "আমাদের সম্পর্কে",
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutApp(),
                ),
              ),
            ),
            drawerImageItemTitle(
              "assets/images/Menu-Share.png",
              "শেয়ার করুন",
              () => share(context),
            ),
            drawerImageItemTitle(
              "assets/images/Menu-Bookmarks.png",
              "বুকমার্ক",
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarkPage(),
                ),
              ),
            ),
            drawerImageItemTitle(
              "assets/images/Menu-Contact.png",
              "যোগাযোগ",
              () => send(),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerImageItemTitle(
    String image,
    String tileName,
    Function onTap,
  ) {
    return ListTile(
      leading: Image.asset(
        image,
        height: 28.0,
        width: 28.0,
      ),
      title: Text(
        tileName,
        style: TextStyle(fontSize: 18.0),
      ),
      onTap: onTap,
    );
  }

  void share(BuildContext context) {
    final String text =
        "Muslim Scholars & Companios is the ultimate collection of biographies "
        "having birth/death,narrator grade,family members and tags to inspire us to learn about them."
        "\n\nGet it now at Google Play Store:"
        '\nhttps://goo.gl/80yGtV';
    Share.share(text, subject: text);
  }
}
