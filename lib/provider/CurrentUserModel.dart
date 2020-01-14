import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserModel extends ChangeNotifier {
  List duas = [];

  CurrentUserModel() {
    _read();
  }

  _read() async {
    var prefs = await SharedPreferences.getInstance();
    String userData = prefs.getString("user");
    if (userData != null) {
      _user = new User.fromJson(userData);
      _status = Status.Authenticated;

      fetchDuas();

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

  void _showDialog({BuildContext context, String title = "Error", String error}) {
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

  void loginUsingUsernamePassword(BuildContext context, String email, String password) async {
    showProgressDialog(context, "Logging in");

    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((authResult) async {
      if (authResult.user != null) {
        _user = User(
            id: authResult.user.uid,
            firstName: authResult.user.displayName,
            email: authResult.user.email,
            avatarUrl: authResult.user.photoUrl);

        var prefs = await SharedPreferences.getInstance();
        prefs.setString("user", _user.toJson());

        _status = Status.Authenticated;

        fetchDuas();
      } else {
        _status = Status.Login;
      }
      notifyListeners();

      Navigator.of(context).pop();
      print("auth notified");
      return;
    }).catchError((e) {
      _showDialog(context: context, error: e.toString());
      signUpUsingUsernamePassword(context, "Nabil", email, password);
    });
  }

  void signUpUsingUsernamePassword(BuildContext context, String name, String email, String password) async {
    showProgressDialog(context, "Signing Up");

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((authResult) async {
      if (authResult.user != null) {
        _user = User(
            id: authResult.user.uid,
            firstName: authResult.user.displayName,
            email: authResult.user.email,
            avatarUrl: authResult.user.photoUrl);

        var prefs = await SharedPreferences.getInstance();
        prefs.setString("user", _user.toJson());

        _status = Status.Authenticated;
      } else {
        _status = Status.Login;
        notifyListeners();
      }
      return;
    }).catchError((e) {
      _showDialog(context: context, error: e.toString());
    });
  }

  Future<void> fetchDuas() async {
    var _duaRef = FirebaseDatabase.instance.reference().child('duas').child(user.id);
    final FirebaseDatabase database = FirebaseDatabase();

    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(900000);
    _duaRef.keepSynced(true);
    _duaRef.onValue.listen((Event event) {
      Map<dynamic, dynamic> yearMap = event.snapshot.value;

      duas.clear();

      yearMap.forEach((key, value) {
        duas.add(MyDua.fromLinkedHashMap(key, value));
      });

      notifyListeners();
    }, onError: (Object o) {});
  }

  deleteDua(String key) {
    var _duaRef = FirebaseDatabase.instance.reference().child('duas').child(user.id);
    _duaRef.child(key).remove();
  }

  addDua(MyDua dua) {
    var _duaRef = FirebaseDatabase.instance.reference().child('duas').child(user.id);
    _duaRef.push().set(dua.toJson());
  }

  updateDua(MyDua dua) {
    var _duaRef = FirebaseDatabase.instance.reference().child('duas').child(user.id);
    _duaRef.child(dua.key).set(dua.toJson());
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
