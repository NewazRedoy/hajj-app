import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  List myDuas = [];
  List<String> favDuaId = [];

  List<String> bookmarkId = [];

  AuthProvider() {
    _read();
  }

  _read() async {
    var prefs = await SharedPreferences.getInstance();
    String userData = prefs.getString("user");
    if (userData != null) {
      _user = new User.fromJson(userData);
      _status = Status.Authenticated;

      fetchMyDuas();

      notifyListeners();
    } else {
      notifyListeners();

      _status = Status.Login;
    }

    fetchFavDuas();
    fetchBookmark();
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

        fetchMyDuas();
      } else {
        _status = Status.Login;
      }
      notifyListeners();

      Navigator.of(context).pop();
      print("auth notified");
      return;
    }).catchError((e) {
      _showDialog(context: context, error: e.toString());
      signUpUsingUsernamePassword(context, email, password);
    });
  }

  void signUpUsingUsernamePassword(BuildContext context, String email, String password) async {
    showProgressDialog(context, "Signing Up");

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((authResult) async {
      print(authResult);
      Navigator.of(context).pop();
      if (authResult.user != null) {
        _user = User(
            id: authResult.user.uid,
            firstName: authResult.user.displayName,
            email: authResult.user.email,
            avatarUrl: authResult.user.photoUrl);

        var prefs = await SharedPreferences.getInstance();
        prefs.setString("user", _user.toJson());

        _status = Status.Authenticated;
        notifyListeners();

      } else {
        _status = Status.Login;
        notifyListeners();
      }
      return;
    }).catchError((e) {
      _showDialog(context: context, error: e.toString());
    });
  }

  Future<void> fetchMyDuas() async {
    var _duaRef = FirebaseDatabase.instance.reference().child('duas').child(user.id);
    final FirebaseDatabase database = FirebaseDatabase();

    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(900000);
    _duaRef.keepSynced(true);
    _duaRef.onValue.listen((Event event) {
      Map<dynamic, dynamic> yearMap = event.snapshot.value;

      myDuas.clear();

      yearMap.forEach((key, value) {
        myDuas.add(MyDua.fromLinkedHashMap(key, value));
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

  updateDuaColor(MyDua dua, Color color) {
    var _duaRef = FirebaseDatabase.instance.reference().child('duas').child(user.id).child(dua.key);
    _duaRef.child("color").set(color.value);
  }

  Future<void> fetchFavDuas() async {
    var prefs = await SharedPreferences.getInstance();

    favDuaId = prefs.getStringList("fav") ?? [];
  }

  Future<void> fetchBookmark() async {
    var prefs = await SharedPreferences.getInstance();

    bookmarkId = prefs.getStringList("bookmark") ?? [];
  }

  Future<void> setFavDuas(String string) async {
    var prefs = await SharedPreferences.getInstance();

    if (favDuaId.contains(string)) {
      favDuaId.remove(string);
    } else {
      favDuaId.add(string);
    }

    prefs.setStringList("fav", favDuaId);
  }

  Future<void> setBookmark(String string) async {
    var prefs = await SharedPreferences.getInstance();

    if (bookmarkId.contains(string)) {
      bookmarkId.remove(string);
    } else {
      bookmarkId.add(string);
    }

    prefs.setStringList("bookmark", bookmarkId);
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
