import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjapp/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserModel extends ChangeNotifier {
  List orders = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  void loginUsingUsernamePassword(BuildContext context,
      String email, String password) async {
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

    AuthResult authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    print("login try");

    if (authResult.user != null) {


    } else {
      _status = Status.Login;
      notifyListeners();
    }
  }

  void signUpUsingUsernamePassword(BuildContext context, String username,
      String name, String email, String password) async {
    showProgressDialog(context, "Signing Up");

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((authResult) {
      if (authResult.user != null) {
//        var prefs = await SharedPreferences.getInstance();
//        prefs.setString("email", email);
//        prefs.setString("password", password);
//        prefs.setString("name", name);
//
//
      } else {
        _status = Status.Login;
        notifyListeners();
      }
      return;
    }).catchError((e) {});
  }


  Future<void> fetchOrders() async {
//    var orderResponse = await _getOrdersByCustomer(user.id);
//
//    orders = new List<Order>.from(orderResponse.map((x) => Order.fromMap(x)));
//
//    print("fetch orders");
//
//    notifyListeners();

    // Demonstrates configuring to the database using a file
    var _counterRef = FirebaseDatabase.instance.reference().child('counter');
    // Demonstrates configuring the database directly
    final FirebaseDatabase database = FirebaseDatabase();

    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _counterRef.keepSynced(true);
    var _counterSubscription = _counterRef.onValue.listen((Event event) {


//      setState(() {
//        _error = null;
//        _counter = event.snapshot.value ?? 0;
//      });
    }, onError: (Object o) {
//      final DatabaseError error = o;
//      setState(() {
//        _error = error;
//      });
    });
  }

//  Future<void> _increment() async {
//    // Increment counter in transaction.
//    final TransactionResult transactionResult =
//    await _counterRef.runTransaction((MutableData mutableData) async {
//      mutableData.value = (mutableData.value ?? 0) + 1;
//      return mutableData;
//    });
//
//    if (transactionResult.committed) {
//      _messagesRef.push().set(<String, String>{
//        _kTestKey: '$_kTestValue ${transactionResult.dataSnapshot.value}'
//      });
//    } else {
//      print('Transaction not committed.');
//      if (transactionResult.error != null) {
//        print(transactionResult.error.message);
//      }
//    }
//  }

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
