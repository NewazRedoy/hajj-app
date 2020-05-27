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
    return Container(
      child: Drawer(
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
                                child: Image.asset(
                                  "assets/images/Menu-Settings.png",
                                ),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                "Not Logged In",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  "assets/images/Menu-Settings.png",
                                ),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(user.firstName ?? ""),
                              Text("Macca,Saudi Arabia"),
                            ],
                          )
                  ],
                )),
//            user == null
//                ? UserAccountsDrawerHeader(
//                    currentAccountPicture: CircleAvatar(child: Image.asset("assets/images/Menu-Settings.png",),),
//                    accountName: Container(width: double.infinity,child: Text("Not Logged In",textAlign: TextAlign.center,)),
//                    accountEmail: Text("",textAlign: TextAlign.center,),
//                  )
//                : Container(
//                  child: UserAccountsDrawerHeader(
//                      currentAccountPicture: CircleAvatar(),
//                      accountName: Text(user.firstName ?? ""),
//                      accountEmail: Text("Macca,Saudi Arabia"),
//                    ),
//                ),
            ListTile(
              leading: Icon(Icons.person),
onTap: ()=> Provider.of<AuthProvider>(context, listen: false).signOut(),

//              leading: Image.asset("assets/images/Menu-Settings.png",height: 20,width: 20,),
              title: Text("লগআউট"),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/Menu-Settings.png",
                height: 20,
                width: 20,
              ),
              title: Text("সেটিংস"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage())),
            ),

            ListTile(
              leading: Image.asset(
                "assets/images/Menu-Rating&Review.png",
                height: 20,
                width: 20,
              ),
              title: Text("রেটিং এবং রিভিউ"),
              onTap: () {
                _launch(launchPlayRateUrl);
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/Menu-About-Us.png",
                height: 20,
                width: 20,
              ),
              title: Text("আমাদের সম্পর্কে"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutApp(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/Menu-Share.png",
                height: 20,
                width: 20,
              ),
              title: Text("শেয়ার করুন"),
              onTap: () {
                share(context);
              },
            ),
            ListTile(
                leading: Image.asset(
                  "assets/images/Menu-Bookmarks.png",
                  height: 20,
                  width: 20,
                ),
                title: Text("বুকমার্ক"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookmarkPage(),
                    ),
                  );
                }),
            ListTile(
                leading: Image.asset(
                  "assets/images/Menu-Contact.png",
                  height: 20,
                  width: 20,
                ),
                title: Text("যোগাযোগ"),
                onTap: () {
                  send();
                }),
          ],
        ),
      ),
    );
  }

  void share(BuildContext context) {
    final String text = "Muslim Scholars & Companios is the ultimate collection of biographies "
        "having birth/death,narrator grade,family members and tags to inspire us to learn about them."
        "\n\nGet it now at Google Play Store:"
        '\nhttps://goo.gl/80yGtV';
    Share.share(text, subject: text);
  }
}
