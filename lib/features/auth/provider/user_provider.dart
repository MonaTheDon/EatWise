import 'package:eatwise/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  AppUser? _user;

  AppUser? get user => _user;

  set appUser(AppUser user) {
    _user = user;
    notifyListeners();
  }
}
