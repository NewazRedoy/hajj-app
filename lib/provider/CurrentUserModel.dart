import 'dart:convert';

import 'package:first_app/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserModel extends ChangeNotifier {
  List orders = [];

  CurrentUserModel() {
    _read();
  }

  _read() async {
    var prefs = await SharedPreferences.getInstance();
    String userData = prefs.getString("user");
    if (userData != null) {
      _user = new User.fromJson(userData);
      _status = Status.Authenticated;

      notifyListeners();

      List<dynamic> userList = await _getUserByEmail(_user.email);
      print(userList);
      if (userList.length != 0) {
        _user = User.fromMap(userList[0]);

        var prefs = await SharedPreferences.getInstance();
        prefs.setString("user", _user.toJson());

        fetchOrders();
      }
    } else {
      notifyListeners();

      _status = Status.Login;
    }
  }

  User _user;

  var _status = Status.Loading;

  User get user => _user;

  Status get status => _status;

  Future<void> signOut() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("user", null);

    _user = null;
    _status = Status.Login;

    notifyListeners();
  }

  Future<dynamic> _getUserByEmail(username) async {
//    var response = await RemoteConfig.wc_api
//        .getAsync("customers?email=$username&role=all");
//    print(response);
//
//    return response;
  }

  Future<dynamic> createCustomerByEmail(username, email, password, name) async {
//    Map data = {
//      "email": email,
//      "username": username,
//      "first_name": name,
//      "password": password,
//    };
//    var response = await RemoteConfig.wc_api.postAsync("customers", data);
//
//    return response;
  }

  Future<dynamic> _getOrdersByCustomer(id) async {
//    var response = await RemoteConfig.wc_api.getAsync("orders?customer=$id");

//    return response;
  }

//  bool get isPartner => true;
//  Future<void> retrieveDynamicLink(BuildContext context) async {
//    if (user == null) {
//      final PendingDynamicLinkData data =
//          await FirebaseDynamicLinks.instance.getInitialLink();
//
//      final Uri deepLink = data?.link;
//      print("deeplink  ${deepLink.toString()}");
//
//      if (deepLink != null) {
//        showSnackbar(context, "Trying to login using email link");
//
//        var _link = deepLink.toString();
//        var prefs = await SharedPreferences.getInstance();
//        var email = prefs.getString("email");
//
//        _signInWithEmailAndLink(email, _link, context);
//      }
//      return deepLink.toString();
//    }
//  }

//  Future<void> _signInWithEmailAndLink(
//      String _email, String _link, BuildContext context) async {
//    final FirebaseAuth user = FirebaseAuth.instance;
//    bool validLink = await user.isSignInWithEmailLink(_link);
//    if (validLink) {
//      try {
//        await user.signInWithEmailAndLink(email: _email, link: _link);
//        var prefs = await SharedPreferences.getInstance();
//        var password = prefs.getString("password") ?? "";
//        var name = prefs.getString("name") ?? "";
//
//        onAuthSuccessForSignUp(_email, password, name);
//      } catch (e) {
//        print(e);
//        _showDialog(context, e.toString());
//      }
//    }
//  }

  void _showDialog(
      {BuildContext context, String title = "Error", String error}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(error),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showProgressDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: LinearProgressIndicator(),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//  void sendEmailLink(BuildContext context, String email) async {
//    final FirebaseAuth user = FirebaseAuth.instance;
//    try {
//      user.sendSignInWithEmailLink(
//          email: email,
//          androidInstallIfNotAvailable: true,
//          iOSBundleID: "com.example.passwordless_login",
//          androidMinimumVersion: "21",
//          androidPackageName: "com.ultracoralaustrailia",
//          url: "https://ultracoral.page.link/rniX",
//          handleCodeInApp: true);
//    } catch (e) {
//      _showDialog(context, e.toString());
//    }
//    print(email + "<< sent");
//
//    var prefs = await SharedPreferences.getInstance();
//    prefs.setString("email", email);
//
//    _status = Status.WaitingForEmailLink;
//    notifyListeners();
//  }

  void loginUsingUsernamePassword(BuildContext context, String name,
      String username, String password) async {
    showProgressDialog(context, "Logging in");

    _user = User(
        id: 1,
        firstName: "Nabil",
        lastName: "Mosharraf",
        email: "nabil6391@gmail.com",
        avatarUrl: "",
        username: "nabil6391");

    await Future.delayed(const Duration(seconds: 2), () {});

    var prefs = await SharedPreferences.getInstance();
    prefs.setString("user", _user.toJson());

    _status = Status.Authenticated;

    notifyListeners();
    Navigator.of(context).pop();
    print("auth notified");

//
//    var response = await http.get(
//        'https://ultracoralaustralia.com/ucapi/user/generate_auth_cookie/?username=$username&password=$password');
//
//    print(response.body);
//
//    if (response.body.contains("error")) {
//      var error = json.decode(response.body)["error"];
//      Navigator.of(context).pop();
//      _showDialog(context: context, error: error);
//    } else {
//      var email = json.decode(response.body)["user"]["email"];
//
//      onAuthSuccessForSignUp(context, email, password, name);
//    }

//    AuthResult authResult = await FirebaseAuth.instance
//        .signInWithEmailAndPassword(email: email, password: password);
//
//    print("login try");
//
//    if (authResult.user != null) {
//      onAuthSuccessForSignUp(email, password, "");
//    } else {
//      _status = Status.Login;
//      notifyListeners();
//    }
  }

  void signUpUsingUsernamePassword(BuildContext context, String username,
      String name, String email, String password) async {
    showProgressDialog(context, "Signing Up");

    var userData = await createCustomerByEmail(username, email, password, name);
    if (userData["message"] != null) {
      Navigator.of(context).pop();
      _showDialog(context: context, error: userData["message"]);
    } else {
      _status = Status.WaitingForEmailLink;
      Navigator.of(context).pop();
      notifyListeners();
    }

//    FirebaseAuth.instance
//        .createUserWithEmailAndPassword(email: email, password: password)
//        .then((authResult) {
//      if (authResult.user != null) {

//    var prefs = await SharedPreferences.getInstance();
//    prefs.setString("email", email);
//    prefs.setString("password", password);
//    prefs.setString("name", name);

//    sendEmailLink(context, email);

//        onAuthSuccessForSignUp(email, password, name);
//      } else {
//        _status = Status.Login;
//        notifyListeners();
//      }
//      return;
//    }).catchError((e) {
//      showSnackbar(context, e.toString());
//    });
  }

  Future onAuthSuccessForSignUp(
      BuildContext context, String email, String password, String name) async {
    print(email);

    List<dynamic> userList = await _getUserByEmail(email);
    if (userList.length == 0) {
      var userData = await createCustomerByEmail(email, email, password, name);
      print("user  $userData");
      _user = User.fromMap(userData);
    } else {
      _user = User.fromMap(userList[0]);
      print("user found ${_user.username}");

      fetchOrders();
    }

    var prefs = await SharedPreferences.getInstance();
    prefs.setString("user", _user.toJson());

    _status = Status.Authenticated;

    notifyListeners();
    Navigator.of(context).pop();
    print("auth notified");
  }

  void showSnackbar(BuildContext context, String text) {
//    Flushbar(
//      message: text,
//      duration: Duration(seconds: 3),
//    )..show(context);
  }

  Future<void> fetchOrders() async {
//    var orderResponse = await _getOrdersByCustomer(user.id);
//
//    orders = new List<Order>.from(orderResponse.map((x) => Order.fromMap(x)));
//
//    print("fetch orders");
//
//    notifyListeners();
  }

  gotoSignup() {
    _status = Status.Signup;
    print("singup");

    notifyListeners();
  }

  gotoLogin() {
    _status = Status.Login;
    print("login");
    notifyListeners();
  }
}

enum Status { Login, Signup, WaitingForEmailLink, Authenticated, Loading }
