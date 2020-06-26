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
  TextEditingController nameInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    nameInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthProvider>(context).user;
    return Consumer<AuthProvider>(builder: (context, model, _) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
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
                          "ছবি আপলোড করুন",
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
                    ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "সাইনআপ করুন",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                    ),
                    child: SingleChildScrollView(
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
                              "সাইনআপ করুন",
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                  hintStyle: TextStyle(color: Colors.white),
                                  labelText: 'আপনার ইমেইল',
                                  hintText: "someone@gmail.com"),
                              controller: emailInputController,
                              keyboardType: TextInputType.emailAddress,
                              validator: Validator.emailValidator,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'আপনার নাম',
                                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                    hintText: "someone"),
                                controller: nameInputController,
                                keyboardType: TextInputType.emailAddress,
                                validator: Validator.emptyValidator),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                  labelText: 'পাসওয়ার্ড',
                                  hintText: "********"),
                              controller: pwdInputController,
                              obscureText: true,
                              validator: Validator.pwdValidator,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                  labelText: 'পাসওয়ার্ডটি পুণরায় লিখুন',
                                  hintText: "********"),
                              controller: pwdInputController,
                              obscureText: true,
                              validator: Validator.pwdValidator,
                            ),
                            SizedBox(height: 22.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(65, 6, 65, 6),
                              child: RaisedButton(
                                child: Text('সাইনআপ করুন'),
                                textColor: Colors.white,
                                elevation: 1.5,
                                color: Theme.of(context).primaryColor,
                                padding: EdgeInsets.all(16),
                                onPressed: () {
                                  if (_registerFormKey.currentState.validate()) {
                                    model.signUpUsingUsernamePassword(
                                        context, emailInputController.text, pwdInputController.text);
                                  }
                                },
                              ),
                            ),
//                            SizedBox(height: 14.0),
//                            Center(
//                              child: InkWell(
//                                onTap: () => {
////                              model.gotoLogin()
//
//                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()))
//                                },
//                                child: RichText(
//                                  text: TextSpan(
//                                    style: TextStyle(color: Colors.black),
//                                    text: 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে?',
//                                    children: <TextSpan>[
//                                      TextSpan(
//                                          text: 'লগইন করুন',
//                                          style: TextStyle(
//                                            fontWeight: FontWeight.bold,
//                                            color: Theme.of(context).primaryColor,
//                                          )),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
