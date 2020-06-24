import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/screen/SignupPage.dart';
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
    var user = Provider.of<AuthProvider>(context).user;
    return Consumer<AuthProvider>(builder: (context, model, _) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              user == null
                  ? Column(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                              AssetImage("assets/images/character.jpg"),
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
                          backgroundImage:
                              AssetImage("assets/images/character.jpg"),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(user.firstName ?? ""),
                      ],
                    ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "লগইন করুন",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: Form(
                      key: _registerFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'আপনার নাম',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  hintText: "someone"),
                              controller: emailInputController,
                              keyboardType: TextInputType.emailAddress,
                              validator: Validator.emptyValidator),
                          SizedBox(height: 15.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                labelText: 'আপনার পাসওয়ার্ড',
                                hintText: "********"),
                            controller: pwdInputController,
                            obscureText: true,
                            validator: Validator.pwdValidator,
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            margin: EdgeInsets.fromLTRB(65, 6, 65, 6),
                            child: RaisedButton(
                              child: Text('লগইন করুন'),
                              textColor: Colors.white,
                              elevation: 1.5,
                              color: Theme.of(context).primaryColor,
                              padding: EdgeInsets.all(16),
                              onPressed: () {
                                if (_registerFormKey.currentState.validate()) {
                                  model.loginUsingUsernamePassword(
                                      context,
                                      emailInputController.text,
                                      pwdInputController.text);
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Center(
                            child: InkWell(
                              onTap: () => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()))
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  text: 'নতুন অ্যাকাউন্ট খুলতে ',
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'সাইন আপ করুন',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
