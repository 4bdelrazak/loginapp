import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/welcome_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  //AuthController.instance ..
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  // the _user will inclde email pass and username ..
  FirebaseAuth auth = FirebaseAuth.instance;
  //auth will alows to to access the properties of firebase auth

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //whenever anything changes _user will be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage());
    }
  }

  void register(String email, String password) {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About user", "User message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
          ),
          messageText: Text(e.toString()));
    }
  }
}
