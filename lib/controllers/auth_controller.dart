import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_flutter/constants.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tik_tok_flutter/models/user.dart' as model;
import 'package:tik_tok_flutter/views/screens/auth/login_screen.dart';
import 'package:tik_tok_flutter/views/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<File?> _pickedImage;
  late Rx<User?> _user;
  File? get ProfilePhoto => _pickedImage.value;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  Future<String> uploadStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child("profileImages")
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await uploadStorage(image);
        model.User user = model.User(
            username: username,
            uid: cred.user!.uid,
            email: email,
            photoUrl: downloadUrl);
        await firestore.collection("users").doc(user.uid).set(user.toJson());
      } else {
        Get.snackbar("Error Creating Account", "Please enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error Creating Account", e.toString());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar("Profile Picture",
          "You have successfully selected your profile picture !");
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  void loginUSer(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print("log success");
      } else {
        Get.snackbar(
            "Error Sign in", "Please enter correct login and password");
      }
    } catch (e) {
      Get.snackbar("Error Sign in", e.toString());
    }
  }
}
