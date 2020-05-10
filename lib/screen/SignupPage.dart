import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/screen/LoginPage.dart';
import 'package:hajjapp/util/Validator.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(builder: (context, model, _) {
      var checkboxValue = false;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(36),
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
                          " সাইন আপ করুন",
                          textAlign: TextAlign.start,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'ই-মেইল*',
                              hintText: "john.doe@gmail.com"),
                          controller: emailInputController,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.emailValidator,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                              labelText: 'পাসওয়ার্ড*',
                              hintText: "********"),
                          controller: pwdInputController,
                          obscureText: true,
                          validator: Validator.pwdValidator,
                        ),
                        SizedBox(height: 22.0),
                        RaisedButton(
                          child: Text('সাইন আপ করুন'),
                          textColor: Colors.white,
                          elevation: 1.5,
                          color: Theme.of(context).primaryColor,
                          padding: EdgeInsets.all(16),
                          onPressed: () {
                            if (_registerFormKey.currentState.validate()) {
                              model.signUpUsingUsernamePassword(context,
                                  emailInputController.text, pwdInputController.text);
                            }
                          },
                        ),
                        SizedBox(height: 14.0),
                        Center(
                          child: InkWell(
                            onTap: () => {
//                              model.gotoLogin()

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()))

                            },
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে?',
                                children: <TextSpan>[
                                  TextSpan(text: 'লগইন করুন', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Center(
                          child: FlatButton(
                              onPressed: () => {
//                              launch(
//                                  'https://ultracoralaustralia.com/coral/partner-registration/')
                                  },
                              child: Text('Register for a partner/পার্টনার অ্যাকাউন্ট রেজিষ্টার করুন')),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
