import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/util/Validator.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController contactNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    contactNameInputController = new TextEditingController();
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
                          "নাম্বার রেজিষ্টার করুন",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          " সাইন আপ করুন/Sing up with",
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(child: Divider()),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "অথবা",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Expanded(child: Divider()),
                          ],
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
                        TextFormField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                              labelText: 'Contact Name*',
                              hintText: "John"),
                          controller: contactNameInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "দয়াকরে বৈধ নাম লিখুন/Please enter a valid first name.";
                            }
                          },
                        ),
//                    DropdownButton<String>(
//                      isExpanded: true,
//                      underline: SizedBox(),
//                      icon: Icon(Icons.keyboard_arrow_down),
//                      value: gradeValue,
//                      onChanged: (String newValue) {
////                        setState(() {
////                          gradeValue = newValue;
////                        });
//                      },
//                      hint: Text('Grade'),
//                      items:).toList(),
//                    )
//                        CheckboxListTile(
//                          value: checkboxValue,
//                          onChanged: (val) {
//                            if (checkboxValue == false) {
//                              setState(() {
//                                checkboxValue = true;
//                              });
//                            } else if (checkboxValue == true) {
//                              setState(() {
//                                checkboxValue = false;
//                              });
//                            }
//                          },
//                          title: new Text(
//                            'I agree to receive emails.',
//                            style:
//                                TextStyle(fontSize: 14.0, color: Colors.white),
//                          ),
//                          controlAffinity: ListTileControlAffinity.leading,
//                          activeColor: Colors.white,
//                        ),
//                        Container(
//                          color: Colors.green,
//                          child: CheckboxListTile(
//                            value: checkboxValue,
//                            onChanged: (val) {
//                              if (checkboxValue == false) {
//                                setState(() {
//                                  checkboxValue = true;
//                                });
//                              } else if (checkboxValue == true) {
//                                setState(() {
//                                  checkboxValue = false;
//                                });
//                              }
//                            },
//                            title: new Text(
//                              'I agree to the Terms & Conditions',
//                              style: TextStyle(fontSize: 14.0, color: Colors.white),
//                            ),
//                            controlAffinity: ListTileControlAffinity.leading,
//                            activeColor: Colors.green,
//                          ),
//                        ),
                        SizedBox(height: 22.0),
                        RaisedButton(
                          child: Text('সাইন আপ করুন'),
                          textColor: Colors.white,
                          elevation: 1.5,
                          color: Colors.deepPurple,
                          padding: EdgeInsets.all(16),
                          onPressed: () {
                            if (_registerFormKey.currentState.validate()) {
                              model.signUpUsingUsernamePassword(context, contactNameInputController.text,
                                  emailInputController.text, pwdInputController.text);
                            }
                          },
                        ),
                        SizedBox(height: 14.0),
                        Center(
                          child: InkWell(
                            onTap: () => {
                              model.gotoLogin()
//
//                              Navigator.of(context)
//                                  .pushReplacementNamed(Constants.ROUTE_LOGIN)
                            },
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে?/Already have an account? ',
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
