import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/util/Validator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(builder: (context, model, _) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(46),
              decoration: new BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.elliptical(180, 35), bottomRight: Radius.elliptical(180, 35)),
              ),
              child: Form(
                  key: _registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "এখনও অ্যাকাউন্ট নেই??\nলগইন করুন অথবা রেজিষ্টার করুন ফ্রি",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'ব্যবহারকারীর নাম/ইউজারনেম*',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                              hintText: "john.doe"),
                          controller: emailInputController,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.emptyValidator),
                      SizedBox(height: 15.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            labelText: 'পাসওয়ার্ড*',
                            hintText: "********"),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: Validator.pwdValidator,
                      ),
                      SizedBox(height: 40.0),
                      RaisedButton(
                        child: Text('লগইন করুন'),
                        textColor: Colors.white,
                        elevation: 1.5,
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(16),
                        onPressed: () {
                          emailInputController.text = "nabil6391@gmail.com";
                          pwdInputController.text = "63916391";

                          if (_registerFormKey.currentState.validate()) {
//                              "sales@ultracoralaustralia.com";
//                          pwdInputController.text = "Nexus20!9";

                            model.loginUsingUsernamePassword(
                                context, emailInputController.text, pwdInputController.text);
                          }
                        },
                      ),
                      SizedBox(height: 15.0),
                      Center(
                        child: InkWell(
                          onTap: () => {
                            Navigator.of(context).pushReplacementNamed(Constants.ROUTE_SINGUP)

//                            model.gotoSignup()
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: 'অ্যাকাউন্ট নেই? ',
                              children: <TextSpan>[
                                TextSpan(text: 'সাইন আপ করুন', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      );
    });
  }
}
