import 'package:eatwise/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Map<String, dynamic> _userNutrientsMap = {};

  AppUser? _user;

  AppUser? get user => _user;
  Map<String, dynamic> get userNutrientsMap => _userNutrientsMap;

  set appUser(AppUser user) {
    _user = user;
    notifyListeners();
  }

  void updateNutrientsMap() {
    switch (_user!.activityLevel) {
      case "Sedentary":
        _userNutrientsMap = {
          "calories": [400, 500],
          "protein": [15, 20],
          "carbohydrates": [30, 40],
          "fat": [10, 15],
          "energy": [250, 350],
        };
        break;
      case "Lightly Active":
        _userNutrientsMap = {
          "calories": [400, 500],
          "protein": [20, 25],
          "carbohydrates": [50, 60],
          "fat": [15, 20],
          "energy": [350, 450],
        };
        break;
      case "Moderately Active":
        _userNutrientsMap = {
          "calories": [500, 600],
          "protein": [25, 30],
          "carbohydrates": [50, 60],
          "fat": [20, 25],
          "energy": [450, 550]
        };
        break;
      case "Very Active":
        _userNutrientsMap = {
          "calories": [600, 700],
          "protein": [30, 35],
          "carbohydrates": [60, 70],
          "fat": [25, 30],
          "energy": [550, 650]
        };
        break;
      case "Extremely Active":
        _userNutrientsMap = {
          "calories": [700, 800],
          "protein": [35, 40],
          "carbohydrates": [70, 80],
          "fat": [30, 35],
          "energy": [650, 750]
        };
        break;
    }
  }
}
