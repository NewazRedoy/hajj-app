import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserModel.dart';
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
    return Consumer<CurrentUserModel>(builder: (context, model, _) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(46),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(180, 35),
                    bottomRight: Radius.elliptical(180, 35)),
              ),
              child: Form(
                  key: _registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          "assets/uclogo.png",
                          height: 60,
                          width: 160,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Got an account yet?\nLogin or Register free",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Log in into your account below",
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Username*',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              hintText: "john.doe"),
                          controller: emailInputController,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.emptyValidator),
                      SizedBox(height: 15.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            labelText: 'Password*',
                            hintText: "********"),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: Validator.pwdValidator,
                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: <Widget>[
////                          Checkbox(value: true,),
//                          FlatButton(
//                            child: Text(
//                              'Remember me',
//                            ),
//                            onPressed: () {
//                              Navigator.of(context)
//                                  .pushNamed(Constants.ROUTE_SINGUP);
//                            },
//                          ),
//                          Align(
//                            alignment: Alignment.centerRight,
//                            child: FlatButton(
//                              child: Text(
//                                'Forgot password?',
//                              ),
//                              onPressed: () {
//                                Navigator.of(context)
//                                    .pushNamed(Constants.ROUTE_SINGUP);
//                              },
//                            ),
//                          ),
//                        ],
//                      ),
                      SizedBox(height: 40.0),
                      RaisedButton(
                        child: Text('Login'),
                        textColor: Colors.white,
                        elevation: 3.0,
                        color: Colors.deepPurple,
                        padding: EdgeInsets.all(16),
                        onPressed: () {
                          emailInputController.text = "nabil6391@gmail.com";
                          pwdInputController.text = "63916391";

                          if (_registerFormKey.currentState.validate()) {
//                              "sales@ultracoralaustralia.com";
//                          pwdInputController.text = "Nexus20!9";

//                            Flushbar(
//                              message: "Logging in",
//                              duration: Duration(seconds: 3),
//                            )..show(context);
                            model.loginUsingUsernamePassword(
                                context,
                                "",
                                emailInputController.text,
                                pwdInputController.text);

//                            model.loginUsingUsernamePassword(
//                                context, "", "netmow", "Nexus20!9**");

//                            model.sendEmailLink(
//                                context, emailInputController.text);
                          }
                        },
                      ),
                      SizedBox(height: 15.0),
                      Center(
                        child: InkWell(
                          onTap: () => {
//                            Navigator.of(context)
//                                .pushReplacementNamed(Constants.ROUTE_SINGUP)

                            model.gotoSignup()
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: 'Don\'t have an account? ',
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SIGN UP',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Text('or login with'),
            SizedBox(height: 26.0),
            SizedBox(height: 18.0),
          ],
        ),
      );
    });
  }
}
