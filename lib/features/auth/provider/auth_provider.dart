import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/app_user.dart';

final usersDB = FirebaseFirestore.instance.collection("users");

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isAuthenticated = false;
  User? _user;
  AppUser? _appUser;

  bool get isAuthenticated => _isAuthenticated;
  User? get user => _user;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  AppUser? get appUser => _appUser;

  AuthProvider() {
    loadAuthState();
  }

  void setAuthenticated(bool value, User? user) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("isAuthenticated", value);
    _prefs.setString("uid", user?.uid ?? "");
    _isAuthenticated = value;
    _user = user;
    notifyListeners();
  }

  Future<AppUser?> loadAuthState() async {
    var _prefs = await SharedPreferences.getInstance();
    var uid = _prefs.getString("uid");
    if (uid != null) {
      _appUser = await getUser(uid);
    }
    // _isAuthenticated = _prefs.getBool("isAuthenticated") ?? false;
    // if (_isAuthenticated) {
    //   var uid = _prefs.getString("uid");
    // }
    // notifyListeners();
    // return uid;
    return _appUser;
  }

  static Future<void> registerUser(AppUser user) async {
    log(user.uid ?? "UID IS NULL IN REGISTER USER, auth_provider.dart line 41");
    await usersDB.doc(user.uid).set(user.toMap());
  }

  static Future<AppUser?> getUser(String uid) async {
    try {
      final docSnap = await usersDB.doc(uid).get();
      var data = docSnap.data();
      if (data != null) {
        return AppUser.fromMap(data);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<UserCredential?> registerUserWithEmail(
      String username, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: "$username@eatwise.com", password: password);
      return result;
    } on FirebaseAuthException catch (firebaseAuthException) {
      if (firebaseAuthException.code == "email-already-in-use") {
        Fluttertoast.showToast(msg: "Username already taken");
        print(firebaseAuthException.message);
        return null;
      } else {
        Fluttertoast.showToast(msg: firebaseAuthException.message.toString());
        print(firebaseAuthException.message);
        return null;
      }
    }
  }

  Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: "$email@eatwise.com", password: password);
      setAuthenticated(true, result.user);

      return result;
    } on FirebaseAuthException catch (firebaseAuthException) {
      Fluttertoast.showToast(msg: firebaseAuthException.message.toString());
      print(
          "${firebaseAuthException.message} error at line 88 auth_provider.dart");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    setAuthenticated(false, null);
  }
}
