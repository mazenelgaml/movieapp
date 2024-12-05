import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/models/user_model.dart';



class UserDataServices {

  final DatabaseReference _UserRef =
  FirebaseDatabase.instance.ref().child('User');
  Future<void> saveUser(UserModel User) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? userId = prefs.getString('uid');
    _UserRef.child(userId??"").push().set(User.toJson());
  }
  Future<List<UserModel>> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('uid');

    final snapshot   = await _UserRef.child(userId??"").get();

    print(snapshot.value); // to debug and see if data is returned

    List<UserModel> users = [];

    final Map<dynamic, dynamic>  map = snapshot.value as Map<dynamic, dynamic>;
    map.forEach((key, value) {
      final User = UserModel.fromMap(value);

      users.add(User);
    });

    return users;
  }  }

