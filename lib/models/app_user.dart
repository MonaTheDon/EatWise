import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppUser {
  String? uid;
  String? name;
  String? username;
  String? email;
  double? height;
  double? weight;
  int? age;
  double? BMI;
  String? gender;
  List<String>? allergies;
  String? activityLevel;
  String? dietaryPreference;
  String? healthGoal;
  List<String>? likedCuisines;
  List<String>? recipeTypePreference;
  AppUser({
    this.uid,
    this.name,
    this.username,
    this.email,
    this.height,
    this.weight,
    this.age,
    this.BMI,
    this.gender,
    this.allergies,
    this.activityLevel,
    this.dietaryPreference,
    this.healthGoal,
    this.likedCuisines,
    this.recipeTypePreference,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'username': username,
      'email': email,
      'height': height,
      'weight': weight,
      'age': age,
      'BMI': BMI,
      'gender': gender,
      'allergies': allergies,
      'activityLevel': activityLevel,
      'dietaryPreference': dietaryPreference,
      'healthGoal': healthGoal,
      'likedCuisines': likedCuisines,
      'recipeTypePreference': recipeTypePreference,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      height: map['height'] != null ? map['height'] as double : null,
      weight: map['weight'] != null ? map['weight'] as double : null,
      age: map['age'] != null ? map['age'] as int : null,
      BMI: map['BMI'] != null ? map['BMI'] as double : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      allergies: map['allergies'] != null
          ? List<String>.from((map['allergies'] as List<String>))
          : null,
      activityLevel:
          map['activityLevel'] != null ? map['activityLevel'] as String : null,
      dietaryPreference: map['dietaryPreference'] != null
          ? map['dietaryPreference'] as String
          : null,
      healthGoal:
          map['healthGoal'] != null ? map['healthGoal'] as String : null,
      likedCuisines: map['likedCuisines'] != null
          ? List<String>.from((map['likedCuisines'] as List<String>))
          : null,
      recipeTypePreference: map['recipeTypePreference'] != null
          ? List<String>.from((map['recipeTypePreference'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
