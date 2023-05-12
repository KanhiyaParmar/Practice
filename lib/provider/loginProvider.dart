import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elredtask/Screens/TaskScreens/taskScreen.dart';
import 'package:elredtask/Screens/splashScreen.dart';
import 'package:elredtask/modelClass/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../loginScreen.dart';
import '../utils/constant.dart';

const List<String> scopess = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

class GoogleSignInProvider extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  var _userData = UserData();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final bool _isAuthorized = false;
  GoogleSignInAccount? _currentUser;

  bool get isAuthorized => _isAuthorized;

  Future googleLogin(BuildContext context) async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      await _saveUserDatatoFirestore(googleUser);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future googleLogout(BuildContext context) async {
    try {
      await _googleSignIn.disconnect();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      //  _user = null;
      notifyListeners();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    } catch (error) {
      print(error);
    }
  }

  Future<void> _saveUserDatatoFirestore(
    GoogleSignInAccount result,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var documentReference =
        FirebaseFirestore.instance.collection("users").doc(result.id);
    _userData = getGoogleAttributes(result);
    var data = jsonEncode(_userData);
    print(data.runtimeType);
    print("===ffffffff====");

    sharedPreferences.setString("userData", data);
    print(_userData);
    print("AuthBlock");
    userLoginDetail = getGoogleAttributes(result);
    await documentReference.set(_userData.toJson(), SetOptions(merge: true));
  }

  getsharedpref(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var dataGet = sharedPreferences.getString("userData");
    notifyListeners();

    if (dataGet != null) {
      var userDetail = jsonDecode(dataGet);
      userLoginDetail = UserData.fromJson(userDetail);
      notifyListeners();
      print(userLoginDetail);
      print(
          "sharedpref is running ======================================================================");

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  UserData getGoogleAttributes(GoogleSignInAccount result) {
    UserData userData = UserData(
      id: result.id,
      email: result.email,
      name: result.displayName ?? '',
      photourl: result.photoUrl ?? '',
    );

    return userData;
  }
}
